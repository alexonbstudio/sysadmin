#!/bin/sh

# HTTP(S)
ufw allow in 80/tcp
ufw allow out 80/tcp
ufw allow in 443/tcp
ufw allow out 443/tcp
