#!/bin/sh

sudo apt install -y ubuntu-core^ ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal tightvncserver
	vncserver
	vncserver -kill :1
	cp ~/.vnc/xstartup ~/.vnc/xstartup_backup
	echo "
#!/bin/sh

# Uncomment the following two lines for normal desktop:
# unset SESSION_MANAGER
# exec /etc/X11/xinit/xinitrc

#export XKL_XMODMAP_DISABLE=1
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
x-window-manager &

gnome-session &
gnome-panel &
gnome-settings-daemon &
metacity &
nautilus &
	" > ${HOME}/.vnc/xstartup
	
	
	
echo "
[Unit]
Description=Start vnc4server ubuntu at startup
After=syslog.target network.target

[Service]
Type=forking
User="${SUDO_USER}"
PAMName=login
PIDFile=/home/"${SUDO_USER}"/.vnc/%H:%i.pid
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x720 :%i
ExecStop=/usr/bin/vncserver -kill :%i

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/vncserver@1.service
	systemctl daemon-reload
	systemctl enable vncserver@1.service
	
		

	# crontab -e 
	(crontab -l 2>>/dev/null; echo "@reboot vncserver -geometry 1280x720 -depth 24") | crontab -	
	