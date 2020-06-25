#!/bin/bash
clear 
if [ ${whoami} != "root"  ]; then
	sudo -i 
	apt-get update && apt-get upgrade -y
	apt-get install software-properties-common && add-apt-repository universe
	echo -e "====== AUTO install NEED OPENSSL/NGINX/CERTBOT/MARIADB/ANTIVIRUS/FAIL2BAN/PHP for using CMS populare ======\n"
	apt install curl zip unzip openssl nginx certbot python3-certbot-nginx mariadb-server php php-xml php-fpm php-cli php-curl php-mysql php-gd php-mbstring php-imagick php-intl php-xml php-zip php-cgi php-xmlrpc php-soap tidy php-tidy sqlite php-pear clamav clamav-daemon fail2ban -y
	echo -e "====== The installation is done ======"
	#apt purge && apt clean && apt autoremove
	#clear
else
	apt-get update && apt-get upgrade -y
	apt-get install software-properties-common && add-apt-repository universe
	echo -e "====== AUTO install NEED OPENSSL/NGINX/CERTBOT/MARIADB/ANTIVIRUS/FAIL2BAN/PHP for using CMS populare ======\n"
	apt install curl zip unzip openssl nginx certbot python3-certbot-nginx mariadb-server php php-xml php-fpm php-cli php-curl php-mysql php-gd php-mbstring php-imagick php-intl php-xml php-zip php-cgi php-xmlrpc php-soap tidy php-tidy sqlite php-pear clamav clamav-daemon fail2ban -y
	echo -e "\n====== The installation is done ======\n\n"
	#apt purge && apt clean && apt autoremove
	
	
fi

