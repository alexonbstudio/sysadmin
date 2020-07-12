#!/bin/sh
##################################"
##
##		SCRIPTING BY alexonbstudio 
##
##################################"



(crontab -l 2>>/dev/null; echo "@weekly rm -rf /var/log/apache*/*.log \n
@monthly rm -rf /var/log/apt/*.log \n
@monthly rm -rf /var/log/clamav/*.log \n
@monthly rm -rf /var/log/journal/*.log \n
@monthly rm -rf /var/log/letsencrypt/*.log \n
@weekly apt update && apt upgrade -y \n
@weekly apt-get update && apt-get upgrade -y \n
@daily systemctl stop clamav-freshclam && freshclam --quiet && systemctl start clamav-freshclam \n
* * * */6 * reboot now") | crontab -
