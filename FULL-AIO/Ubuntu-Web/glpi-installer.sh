#!/bin/sh

#Configuration
ip4_local="" # Local IPV4 of server exemple 10.0.0.1
ip6_local="" # Local IPV6 of server exemple 111dd:c15dv:15vd1::100
ip4_myIP="" # Your own IPv4 for SSH exemple 10.0.0.1
ip6_myIP="" # Your own IPv6 for SSH exemple 111dd:c15dv:15vd1::100
domain="alexonbstudio.fr" # Replace with this domain name by your own
server="desktop"
server_final="server.alexonbstudio.fr"
# basse de donnée SQL
SQL_USER_DB="user"
SQL_PASSWD_DB="password"
SQL_HOST_DB="localhost"


sudo -i

echo "
#############################################
#											#
#	Copyright 2021 BY AlexonbStudio			#
#	final GLPI install  					#
#											#
#############################################
"
apt update && sudo apt upgrade -y

	# Resolv conf 
	echo "
   #Cloudflare DNS+Anti-malware 

	nameserver 1.1.1.2 
	nameserver 1.0.0.2 
	nameserver 2606:4700:4700::1112 
	nameserver 2606:4700:4700::1002
	" >> /etc/resolv.conf 

apt install -y  curl openssl apache2 certbot python3-certbot-apache2 ufw mariadb-server mariadb-client php7.4 libapache2-mod-php7.4 php7.4-common php7.4-gmp php7.4-curl php7.4-intl php7.4-mbstring php7.4-xmlrpc php7.4-mysql php7.4-gd php7.4-imap php7.4-ldap php-cas php7.4-bcmath php7.4-xml php7.4-cli php7.4-zip php7.4-sqlite3 php7.4-apcu php7.4-bz2
   
   #ufw reset 
	ufw allow 22/tcp
	ufw allow from ${ip4_myIP} to any port 22 proto tcp # myipV4
	ufw allow from 192.168.*.* to any port 22 proto tcp
   ufw allow from ${ip6_myIP} to any port 22 proto tcp  # myipV6
   ufw allow proto tcp from any to any port 80,443  && uufw allow 53 && ufw enable && uufw logging on && ufw reload


systemctl enable apache2.service && /lib/systemd/systemd-sysv-install enable apache2
systemctl enable mariadb.service && /lib/systemd/systemd-sysv-install enable mariadb

systemctl apache2 && systemctl mariadb
echo "
#
#file_uploads = On
#allow_url_fopen = On
#short_open_tag = On
#memory_limit = 256M
#upload_max_filesize = 100M
#max_execution_time = 360
#max_input_vars = 1500
#date.timezone = Europe/Paris
#
"

cp /etc/php/7.4/apache2/php.ini.old && echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php && sudo nano /etc/php/7.4/apache2/php.ini 

echo "
#Set root password? [Y/n]: Y
#New password: Nouveau mot de passe
#Re-enter new password: Nouveau mot de passe
#Remove anonymous users? [Y/n]: Y
#Disallow root login remotely? [Y/n]: Y
#Remove test database and access to it? [Y/n]: Y
#Reload privilege tables now? [Y/n]: Y

"

#########
mysql_secure_installation



mysql -u root -p
CREATE DATABASE glpi;
CREATE USER '${SQL_USER_DB}'@'${SQL_HOST_DB}' IDENTIFIED BY '${SQL_PASSWD_DB}';
GRANT ALL ON glpi.* TO '${SQL_USER_DB}'@'${SQL_HOST_DB}' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;

mkdir -p tmp && cd /tmp && wget https://github.com/glpi-project/glpi/releases/download/9.5.5/glpi-9.5.5.tgz && tar -xvf glpi-9.5.5.tgz && sudo mv glpi /var/www/glpi && sudo chown -R www-data:www-data /var/www/glpi/ && sudo chmod -R 755 /var/www/glpi/

echo "
<VirtualHost *:80>
     ServerAdmin admin@${domain}
     DocumentRoot /var/www/glpi
     ServerName ${domain}
     ServerAlias www.${domain}

     <Directory /var/www/glpi/>
        Options +FollowSymlinks
        AllowOverride All
        Require all granted
     </Directory>

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
" > /etc/apache2/sites-available/glpi.conf

a2ensite glpi.conf && sudo a2enmod rewrite && sudo systemctl restart apache2.service

hostnamectl set-hostname ${server_final} #replace by old echo "hostname" > /etc/hostname
ls /etc/apache2/sites-enabled/ && sudo rm /etc/apache2/sites-enabled/000-default.conf && rm -rf /var/www/glpi/install/ && sudo rm /var/www/html/phpinfo.php && certbot --apache -d ${domain} -d ${server_final} --non-interactive --force-renewal --quiet && systemctl restart apache2

	# crontab -e 
	(crontab -l 2>>/dev/null; echo "@weekly rm -rf /var/log/apache2/.log
	@monthly rm -rf /var/log/apt/.log
	@monthly rm -rf /var/log/journal/.log
	@monthly rm -rf /var/log/letsencrypt/.log
	@weekly apt update && apt upgrade -y
	* * * */6 * reboot now
	* * * */2 * certbot --apache -d ${domain} -d ${server_final} --non-interactive --force-renewal --quiet && systemctl restart apache2") | crontab -

