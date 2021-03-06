#!/bin/sh

# Vider les tables actuelles
ip6tables -t filter -F

# Vider les règles personnelles
ip6tables -t filter -X

#Autorisé une IP exeptionnel
ip6tables -A INPUT -s 1234:1234:1234:1234:1234:1234 -j ACCEPT #replace your own ipv4-public (IP fix obligatoire)

# Interdire toute connexion entrante et sortante
ip6tables -t filter -P INPUT DROP
ip6tables -t filter -P FORWARD DROP
ip6tables -t filter -P OUTPUT DROP

#Reject all
ip6tables -A INPUT -j DROP

# --- Fail2ban
ip6tables -t filter -N fail2ban-apache-auth
ip6tables -t filter -N fail2ban-apache-badbots
ip6tables -t filter -N fail2ban-apache-botsearch
ip6tables -t filter -N fail2ban-apache-common
ip6tables -t filter -N fail2ban-apache-fakegooglebot
ip6tables -t filter -N fail2ban-apache-modsecurity
ip6tables -t filter -N fail2ban-apache-nohome
ip6tables -t filter -N fail2ban-apache-noscript
ip6tables -t filter -N fail2ban-apache-overflows
ip6tables -t filter -N fail2ban-apache-pass
ip6tables -t filter -N fail2ban-apache-shellshock

ip6tables -t filter -N fail2ban-php-url-fopen
ip6tables -t filter -N fail2ban-fail2ban-sshd

ip6tables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-auth
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-badbots
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-botsearch
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-common
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-fakegooglebot
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-modsecurity
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-nohome
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-noscript
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-overflows
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-pass
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-apache-shellshock
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 22 -j fail2ban-sshd
ip6tables -t filter -A INPUT -p tcp -m multiport --dports 22 -j fail2ban-php-url-fopen

ip6tables -t filter -A fail2ban-apache-auth -j RETURN
ip6tables -t filter -A fail2ban-apache-badbots -j RETURN
ip6tables -t filter -A fail2ban-apache-botsearch -j RETURN
ip6tables -t filter -A fail2ban-apache-common -j RETURN
ip6tables -t filter -A fail2ban-apache-fakegooglebot -j RETURN
ip6tables -t filter -A fail2ban-apache-modsecurity -j RETURN
ip6tables -t filter -A fail2ban-apache-nohome -j RETURN
ip6tables -t filter -A fail2ban-apache-noscript -j RETURN
ip6tables -t filter -A fail2ban-apache-overflows -j RETURN
ip6tables -t filter -A fail2ban-apache-pass -j RETURN
ip6tables -t filter -A fail2ban-apache-shellshock -j RETURN
ip6tables -t filter -A fail2ban-sshd -j RETURN
ip6tables -t filter -A fail2ban-php-url-fopen -j RETURN

# Ne pas casser les connexions etablies
ip6tables -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
ip6tables -t filter -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Autoriser loopback
ip6tables -t filter -A INPUT -i lo -j ACCEPT
ip6tables -t filter -A OUTPUT -o lo -j ACCEPT

# Autoriser NAT
ip6tables -t filter -A INPUT -i nat -j ACCEPT
ip6tables -t filter -A OUTPUT -o nat -j ACCEPT

# Autoriser ETH0 (Optional)
#ip6tables -t filter -A INPUT -i eth0 -j ACCEPT
#ip6tables -t filter -A OUTPUT -o eth0 -j ACCEPT

# Autoriser wifi (Optional)
#ip6tables -t filter -A INPUT -i wifi0 -j ACCEPT
#ip6tables -t filter -A OUTPUT -o wifi0 -j ACCEPT

# ICMP (Ping)
ip6tables -t filter -A INPUT -p icmp -j ACCEPT
ip6tables -t filter -A OUTPUT -p icmp -j ACCEPT

# SSH In/Out
ip6tables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
ip6tables -t filter -A OUTPUT -p tcp --dport 22 -j ACCEPT

# DNS In/Out
ip6tables -t filter -A OUTPUT -p tcp --dport 53 -j ACCEPT
ip6tables -t filter -A OUTPUT -p udp --dport 53 -j ACCEPT
ip6tables -t filter -A INPUT -p tcp --dport 53 -j ACCEPT
ip6tables -t filter -A INPUT -p udp --dport 53 -j ACCEPT


# HTTP + HTTPS In/Out
ip6tables -t filter -A OUTPUT -p tcp --dport 80 -j ACCEPT
ip6tables -t filter -A OUTPUT -p tcp --dport 443 -j ACCEPT
ip6tables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
ip6tables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT

#AJouter les autres règle IPTABLE ici

#Gaming Minecraft Server BEDROCK/PMMP here IPV6
#ip6tables -A INPUT -p tcp -m tcp --dport 19133 -j ACCEPT
#ip6tables -A INPUT -p udp -m udp --dport 19133 -j ACCEPT
