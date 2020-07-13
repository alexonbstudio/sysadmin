#!/bin/sh


echo -e "Minecraft firewall ipV4"
ufw allow 192132


echo -e "Minecraft firewall ipV6"
ufw allow 192133 proto ipV6