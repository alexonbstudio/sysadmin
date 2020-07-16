#!/bin/sh
##################################"
##
##		SCRIPTING BY alexonbstudio | Custom SSL Own or 
##
##################################"

# Copy CERT private

private_ssl="
	HERE++++++*****
"

# Copy Public
public_ssl="
	HERE++++++*****
"

# Copy Bundle
bundle_ssl=""

echo ${private_ssl} > /var/www/ssl/private.pem
echo ${public_ssl} > /var/www/ssl/public.pem

if [ -z $bundle_ssl ]; then
	echo ${bundle_ssl} > /var/www/ssl/bundle.pem
fi

