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
	echo -e "\n\nStep 1) bash automate-(sub)domain.sh domain alexonbstudio.tld #default domain\n\n"
	echo -e "\n\nStep 2) bash automate-(sub)domain.sh ipv4local x.x.x.x  domain alexonbstudio.tld #ipv4local domain hosts\n\n"
	echo -e "\n\nStep 3) bash automate-(sub)domain.sh ipv6local x:x:::x:x  domain alexonbstudio.tld #ipv6local domain hosts\n\n"
	echo -e "\n\n##########			HELP END			##########"

if [ ${whoami} != "root" || $USER != "root" ]; then

	echo "
	while()+++
	
	
	"
	
	if [ -z $domain ]; then

		hostnamectl set-hostname ${domain}

	fi
	if [ -z $domain && -z $ipv4local ]; then

		echo "${ipv4local} ${domain}" >> /etc/hosts
			
	fi

	if [ -z $domain && -z $ipv6local ]; then

		echo "${ipv6local} ${domain}" >> /etc/hosts
			
	fi	
fi
		
	echo -e "YOUR 'RE NOT ROOT USER (sudo -i)"



