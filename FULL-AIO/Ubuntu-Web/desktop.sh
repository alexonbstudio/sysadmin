#!/bin/sh

#Configuration
ip4_local="" # Local IPV4 of server exemple 10.0.0.1
ip6_local="" # Local IPV6 of server exemple 111dd:c15dv:15vd1::100
ip4_myIP="" # Your own IPv4 for SSH exemple 10.0.0.1
ip6_myIP="" # Your own IPv6 for SSH exemple 111dd:c15dv:15vd1::100
domain="alexonbstudio.fr" # Replace with this domain name by your own
server="desktop"
server_final="$server.$domain"



echo "
#############################################
#											#
#	Copyright 2020 BY AlexonbStudio			#
#	BETA 1.0 | VNC server					#
#											#
#############################################
"


	hostnamectl set-hostname ${server_final}
	
	apt-get update && apt-get upgrade -y
	apt update && apt upgrade -y
	apt-get install software-properties-common && add-apt-repository universe


	# Resolv conf 
	echo "
	#Cloudflare DNS+Anti-malware 
	nameserver 1.1.1.2 
	nameserver 1.0.0.2 
	nameserver 2606:4700:4700::1112 
	nameserver 2606:4700:4700::1002" >> /etc/resolv.conf 
	
	

	# HOST
	if [ -z $ip4_local ]; then
		echo "$ip4_local $server_final" >> /etc/hosts
	fi
	if [ -z $ip6_local ]; then
		echo "$ip6_local $server_final" >> /etc/hosts
	fi
	echo "
	127.0.0.1 $server_final
	::1 $server_final
	" >> /etc/hosts

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
#	ufw allow lo

	# VNC
	ufw allow 5901

	# NAT
#	ufw allow nat

	# DNS
	ufw allow 53

	# ICMP (Ping)
#	ufw allow icmp

	ufw logging on 

	ufw enable	
	
	# security
	chown root:root passwd shadow group gshadow
	chmod 644 passwd group
	chmod 400 shadow gshadow
	chmod g-w /home/${SUDO_USER} /home/${USER}
	chmod o-rwx /home/${SUDO_USER} /home/${USER}
		
	
	apt install -y clamav clamav-daemon nginx fail2ban net-tools ufw curl openssl nginx certbot python3-certbot-nginx
	
	#anwser Y then enter
	########		SERVER WEB		########
	systemctl enable nginx 
	 /lib/systemd/systemd-sysv-install enable nginx

	########		ANTIVIRUS		########
	systemctl enable clamav-freshclam 
	 /lib/systemd/systemd-sysv-install enable clamav-freshclam

	########		FAILTOBAN		########
	systemctl enable fail2ban
	 /lib/systemd/systemd-sysv-install enable fail2ban


	rm -rf /var/www/html/*	
	
	echo "
	<html>
		<head>
			<title>Desktop Server</title>
		</head>
		<body>
			<h1>Desktop Server</h1>
			<p>More information by <a href=\"https://alexonbstudio.fr\">@alexonbstudio</a></p>
		</body>
	</html>
	" > /var/www/html/index.html
	
	echo "server {
			listen 80;
			listen [::]:80;
			root /var/www/html;
			index index.html;

			server_name $server_final;

			location / {
					try_files $uri $uri/ =404;
			}

			#DENY HTACCESS
			#location ~ /\.ht {
			#	   deny all;
			#}
	}" > "/etc/nginx/sites-available/$server_final"		
	
	
	unlink /etc/nginx/sites-enabled/default || rm -rf /etc/nginx/sites-enabled/default
	unlink /etc/nginx/sites-available/default || rm -rf /etc/nginx/sites-available/default
	ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/*
	systemctl restart nginx	
	
	#SSL
	certbot renew --pre-hook "systemctl stop nginx" --post-hook "systemctl start nginx"
	certbot -d ${server_final}
	chmod 0755 /etc/letsencrypt/{live,archive}

	# crontab -e 
	(crontab -l 2>>/dev/null; echo "
	@monthly rm -rf /var/log/apt/.log
	@monthly rm -rf /var/log/nginx/.log
	@monthly rm -rf /var/log/clamav/.log
	@monthly rm -rf /var/log/journal/.log
	@weekly apt update && apt upgrade -y
	@weekly apt-get update && apt-get upgrade -y
	@daily systemctl stop clamav-freshclam && freshclam --quiet && systemctl start clamav-freshclam
	* * * */2 * certbot --nginx -d $server_final --non-interactive --force-renewal --quiet && systemctl restart nginx
	") | crontab -	
	
	cd /home/${SUDO_USER}/ && curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/desktop/gnom-vnc.sh
	chown -hR ${SUDO_USER} /home/${SUDO_USER}/gnom-vnc.sh
	echo "I return the user normal  (not root user) access to cd /home/$SUDO_USER/ & then lunch ./gnom-vnc.sh"