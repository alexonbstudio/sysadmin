#!/bin/sh

# Script by AlexonbStudio

#configuration
sever1="n1"
sever2="n2"
domain="exemple.tld"

#automate
srv_dns1="$sever1.$domain"
srv_dns2="$sever2.$domain"


# install
apt install -y bind9 dnsutils bind9-doc






