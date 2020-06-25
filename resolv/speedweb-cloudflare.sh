#!/bin/bash
##################################"
##
##		SCRIPTING BY alexonbstudio
##
##################################"


##### SPEED INTERNET WITH CLOUDFLARE BOTH IPv4 & IPv6
if [ ${whoami} != "root" || $USER = "root"  ]; then
	sudo -i # not surly
	echo "nameserver 1.1.1.1" >> /etc/resolv.conf && echo "nameserver 1.0.0.1" >> /etc/resolv.conf && echo "nameserver 2606:4700:4700::1111" >> /etc/resolv.conf && echo "nameserver 2606:4700:4700::1001" >> /etc/resolv.conf  

fi
	echo "nameserver 1.1.1.1" >> /etc/resolv.conf && echo "nameserver 1.0.0.1" >> /etc/resolv.conf && echo "nameserver 2606:4700:4700::1111" >> /etc/resolv.conf && echo "nameserver 2606:4700:4700::1001" >> /etc/resolv.conf

