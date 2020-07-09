#!/bin/sh

###################################
#
#		Update Ubuntu Kernel 
#		AlexonbStudio | Pending https://itsubuntu.com/update-linux-kernel-in-ubuntu-20-04-lts/
#
####################################

mkdir -p tmp && cd /tmp
git clone https://github.com/usbkey9/uktools && cd uktools
make

sleep 20

do-kernel-upgrade && do-kernel-purge

cat /var/log/ukt.log
sleep 20
rm -rf /var/log/ukt.log

reboot now 