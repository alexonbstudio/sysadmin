#!/bin/sh

# search vulnerable security search engine

apt install python3 python3-setuptools python3-pip -y
apt remove python python-setuptools python-pip -y
pip3 install shodan
# easy_install shodan