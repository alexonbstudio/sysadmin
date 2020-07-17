#!/bin/bash
##################################"
##
##		SCRIPTING BY alexonbstudio
##
##################################"


##### ALLL APACHE HERE && RECOMMANDATION WEB SERVER CUSTOM LEMP
clear 
if [ ${whoami} != "root" || $USER = "root"  ]; then
	#sudo -i # not surly
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
	systemctl enable nginx
	/lib/systemd/systemd-sysv-install enable nginx
	systemctl enable clamav-freshclam
	/lib/systemd/systemd-sysv-install enable clamav-freshclam
	systemctl enable faiil2ban
	/lib/systemd/systemd-sysv-install enable faiil2ban
	echo -e "\n\nThe notice recommand\n\n"
	
	
	###### WAITING FOR PHP7.4 ubuntu / PHP7.3 DEBIAN DIFFF
# TODO
#	if [ -z php7.4 ]; then
#		
#	fi




	###### Start now install mysql secure
	#mysql_secure_installation



#### now configuration DB sql
# TODO


#nano /etc/php/7.4/fpm/php.ini
#cgi.fix_pathinfo = 0 #uncomment this
#nano /etc/nginx/nginx.conf
#server_tokens off; #uncomment this
#cp /etc/nginx/sites-available/default /etc/nginx/sites-available/dev.alexonbstudio.fr
#rm -rf /etc/nginx/sites-available/default
#nano /etc/nginx/sites-available/dev.alexonbstudio.fr
#fastcgi_pass unix:/run/php/php7.4-fpm.sock; #uncomment this between Server{...} => on location 



rm -r /var/www/html/*
echo "HELLO WORLD INSTALL by @Alexonbstudio SYSADMIN" > /var/www/html/index.html
chown -R ${SUDO_USER}:${SUDO_USER} /var/www/html/
chown -R ${SUDO_USER}:${SUDO_USER} /var/www/html/*





#PENDING
cd /etc/nginx/sites-available/
cp default dev.alexonbstudio.fr
cp default default.back
echo "
server {
        listen 80;
        listen [::]:80;
        root /var/www/html;
        index index.php index.html;

        server_name _;

        location / {
                try_files $uri $uri/ =404;
        }

        # pass PHP scripts to FastCGI server
        #location ~ \.php$ {
        #       include snippets/fastcgi-php.conf;
        #
        #       # With php-fpm (or other unix sockets):
        #       fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
        #       # With php-cgi (or other tcp sockets):
        #       fastcgi_pass 127.0.0.1:9000;
        #}

		#DENY HTACCESS
        location ~ /\.ht {
               deny all;
        }
}
"
unlink /etc/nginx/sites-enabled/default || rm -rf /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/*



systemctl restart nginx





################			DONE		################
#deteled old on tmp folder
rm -rf /tmp/*


exit
