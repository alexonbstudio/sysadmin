# sysadmin - security - automated (Debian/Ubuntu Latest Vesion)
 Recommend for sysadmin by @alexonbstudio - Desktop/Server


## change hostname & host automate for domain name | folder host&name

	#recommend Root access
	mdkir -p /tmp && cd /tmp
	curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/host&name/automate-(sub)domain.sh
	chmod +x automate-(sub)domain.sh
	#BASH NOT TESTED
	bash automate-(sub)domain.sh domain=site.tld
	bash automate-(sub)domain.sh ipv4local=10.10.10.10 domain=site.tld
	bash automate-(sub)domain.sh ipv6local=1111:1:0:0::1 domain=site.tld
	bash automate-(sub)domain.sh quit
	
+ automate-(sub)domain.sh

## secure resolv both ipv4 & ipv6 DNS Speed internet
	
	#recommend Root access
	mdkir -p /tmp && cd /tmp
	curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/resolv/speedweb-cloudflare.sh
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
	+ Apache2
	+ Nginx

## Enable systemctl on forlder

- easy-to-use-later.txt


## fail2ban forlder

	#after folder then on filter.d is exemple
	cp jail.conf jail-bak.local

+ jail.bak.local
+ jail-edited-apache.conf
+ jail-edited-nginx.conf

### APACHE custom Jail.local

	#then
	cd /etc/fail2ban/
	rm -f jail.local
	curl -o jail.local https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/fail2ban/jail-edited-apache.conf
	chmod +x jail.local
	
### Nginx custom Jail.local

	#then
	cd /etc/fail2ban/
	rm -f jail.local
	curl -o jail.local https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/fail2ban/jail-edited-nginx.conf
	chmod +x jail.local


## IPv4 folder iptables	
	
### IPtables for apache2

	cd /etc/init.d/
	curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/iptables/firewall-apache.sh
	mv firewall-apache.sh firewall
	nano firewall #recommend change  ip: 123.123.123.123 to your own IP-public
	chmod +x firewall
	update-rc.d firewall defaults

### IPtables for nginx

	cd /etc/init.d/
	curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/iptables/firewall-nginx.sh
	mv firewall-nginx.sh firewall4
	nano firewall4 #recommend change ip: 123.123.123.123 to your own IP-public
	chmod +x firewall4
	update-rc.d firewall4 defaults

##### Then executing
	/etc/init.d/firewall4

### want ip6tables

	apt install -y ip6tables

## IPv6 folder ip6tables

### IP6tables for apache2

	cd /etc/init.d/
	curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/ip6tables/firewall-apache.sh
	mv firewall-apache.sh firewall
	nano firewall #recommend change  ip: 1234:1234:1234:1234:1234:1234 to your own IP-public
	chmod +x firewall
	update-rc.d firewall defaults

### IP6tables for nginx

	cd /etc/init.d/
	curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/ip6tables/firewall-nginx.sh
	mv firewall-nginx.sh firewall6
	nano firewall #recommend change  ip: 1234:1234:1234:1234:1234:1234 to your own IP-public
	chmod +x firewall6
	update-rc.d firewall6 defaults

##### Then executing
	
	/etc/init.d/firewall6
	
##### DONE IPtables & IP6tables

	iptables-persistent
	dpkg-reconfigure iptables-persistent

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
