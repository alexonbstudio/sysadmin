#!/bin/bash
##################################"
##
##		SCRIPTING BY alexonbstudio
##
##################################"


##### ALLL APACHE HERE && RECOMMANDATION WEB SERVER CUSTOM LEMP
clear 
if [ ${whoami} != "root" || $USER = "root"  ]; then
	sudo -i # not surly
	apt-get update && apt-get upgrade -y
	apt-get install software-properties-common && add-apt-repository universe
	echo -e "====== AUTO install NEED OPENSSL/NGINX/CERTBOT/MARIADB/ANTIVIRUS/FAIL2BAN/PHP for using CMS populare ======\n"
	apt install curl zip unzip openssl nginx certbot python3-certbot-nginx mariadb-server php php-xml php-fpm php-cli php-curl php-mysql php-gd php-mbstring php-imagick php-intl php-xml php-zip php-cgi php-xmlrpc php-soap tidy php-tidy sqlite php-pear clamav clamav-daemon fail2ban net-tools -y
	echo -e "====== The installation is done ======"


fi
	sudo -i
	apt-get update && apt-get upgrade -y
	apt-get install software-properties-common && add-apt-repository universe
	echo -e "====== AUTO install NEED OPENSSL/NGINX/CERTBOT/MARIADB/ANTIVIRUS/FAIL2BAN/PHP for using CMS populare ======\n"
	apt install curl zip unzip openssl nginx certbot python3-certbot-nginx mariadb-server php php-xml php-fpm php-cli php-curl php-mysql php-gd php-mbstring php-imagick php-intl php-xml php-zip php-cgi php-xmlrpc php-soap tidy php-tidy sqlite php-pear clamav clamav-daemon fail2ban net-tools -y
	echo -e "\n====== The installation is done ======\n\n"


	echo -e "\n\nSystemctl using easier recommandation\n\n"
	systemctl enable nginx && /lib/systemd/systemd-sysv-install enable nginx
	systemctl enable clamav-freshclam && /lib/systemd/systemd-sysv-install enable clamav-freshclam
	systemctl enable faiil2ban && /lib/systemd/systemd-sysv-install enable faiil2ban
	echo -e "\n\nThe notice recommand\n\n"
	
	
	###### WAITING FOR PHP7.4 ubuntu / PHP7.3 DEBIAN DIFFF
# TODO
#	if [ -z php7.4 ]; then
#		
#	fi




	###### Start now install mysql secure
	mysql_secure_installation



#### now configuration DB sql
# TODO
















################			DONE		################
#deteled old on tmp folder
rm -rf /tmp/*

