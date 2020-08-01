#!/bin/sh

clear
sudo -i

#apt install -y apt-transport-https ca-certificates apache2 apache2-utils php-fpm php libapache2-mod-php php-mysql php-curl php-json php-gd php-msgpack php-intl php-gmp php-mbstring php-redis php-xml php-zip php-cli php-common php-opcache php-readline
#echo "
#ServerSignature Off
#ServerTokens Prod
#TraceEnable Off
#" >> 

#rm -rf /var/www/html/*

#a2enmod php7.4

#cp /etc/php/7.4/apache2/php.ini /etc/php/7.4/apache2/php.ini.backup

#systemctl restart apache2
apt install apt-transport-https -y

#Tor install
echo "
# Dépôts du Tor Project ubuntu 18.04 TLS stable
deb https://deb.torproject.org/torproject.org bionic main
deb-src https://deb.torproject.org/torproject.org bionic main
" >> /etc/apt/sources.list.d/tor.list

curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -

#echo "
# Dépôts du Tor Project Debian 10
#deb http://deb.torproject.org/torproject.org buster main
#deb-src http://deb.torproject.org/torproject.org buster main
#" >> /etc/apt/sources.list.d/tor.list


apt install -y tor deb.torproject.org-keyring

cp /etc/tor/torrc /etc/tor/torrc-backup

echo "
DataDirectory /var/lib/tor
HiddenServiceDir /var/lib/tor/hidden_service/
HiddenServicePort 80 127.0.0.1:80
SocksPolicy accept 192.168.0.0/16
SocksPolicy reject *
" > /etc/tor/torrc

systemctl reload tor

#https://mondedie.fr/d/10611-tuto-creer-un-serveur-web-et-un-hidden-service-tor-a-partir-de-zero/2
#https://2019.www.torproject.org/docs/tor-onion-service.html.en



















