#!bin/sh
Minecraft_VersionBedrock="1.16.1.02" #actual version


clear

mkdir -p minecraftbedrock && cd minecraftbedrock

apt install -y curl unzip zip

curl -O https://minecraft.azureedge.net/bin-linux/bedrock-server-${Minecraft_VersionBedrock}.zip
chmod +x bedrock-server-${Minecraft_VersionBedrock}.zip
unzip bedrock-server-${Minecraft_VersionBedrock}.zip


echo "IS NOW START then STOP & EDIT the FILE will start on 10 second"
#echo "HELLO WORLD Minecraft PocketMine-MP <a href=\"https://alexonbstudio.fr\">@AlexonbStudio</a>" > index.html

echo "edit the file permissions.json & server.properties simply"

sleep 10
# Lunch 
LD_LIBRARY_PATH=. ./bedrock_server