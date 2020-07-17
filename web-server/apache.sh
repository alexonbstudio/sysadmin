#!/bin/bash


##################################"
##
##		SCRIPTING BY alexonbstudio
##
##################################"

##### ALLL APACHE HERE && RECOMMANDATION WEB SERVER CUSTOM LAMP
clear 
if [ ${whoami} != "root" || $USER = "root"  ]; then
	#sudo -i # not surly
	apt-get update && apt-get upgrade -y
	apt-get install software-properties-common && add-apt-repository universe
	echo -e "====== AUTO install NEED OPENSSL/APACHE/CERTBOT/MARIADB/ANTIVIRUS/FAIL2BAN/PHP for using CMS populare ======\n"
	echo -e "\n\n====== CMS PHP Works WORDPRESS/JOOMLA/DRUPAL ======\n\n"
	apt install curl zip unzip openssl apache2 certbot python3-certbot-apache mariadb-server php php-xml php-fpm php-cli php-curl php-mysql php-gd php-mbstring php-imagick php-intl php-xml php-zip php-cgi php-xmlrpc php-soap tidy php-tidy sqlite php-pear clamav clamav-daemon fail2ban net-tools -y
	echo -e "\n\n====== The installation is done ======\n\n"
	#apt purge && apt clean && apt autoremove
	#clear

fi

	apt-get update && apt-get upgrade -y
	apt-get install software-properties-common && add-apt-repository universe
	echo -e "====== AUTO install NEED OPENSSL/APACHE/CERTBOT/MARIADB/ANTIVIRUS/FAIL2BAN/PHP for using CMS populare ======\n"
	echo -e "\n====== CMS PHP Works WORDPRESS/JOOMLA/DRUPAL ======\n\n"
	apt install curl zip unzip openssl apache2 certbot python3-certbot-apache mariadb-server php php-xml php-fpm php-cli php-curl php-mysql php-gd php-mbstring php-imagick php-intl php-xml php-zip php-cgi php-xmlrpc php-soap tidy php-tidy sqlite php-pear clamav clamav-daemon fail2ban net-tools -y
	echo -e "\n\n====== The installation is done ======\n\n"

	echo -e "\n\nSystemctl using easier recommandation\n\n"
	systemctl enable apache2 
	/lib/systemd/systemd-sysv-install enable apache2
	systemctl enable clamav-freshclam
	/lib/systemd/systemd-sysv-install enable clamav-freshclam
	systemctl enable faiil2ban
	/lib/systemd/systemd-sysv-install enable faiil2ban
	
	
	
	###### WAITING FOR PHP7.4 ubuntu / PHP7.3 DEBIAN DIFFF
# TODO
#	if [ -z php7.4 ]; then
#		
#	fi


	
	echo -e "\n\nThe notice recommand do automate for you do nothing\n\n"
	
	
	# Automate do the notice have
	a2enmod proxy_fcgi setenvif
	a2enconf php7.4-fpm # ubuntu 20.04 system version default
	a2enconf php7.3-fpm # debian 10 system version default
	systemctl reload apache2


	###### Start now install mysql secure
	#mysql_secure_installation

#### now configuration DB sql
# TODO

rm -r /var/www/html/*
echo "HELLO WORLD INSTALL by @Alexonbstudio SYSADMIN" > /var/www/html/index.html
chown -R ${SUDO_USER}:${SUDO_USER} /var/www/html/
chown -R ${SUDO_USER}:${SUDO_USER} /var/www/html/*





#PENDING
cd /etc/apache2/sites-available/
cp default dev.alexonbstudio.fr
cp default default.back
unlink /etc/apache2/sites-enabled/default || rm -rf /etc/apache2/sites-enabled/default
sudo ln -s /etc/apache2/sites-available/dev.alexonbstudio.fr /etc/apache2/sites-enabled/dev.alexonbstudio.fr



systemctl restart apache2










################			DONE		################
#deteled old on tmp folder
rm -rf /tmp/*

exit
