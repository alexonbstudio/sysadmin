#!/bin/sh


# SSH autorized by unique your own
ufw allow from 123.123.123.123 to any port 22 proto tcp

# loopback
ufw allow in lo
ufw allow out lo

# NAT
ufw allow in nat
ufw allow out nat

# DNS
ufw allow in 53/tcp
ufw allow out 53/tcp
ufw allow in 53/udp
ufw allow out 53/udp


# ICMP (Ping)
ufw allow in icmp
ufw allow out icmp