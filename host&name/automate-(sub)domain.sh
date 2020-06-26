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

	echo -e "##########			HELP STARTER			##########\n\n"
	echo -e "\n\nStep 1) bash automate-(sub)domain.sh domain=alexonbstudio.tld #default domain\n\n"
	echo -e "\n\nStep 2) bash automate-(sub)domain.sh ipv4local=x.x.x.x  domain=alexonbstudio.tld #ipv4local domain hosts\n\n"
	echo -e "\n\nStep 3) bash automate-(sub)domain.sh ipv6local=x:x:::x:x  domain=alexonbstudio.tld #ipv6local domain hosts\n\n"
	echo -e "\n\nStep 4) bash automate-(sub)domain.sh ipv6local=x:x:::x:x  quit # now reboot\n\n"
	echo -e "\n\n##########			HELP END			##########"

if [ ${whoami} != "root" || $USER != "root" ]; then

	echo -e "YOUR 'RE NOT ROOT USER (sudo -i)"
	sudo -i
	
	if [ -z $1 ]; then

		hostnamectl set-hostname ${domain}

		if [ -z $1 && -z $2 ]; then

			echo "${ipv4local} ${domain}" >> /etc/hosts
			
		fi

		if [ -z $1 && -z $3 ]; then

			echo "${ipv6local} ${domain}" >> /etc/hosts
			
		fi	

		if [ -z $4 ]; then

			reboot now
			
		fi	
	fi
fi
		


