#!/bin/sh

# Vider les tables actuelles
iptables -t filter -F

# Vider les règles personnelles
iptables -t filter -X

#Autorisé une IP exeptionnel
iptables -A INPUT -s 123.123.123.123 -j ACCEPT #replace your own ipv4-public (IP fix obligatoire)

# Interdire toute connexion entrante et sortante
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -t filter -P OUTPUT DROP

#Reject all
iptables -A INPUT -j DROP

# --- Fail2ban
iptables -t filter -N fail2ban-apache-auth
iptables -t filter -N fail2ban-apache-badbots
iptables -t filter -N fail2ban-apache-botsearch
iptables -t filter -N fail2ban-apache-common
iptables -t filter -N fail2ban-apache-fakegooglebot
iptables -t filter -N fail2ban-apache-modsecurity
iptables -t filter -N fail2ban-apache-nohome
iptables -t filter -N fail2ban-apache-noscript
iptables -t filter -N fail2ban-apache-overflows
iptables -t filter -N fail2ban-apache-pass
iptables -t filter -N fail2ban-apache-shellshock

iptables -t filter -N fail2ban-php-url-fopen
iptables -t filter -N fail2ban-fail2ban-sshd

iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-auth
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-badbots
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-botsearch
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-common
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-fakegooglebot
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-modsecurity
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-nohome
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-noscript
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-overflows
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-pass
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-shellshock
iptables -t filter -A INPUT -p tcp -m multiport --dports 22 -j fail2ban-sshd
iptables -t filter -A INPUT -p tcp -m multiport --dports 22 -j fail2ban-php-url-fopen

iptables -t filter -A fail2ban-apache-auth -j RETURN
iptables -t filter -A fail2ban-apache-badbots -j RETURN
iptables -t filter -A fail2ban-apache-botsearch -j RETURN
iptables -t filter -A fail2ban-apache-common -j RETURN
iptables -t filter -A fail2ban-apache-fakegooglebot -j RETURN
iptables -t filter -A fail2ban-apache-modsecurity -j RETURN
iptables -t filter -A fail2ban-apache-nohome -j RETURN
iptables -t filter -A fail2ban-apache-noscript -j RETURN
iptables -t filter -A fail2ban-apache-overflows -j RETURN
iptables -t filter -A fail2ban-apache-pass -j RETURN
iptables -t filter -A fail2ban-apache-shellshock -j RETURN
iptables -t filter -A fail2ban-sshd -j RETURN
iptables -t filter -A fail2ban-php-url-fopen -j RETURN

# Ne pas casser les connexions etablies
iptables -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -t filter -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Autoriser loopback
iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT

# Autoriser NAT
iptables -t filter -A INPUT -i nat -j ACCEPT
iptables -t filter -A OUTPUT -o nat -j ACCEPT

# Autoriser ETH0 (Optional)
#iptables -t filter -A INPUT -i eth0 -j ACCEPT
#iptables -t filter -A OUTPUT -o eth0 -j ACCEPT

# Autoriser wifi (Optional)
#iptables -t filter -A INPUT -i wifi0 -j ACCEPT
#iptables -t filter -A OUTPUT -o wifi0 -j ACCEPT

# ICMP (Ping)
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A OUTPUT -p icmp -j ACCEPT

# SSH In/Out
iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 22 -j ACCEPT

# DNS In/Out
iptables -t filter -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -t filter -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 53 -j ACCEPT


# HTTP + HTTPS In/Out
iptables -t filter -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT

#AJouter les autres règle IPTABLE ici


#Gaming Minecraft Server BEDROCK/PMMP here
#iptables -A INPUT -p tcp -m tcp --dport 19132 -j ACCEPT
#iptables -A INPUT -p udp -m udp --dport 19132 -j ACCEPT

