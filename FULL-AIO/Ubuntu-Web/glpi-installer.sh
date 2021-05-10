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
#	final GLPI install  					#
#											#
#############################################
"
sudo apt update
sudo apt upgrade


sudo apt install apache2 mariadb-server mariadb-client php7.4 libapache2-mod-php7.4 php7.4-common php7.4-gmp php7.4-curl php7.4-intl php7.4-mbstring php7.4-xmlrpc php7.4-mysql php7.4-gd php7.4-imap php7.4-ldap php-cas php7.4-bcmath php7.4-xml php7.4-cli php7.4-zip php7.4-sqlite3 php7.4-apcu php7.4-bz2


sudo systemctl stop apache2.service
sudo systemctl start apache2.service
sudo systemctl enable apache2.service
sudo systemctl stop mariadb.service
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service



#########
sudo mysql_secure_installation

#Set root password? [Y/n]: Y
#New password: Nouveau mot de passe
#Re-enter new password: Nouveau mot de passe
#Remove anonymous users? [Y/n]: Y
#Disallow root login remotely? [Y/n]: Y
#Remove test database and access to it? [Y/n]: Y
#Reload privilege tables now? [Y/n]: Y
#sudo nano /etc/php/7.4/apache2/php.ini

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

sudo nano /var/www/html/phpinfo.php
<?php phpinfo( ); ?>


sudo mysql -u root -p
CREATE DATABASE glpi;
CREATE USER 'glpiuser'@'localhost' IDENTIFIED BY 'new_password_here';
GRANT ALL ON glpi.* TO 'glpiuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;

cd /tmp
wget https://github.com/glpi-project/glpi/releases/download/9.5.5/glpi-9.5.5.tgz
tar -xvf glpi-9.5.5.tgz
sudo mv glpi /var/www/glpi
sudo chown -R www-data:www-data /var/www/glpi/
sudo chmod -R 755 /var/www/glpi/

sudo nano /etc/apache2/sites-available/glpi.conf

<VirtualHost *:80>
     ServerAdmin admin@example.com
     DocumentRoot /var/www/glpi
     ServerName example.com
     ServerAlias www.example.com

     <Directory /var/www/glpi/>
        Options +FollowSymlinks
        AllowOverride All
        Require all granted
     </Directory>

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>




sudo a2ensite glpi.conf
sudo a2enmod rewrite
sudo systemctl restart apache2.service

sudo nano /etc/hostname
ls /etc/apache2/sites-enabled/
sudo rm /etc/apache2/sites-enabled/000-default.conf

sudo rm -rf /var/www/glpi/install/ && sudo rm /var/www/html/phpinfo.php