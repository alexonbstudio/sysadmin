#!/bin/sh

#Configuration
domain="exemple.tld" #edit this line by your own domain name (your-name.tld)
name="Website Project WP" # Edit this line to pub your own name
php_version="7.4" # default Ubuntu 20.04
ip4_local="" # Local IPV4 of server exemple 10.0.0.1
ip6_local="" # Local IPV6 of server exemple 111dd:c15dv:15vd1::100
ip4_myIP="" # Your own IPv4 for SSH exemple 10.0.0.1
ip6_myIP="" # Your own IPv6 for SSH exemple 111dd:c15dv:15vd1::100

# Dont touch IT
server="server"
server_final="$server.$domain"
www="www"
www_final="$www.$domain"

clear

echo "
#############################################
#											#
#	Copyright 2020 BY AlexonbStudio			#
#											#
#											#
#############################################
"


if [ $USER != "root" ]; then
	# Update
	hostnamectl set-hostname ${server_final}
	
	apt-get update && apt-get upgrade -y
	apt update && apt upgrade -y
	apt-get install software-properties-common && add-apt-repository universe
	
	# Install PKG
	apt install -y curl openssl apache2 certbot python3-certbot-apache2 clamav clamav-daemon fail2ban net-tools ufw zip unzip mariadb-server php php-xml php-fpm php-cli php-curl php-mysql php-gd php-mbstring php-imagick php-intl php-xml php-zip php-cgi php-xmlrpc php-soap tidy php-tidy sqlite php-pear -y
	########		SERVER WEB		########
	systemctl enable apache2 
	 /lib/systemd/systemd-sysv-install enable apache2

	########		ANTIVIRUS		########
	systemctl enable clamav-freshclam 
	 /lib/systemd/systemd-sysv-install enable clamav-freshclam

	########		FAILTOBAN		########
	systemctl enable fail2ban
	 /lib/systemd/systemd-sysv-install enable fail2ban
	 
	########		PHP-FPM		########
	systemctl enable php${php_version}-fpm
	 /lib/systemd/systemd-sysv-install enable php${php_version}-fpm
	 
	# Resolv conf 
	echo "
	#Cloudflare DNS+Anti-malware 
	nameserver 1.1.1.2 
	nameserver 1.0.0.2 
	nameserver 2606:4700:4700::1112 
	nameserver 2606:4700:4700::1002" >> /etc/resolv.conf 
	
	# HOST
	if [ -z $ip4_local ]; then
		echo "$ip4_local $domain $server_final $www_final" >> /etc/hosts
	fi
	if [ -z $ip6_local ]; then
		echo "$ip6_local $domain $server_final $www_final" >> /etc/hosts
	fi
	echo "127.0.0.1 $domain $server_final $www_final" >> /etc/hosts

	#UFW
	# Vider les tables actuelles
	iptables -t filter -F

	# Vider les règles personnelles
	iptables -t filter -X

	# deleted old & reset firewall
	#ufw reset 
	
	# SSH
	ufw allow 22/tcp
	
	# Except access SSH only MyIP
	if [ -z $ip4_myIP ]; then
		ufw allow from ${ip4_myIP} to any port 22 proto tcp
		ufw reload
	fi
	if [ -z $ip6_myIP ]; then
		ufw allow from ${ip6_myIPc} to any port 22 proto tcp
		ufw reload
	fi
	# HTTP(S)
	ufw allow proto tcp from any to any port 80,443 

	# loopback
	ufw allow lo

	# NAT
	ufw allow nat

	# DNS
	ufw allow 53

	# EMAIL
	ufw allow proto tcp from any to any port 25,587,993

	# ICMP (Ping)
	ufw allow icmp

	ufw logging on 

	ufw enable	
	
	# security
	chown root:root passwd shadow group gshadow
	chmod 644 passwd group
	chmod 400 shadow gshadow
	chmod g-w /home/${SUDO_USER} /home/${USER}
	chmod o-rwx /home/${SUDO_USER} /home/${USER}
	
	rm -rf /var/www/html/*	/var/www/html
	
	#Server web
	mkdir -p /var/www/${domain} /var/www/${server_final}
	
	#Composer project basic for not production using just testing
	curl -O https://getcomposer.org/download/1.10.7/composer.phar

	 
	EXPECTED_SIGNATURE = $( wget -q -O - https://composer.github.io/installer.sig ) 
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" 

	ACTUAL_SIGNATURE = $( php -r "echo hash_file('SHA384', 'composer-setup.php');" ) 

	if [ " $EXPECTED_SIGNATURE " ! = " $ACTUAL_SIGNATURE " ]; then>&2 

		echo 'ERROR: Invalid installer signature' 
		rm -f composer-setup.php
		mv -f composer.phar /usr/local/bin/composer
	exit 1 
		
	fi 
		php composer-setup.php --quiet RESULT = $? 
		rm -f composer-setup.php
		mv -f composer.phar /usr/local/bin/composer


	# Update composer
	composer self-update
	
	# install Website Project WP & autoload with update all
	composer require alexonbstudio/website-project --no-dev
	composer install --no-dev
	composer update --no-dev
	composer dump-autoload --no-dev
	composer clearcache
	
	#NOT use 
	#curl -O https://github.com/alexonbstudio/website-project/archive/1.7.0.tar.gz
	#tar -zvxf 1.7.0.tar.gz
	#echo "" > "/var/www/"${domain}"/website-project-1.7.0/configuration/sites.php"
	#rm -rf 1.7.0.tar.gz
	#PHP
	echo "<?php 
		header('Location: https://"${domain}"'); 
		exit();
	?>" > /var/www/${server_final}/index.php
	
	chown -R ${SUDO_USER}:${SUDO_USER} /var/www/${server_final}/index.php /var/www/${domain}/*
	# config apache2
	cp /etc/apache2/sites-available/default /etc/apache2/sites-available/$domain
	cp /etc/apache2/sites-available/default /etc/apache2/sites-available/$server_final	
	
	unlink /etc/apache2/sites-enabled/default || rm -rf /etc/apache2/sites-enabled/default
	unlink /etc/apache2/sites-available/default || rm -rf /etc/apache2/sites-available/default
	ln -s /etc/apache2/sites-available/* /etc/apache2/sites-enabled/*
	systemctl restart apache2
	a2enmod proxy_fcgi setenvif
	a2enconf php${php_version}-fpm 
	systemctl reload apache2
	#SSL
	#certbot renew --pre-hook "systemctl stop apache2" --post-hook "systemctl start apache2"
	certbot -d ${domain} -d ${server_final} -d ${www_final}
	chmod 0755 /etc/letsencrypt/{live,archive}
	
	
	# crontab -e 
	(crontab -l 2>>/dev/null; echo "@weekly rm -rf /var/log/apache2/.log
	@monthly rm -rf /var/log/apt/.log
	@monthly rm -rf /var/log/clamav/.log
	@monthly rm -rf /var/log/journal/.log
	@monthly rm -rf /var/log/letsencrypt/.log
	@weekly apt update && apt upgrade -y
	@weekly apt-get update && apt-get upgrade -y
	@daily systemctl stop clamav-freshclam && freshclam --quiet && systemctl start clamav-freshclam
	* * * */6 * reboot now
	* * * */2 * certbot --apache -d $domain -d $server_final -d $www_final --non-interactive --force-renewal --quiet && systemctl restart apache2") | crontab -
	
	reboot now
	

fi

echo "Sorry this script need sudo -i (ROOT user)"
