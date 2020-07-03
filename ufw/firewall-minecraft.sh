#!/bin/sh


echo -e "Minecraft firewall ipV4"
ufw allow 192132/tcp
ufw allow 192132/udp


echo -e "Minecraft firewall ipV6"
ufw allow 192133/tcp
ufw allow 192133/udp