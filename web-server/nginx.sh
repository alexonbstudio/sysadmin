#!/bin/bash
clear 
if [ ${whoami} != "root" || $USER = "root"  ]; then
	sudo -i 
	apt-get update && apt-get upgrade -y
	apt-get install software-properties-common && add-apt-repository universe
	echo -e "====== AUTO install NEED OPENSSL/NGINX/CERTBOT/MARIADB/ANTIVIRUS/FAIL2BAN/PHP for using CMS populare ======\n"
	apt install curl zip unzip openssl nginx certbot python3-certbot-nginx mariadb-server php php-xml php-fpm php-cli php-curl php-mysql php-gd php-mbstring php-imagick php-intl php-xml php-zip php-cgi php-xmlrpc php-soap tidy php-tidy sqlite php-pear clamav clamav-daemon fail2ban -y
	echo -e "====== The installation is done ======"
	#apt purge && apt clean && apt autoremove
	#clear
else
	sudo -i
	apt-get update && apt-get upgrade -y
	apt-get install software-properties-common && add-apt-repository universe
	echo -e "====== AUTO install NEED OPENSSL/NGINX/CERTBOT/MARIADB/ANTIVIRUS/FAIL2BAN/PHP for using CMS populare ======\n"
	apt install curl zip unzip openssl nginx certbot python3-certbot-nginx mariadb-server php php-xml php-fpm php-cli php-curl php-mysql php-gd php-mbstring php-imagick php-intl php-xml php-zip php-cgi php-xmlrpc php-soap tidy php-tidy sqlite php-pear clamav clamav-daemon fail2ban net-tools -y
	echo -e "\n====== The installation is done ======\n\n"


	
fi
	mysql_secure_installation

	echo -e "\n\nSystemctl using easier recommandation\n\n"
	systemctl enable nginx && /lib/systemd/systemd-sysv-install enable nginx
	systemctl enable clamav-freshclam && /lib/systemd/systemd-sysv-install enable clamav-freshclam
	systemctl enable faiil2ban && /lib/systemd/systemd-sysv-install enable faiil2ban
	echo -e "\n\nThe notice recommand\n\n"
	
#	if [ -z php7.4 ]; then
#		
#	fi
