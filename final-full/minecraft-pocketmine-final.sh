#!bin/sh
#########################################
#
#		Copyright (c) AlexonbStudio for free(dom)
#		Date 10/07/2020 - 19:31 (ALPHA)
#
#########################################
clear

echo -e "Auto connect Root USER this part \n\n
Information \n\n
Copyright (c) AlexonbStudio for free(dom)\n\n
Date 10/07/2020 - 19:31 (ALPHA) 0.1
"

sudo -i


# Update
apt-get update && apt-get upgrade -y
apt update && apt upgrade -y
apt-get install software-properties-common && add-apt-repository universe

# Install PKG
apt install -y curl openssl nginx certbot python3-certbot-nginx clamav clamav-daemon fail2ban net-tools screen ufw

# Enable exemple: systemctl restart nginx 
echo -e "\n\nSystemctl using easier recommandation\n\n"
systemctl enable nginx && /lib/systemd/systemd-sysv-install enable nginx
systemctl enable clamav-freshclam && /lib/systemd/systemd-sysv-install enable clamav-freshclam
systemctl enable fail2ban && /lib/systemd/systemd-sysv-install enable fail2ban
echo -e "\n\nThe notice recommand\n\n"
echo -e "\n\n How to use, exemple: systemctl restart nginx \n\n"

sleep 10

##################################################################

echo -e '==========			BEGIN RESOLV CONFIG (Cloudflare DNS+Anti-malware)			=========='

echo "\n\n\n
#Cloudflare DNS+Anti-malware \n 
nameserver 1.1.1.2 \n 
nameserver 1.0.0.2 \n 
nameserver 2606:4700:4700::1112 \n 
nameserver 2606:4700:4700::1002" >> /etc/resolv.conf  
echo -e '==========			END RESOLV CONFIG (Cloudflare DNS+Anti-malware)			=========='


##################################################################

echo -e '==========			BEGIN HOSTNAME+HOST CONFIG			=========='

domain=$1
ipv4local=$2
ipv6local=$3

	echo -e "##########			HELP STARTER			##########\n\n"
	echo -e "\n\nStep 1) ./minecraft-pocketmine-final.sh domain=alexonbstudio.tld #default domain\n\n"
	echo -e "\n\nStep 2) ./minecraft-pocketmine-final.sh ipv4local=x.x.x.x domain=alexonbstudio.tld #ipv4local domain hosts\n\n"
	echo -e "\n\nStep 3) ./minecraft-pocketmine-final.sh ipv6local=x:x:::x:x domain=alexonbstudio.tld #ipv6local domain hosts\n\n"
	echo -e "\n\n##########			HELP END			##########"


	if [ -z $1 ]; then

		hostnamectl set-hostname ${domain}

		if [ -z $1 && -z $2 ]; then

			echo "${ipv4local} ${domain}" >> /etc/hosts
			
		fi

		if [ -z $1 && -z $3 ]; then

			echo "${ipv6local} ${domain}" >> /etc/hosts
			
		fi	
	fi

echo -e '==========			END HOSTNAME+HOST CONFIG			=========='


##################################################################

echo -e '==========			BEGIN SECURITY FAIL2BAN			=========='

cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local



#fail2ban-client reload
echo -e '==========			END SECURITY FAIL2BAN			=========='

##################################################################

echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='

# deleted old & reset firewall
ufw reset 

#


#secyre policy
#ufw default deny incoming
#ufw default deny outgoing


# SSH
ufw allow 22/tcp
ufw limit 22/tcp
ufw reject auth
ufw reject auth

# HTTP(S)
#ufw allow 80/tcp
#ufw allow 443/tcp
ufw allow proto tcp from any to any port 80,443 comment 'WEB SERVER activated firewall autorized' 

echo -e "Minecraft firewall ipV4"
ufw allow 192132


echo -e "Minecraft firewall ipV6"
ufw allow 192133 proto ipv6

myipv4public=$4
myipv6public=$5



	echo -e "##########			HELP STARTER			##########\n\n"
	echo -e "\n\n ./minecraft-pocketmine-final.sh myipv4public=x.x.x.x #ipv4local domain hosts\n\n"
	echo -e "\n\n ./minecraft-pocketmine-final.sh myipv6public=x:x:::x:x #ipv6local domain hosts\n\n"
	echo -e "\n\n##########			HELP END			##########"

if [ -z $4 ]; then
	# Exceptional myip ssh access
	ufw allow from ${myipv4public} to any port 22 proto tcp
	#NEED help by AlexonbStudio
	ufw allow from  to any port 22 proto tcp
fi
if [ -z $5 ]; then
	# Exceptional myip ssh access
	ufw allow from ${myipv6public} to any port 22 proto tcp
	#NEED help by AlexonbStudio
	ufw allow from  to any port 22 proto tcp
fi


# loopback
ufw allow lo

# NAT
ufw allow nat

# DNS
ufw allow 53

# ICMP (Ping)
ufw allow icmp

ufw logging on 

#ufw enable

echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################

echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################


echo -e '==========			BEGIN SECURITY FIREWALL UFW			=========='



echo -e '==========			END SECURITY FIREWALL UFW			=========='

##################################################################




























# THE END

exit

# Sept install Complet Minecraft Bedrock PocketMine-MP

echo -e 'Now we download and install for you Minecraft Bedrock PocketMine-MP 3.14.1'

rm -rf /var/www/html/*
cd /var/www
mkdir -p minecraft && cd minecraft
wget https://jenkins.pmmp.io/job/PHP-7.3-Aggregate/lastSuccessfulBuild/artifact/PHP-7.3-Linux-x86_64.tar.gz

tar -zxvf PHP-7.3-Linux-x86_64.tar.gz && rm -rf PHP-7.3-Linux-x86_64.tar.gz
curl -O https://github.com/pmmp/PocketMine-MP/releases/download/3.14.1/PocketMine-MP.phar -O https://github.com/pmmp/PocketMine-MP/releases/download/3.14.1/start.sh

chmod +x PocketMine-MP.phar start.sh


echo -e "IS NOW START then STOP & EDIT the FILE will start on 10 second"
echo -e "Then Testéd after do 'stop' commend line"
echo -e "when done success do this: screen & after ./start.sh"
echo '<html>
	<head>
		
	</head>
	<body>
	
	
	</body>
</html>' > index.html

echo -e ""



sleep 20

./start.sh




