#!/bin/sh


# SSH autorized by unique your own
ufw allow from 123.123.123.123 to any port 22 proto tcp

# loopback
ufw allow lo

# NAT
ufw allow nat

# DNS
ufw allow 53


# ICMP (Ping)
ufw allow icmp