#!/bin/sh

#Gaming Minecraft Server BEDROCK/PMMP here IPV4
iptables -A INPUT -p tcp -m tcp --dport 19132 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 19132 -j ACCEPT

