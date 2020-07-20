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

	nano /etc/php/7.4/fpm/php.ini
	cgi.fix_pathinfo = 0 #uncomment this

+ Apache2 (&/OR litespeed)
+ Nginx

	nano /etc/nginx/nginx.conf
	server_tokens off; #uncomment this
	cp /etc/nginx/sites-available/default /etc/nginx/sites-available/alexonbstudio.tld
	rm -rf /etc/nginx/sites-available/default
	nano /etc/nginx/sites-available/alexonbstudio.tld
	fastcgi_pass unix:/run/php/php7.4-fpm.sock; #uncomment this between Server{...} => on location 

+ Certbot SSL free

	certbot --apache -d dev.alexonbstudio.fr # APACHE
	certbot --nginx -d dev.alexonbstudio.fr #NGINX
	certbot renew --dry-run # Test renewal
	
+ OR SSL with Cloudflare SSL universal on CDN
	
	#SSL 15year Max is free to begening
	#take public key to pem file & private key to cert file

## Enable systemctl on forlder

- easy-to-use-later.txt

## Mail system & secure

+ [Readme By Luck Smith](https://github.com/LukeSmithxyz/emailwiz/blob/master/README.md)
+ [Info URL demo by Luck Smith](https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/mail/install&secure.txt)
- 
- 
- 

## fail2ban forlder

	#after folder then on filter.d is exemple
	cp jail.conf jail-bak.local

+ jail.bak.local
+ jail-edited-apache.conf #(include conf ssh/Mysql/mail)
+ jail-edited-nginx.conf #(include conf ssh/Mysql/mail)

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

### After access folder fail2ban/filder.d [Definition]

+ nginx #done
+ apache #done
+ mysql
+ ssh #done


## IPv4 folder iptables	
	
### IPtables for apache2

	cd /etc/init.d/
	curl -o firewall4 https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/iptables/firewall-apache.sh
	nano firewall4 #recommend change  ip: 123.123.123.123 to your own IP-public
	chmod +x firewall4
	update-rc.d firewall defaults

### IPtables for nginx

	cd /etc/init.d/
	curl -o firewall4 https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/iptables/firewall-nginx.sh
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
	curl -o firewall6 https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/ip6tables/firewall-apache.sh
	nano firewall #recommend change  ip: 1234:1234:1234:1234:1234:1234 to your own IP-public
	chmod +x firewall6
	update-rc.d firewall defaults

### IP6tables for nginx

	cd /etc/init.d/
	curl -o firewall6 https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/ip6tables/firewall-nginx.sh
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
	

## Firewall with UFW

	curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/ufw/*.sh
	nano firewall-local.sh #recommend change ip: 123.123.123.123 to your own IP-public SSH
	chmod +x *.sh
	sh ./<name>.sh

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

### COMPOSER

	curl -O https://raw.githubusercontent.com/website-project-WP/linux-wp/master/composer.sh
	chmod -x composer.sh
	sh composer.sh

### TODO

- Mysql fail2ban & iptables/ip6tables
- mysql create script automate DBNAME/DBUSER
- mail (Dovecot/Postfix) fail2ban & iptables/ip6tables/ufw
- Certbot
- what else again more
- final 1 full scripting
- CentOS
- SRE avanced ansible/docker


### Minecraft Gaming
	
	mkdir -p tmp && cd /tmp
	#PENDING
	curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/minecraft/minecraft-bedrock.sh #BEDROCK
	chmod +x minecraft-bedrock.sh
	./minecraft-bedrock.sh
	#OR
	curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/minecraft/minecraft-pmmp.sh #POCKETMINE
	chmod +x minecraft-pmmp.sh
	./minecraft-pmmp.sh


### Desktop 
	
	mkdir -p tmp && cd /tmp
	#PENDING
	curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/desktop/



## FINAL DONE

### Website Project WP 2.0
	
	curl -O https://raw.githubusercontent.com/alexonbstudio/sysadmin/master/wp/website-project-wp.sh
	chmod +x website-project-wp.sh
	sh website-project-wp.sh

