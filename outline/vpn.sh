#!bin/bash
#####################################
#      
#   Outline VPN   
#	From by Google
#      
#####################################

if [$USER != "root" ]; then

bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)"

fi


sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)"