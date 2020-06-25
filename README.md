# sysadmin - security - automated (Debian/Ubuntu Latest Vesion)
 Recommend for sysadmin by @alexonbstudio - Desktop/Server

## secure resolv both ipv4 & ipv6 DNS Speed internet
	
	#recommend Root access
	mdkir -p /tmp && cd /tmp
	curl -O https://github.com/alexonbstudio/sysadmin/raw/master/resolv/speedweb-cloudflare.sh
	chmod +x speedweb-cloudflare.sh
	bash speedweb-cloudflare.sh

+ speedweb-cloudflare.sh
+ speedweb-cloudflare-block-malware.sh
+ speedweb-cloudflare-block-malware-and-adult-content.sh

## secure SSH folder sshd
	nano /etc/ssh/sshd_config

+ secure-ssh.txt

## installer - Folder web-server

+ apache.sh (integrated certbot/fail2ban/MARIADB/ANTIVIRUS/compatible CMS Wordpress/Joomla/Drupal | FULLY PHP) 
+ nginx.sh (integrated certbot/fail2ban/MARIADB/ANTIVIRUS/compatible CMS Wordpress/Joomla/Drupal | FULLY PHP) 
	
	#after to install you need just to configure IT's from
	
		cd /etc/
	
	+ PHP*.*
	+ PHP*.*-fpm
	+ PHP*.*-cgi
	+ Apache2
	+ Nginx

## Enable systemctl on forlder

- easy-to-use-later.txt




## IPtables for apache2

	curl -O https://github.com/alexonbstudio/sysadmin/raw/master/iptable/firewall-apache.sh
	mv firewall-apache.sh firewall
	chmod +x firewall
	nano firewall #recommend change  ip: 123.123.123.123 to your own IP-public
	update-rc.d firewall defaults

## IPtables for nginx

	cd /etc/init.d/
	curl -O https://github.com/alexonbstudio/sysadmin/raw/master/iptable/firewall-nginx.sh
	mv firewall-nginx.sh firewall
	chmod +x firewall
	nano firewall #recommend change ip: 123.123.123.123 to your own IP-public
	update-rc.d firewall defaults

#### Then executing
	/etc/init.d/firewall
	

## Automate folder crontab 

	#using crontab -e

+ automate-debian.txt 
+ automate-ubuntu.txt 
	
	

## Protect from attack

+ iptable & fail2ban
+ if you prefered Both ipv4 & ipv6 (iptables)

	uname -r
	apt install -y ip6tables iptables-persistent
	#Need upgrade your kernel if ip6tables not works

## fail2ban forlder

	#after folder then on filter.d is exemple
	cp jail.conf jail.local

+ jail.local

	#edited the some recommendation
	+ ignoreip
	+ maxretry
	+ enable = true (sshd)

## Scan virus

+ clamav
+ manual 

	clamscan --infected --recursive --remove /

### TODO
- mail
- Mysql
- Certbot
- what else again more


## Software require

+ iptables
+ clamav
+ fail2ban
+ Old suggest [Protected Recommend the docs by NSA](Guide-to-the-Secure-Configuration-of-Red-Hat-Enterprise-Linux-5-by-NSA.pdf)

### Copyright &copy; AlexonbStudio for freedom

License LGPLV3.0

+ https://blog.alexonbstudio.fr/2020/06/securite-apache-ou-nginx-ssh-sur-linux.html (Info)
