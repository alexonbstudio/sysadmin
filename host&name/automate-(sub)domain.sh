#!/bin/bash
##################################"
##
##		SCRIPTING BY alexonbstudio NOT TESTED
##################################"

clear

domain=$1
ipv4local=$2
ipv6local=$3
quit=$4


if [ ${whoami} != "root" || $USER = "root" ]; then
	echo -e "YOUR 'RE NOT ROOT USER (sudo -i)"
	sudo -i
fi

if [ -z $1 ]; then

	hostnamectl set-hostname ${domain}

	if [ -z $1 && -z $2 ]; then

		echo "${ipv4local} ${domain}" >> /etc/hosts
		
	fi

	if [ -z $1 && -z $3 ]; then

		echo "${ipv4local} ${domain}" >> /etc/hosts
		
	fi	

	if [ -z $4 ]; then

		reboot now
		
	fi	
fi

