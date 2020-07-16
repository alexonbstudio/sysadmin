#!/bin/bash
##################################"
##
##		SCRIPTING BY alexonbstudio
##		Cloudflare DoH over HTTPS/TOR/TLS - PUBLIC
##################################"


##### SPEED INTERNET WITH CLOUDFLARE BOTH IPv4 & IPv6
if [ $whoami != "root" ]; then
	echo "nameserver 1.1.1.1 \n
	nameserver 1.0.0.1 \n
	nameserver 2606:4700:4700::1111 \n
	nameserver 2606:4700:4700::1001" >> /etc/resolv.conf  
	reboot now

fi

echo "Require Root User do: sudo -i and run again sh ./speedweb-cloudflare.sh"