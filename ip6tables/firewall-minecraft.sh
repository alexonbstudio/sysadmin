#!/bin/sh

#Gaming Minecraft Server BEDROCK/PMMP here IPV6
ip6tables -A INPUT -p tcp -m tcp --dport 19133 -j ACCEPT
ip6tables -A INPUT -p udp -m udp --dport 19133 -j ACCEPT