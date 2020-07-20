#!/bin/sh

#Configuration
domain="exemple.tld" #edit this line by your own domain name (your-name.tld)
name="Website Project WP" # Edit this line to pub your own name
php_version="7.4" # default Ubuntu 20.04
ip4_local="" # Local IPV4 of server exemple 10.0.0.1
ip6_local="" # Local IPV6 of server exemple 111dd:c15dv:15vd1::100
ip4_myIP="" # Your own IPv4 for SSH exemple 10.0.0.1
ip6_myIP="" # Your own IPv6 for SSH exemple 111dd:c15dv:15vd1::100

# Dont touch IT
server="server"
server_final="$server.$domain"
www="www"
www_final="$www.$domain"

clear

echo "
#############################################
#											#
#	Copyright 2020 BY AlexonbStudio			#
#											#
#											#
#############################################
"


if [ $USER != "root" ]; then

	#PENDING

fi

echo "Sorry this script need sudo -i (ROOT user)"
