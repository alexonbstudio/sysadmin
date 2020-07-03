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
iptables -t filter -N fail2ban-nginx-http-auth
iptables -t filter -N fail2ban-nginx-nohome
iptables -t filter -N fail2ban-nginx-noproxy
iptables -t filter -N fail2ban-nginx-noscript
iptables -t filter -N fail2ban-nginx-badbots
iptables -t filter -N fail2ban-nginx-botsearch
iptables -t filter -N fail2ban-nginx-limit-req
iptables -t filter -N fail2ban-php-url-fopen
iptables -t filter -N fail2ban-fail2ban-sshd

iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-nginx-http-auth
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-nginx-nohome
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-nginx-noproxy
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-nginx-noscript
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-nginx-badbots
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-nginx-botsearch
iptables -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j fail2ban-nginx-limit-req
iptables -t filter -A INPUT -p tcp -m multiport --dports 22 -j fail2ban-sshd
iptables -t filter -A INPUT -p tcp -m multiport --dports 22 -j fail2ban-php-url-fopen

iptables -t filter -A fail2ban-nginx-http-auth -j RETURN
iptables -t filter -A fail2ban-nginx-noproxy -j RETURN
iptables -t filter -A fail2ban-nginx-nohome -j RETURN
iptables -t filter -A fail2ban-nginx-noscript -j RETURN
iptables -t filter -A fail2ban-nginx-badbots -j RETURN
iptables -t filter -A fail2ban-nginx-botsearch -j RETURN
iptables -t filter -A fail2ban-nginx-limit-req -j RETURN
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

########
# iptables -A INPUT -s adresse_ip -j DROP #bannir une IP
# iptables -A INPUT -s adresse_ip -j ACCEPT #autorisé une IP