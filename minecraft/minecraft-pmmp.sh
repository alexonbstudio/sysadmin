#!bin/sh

clear

sudo -i


cd /var/www
mkdir -p minecraft && cd minecraft
wget https://jenkins.pmmp.io/job/PHP-7.3-Aggregate/lastSuccessfulBuild/artifact/PHP-7.3-Linux-x86_64.tar.gz

tar -zxvf PHP-7.3-Linux-x86_64.tar.gz
rm -rf *
wget https://github.com/pmmp/PocketMine-MP/releases/download/3.14.1/PocketMine-MP.phar
wget https://github.com/pmmp/PocketMine-MP/releases/download/3.14.1/start.sh

chmod +x PocketMine-MP.phar start.sh


echo -e "IS NOW START then STOP & EDIT the FILE will start on 10 second"
echo -e "HELLO WORLD Minecraft PocketMine-MP @AlexonbStudio" > index.html

sleep 10

./start.sh




