#!/bin/sh


systemctl stop clamav-freshclam

#freshclam #mise à jour
# mAj autre
mkdir -p /var/lib/clamav && cd /var/lib/clamav
wget https://database.clamav.net/daily.cvd
chmod +x daily.cvd

systemctl start clamav-freshclam