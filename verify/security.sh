#!bin/sh

#SCRIPTING BY ALEXONBSTUDIO

cd /etc
chown root:root passwd shadow group gshadow
chmod 644 passwd group
chmod 400 shadow gshadow


# /home/user
chmod g-w /home/${USER} /home/${SUDO_USER}
chmod o-rwx /home/${USER} /home/${SUDO_USER}