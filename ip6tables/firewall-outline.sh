#!/bin/sh

ip6tables -A INPUT -p tcp -m multiport --dports 1024:65535 -j ACCEPT
ip6tables -A INPUT -p udp -m multiport --dports 1024:65535 -j ACCEPT
