#!/bin/sh

iptables -A INPUT -p tcp -m multiport --dports 1024:65535 -j ACCEPT
iptables -A INPUT -p udp -m multiport --dports 1024:65535 -j ACCEPT