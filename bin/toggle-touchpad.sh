#!/bin/sh

declare -i ID
#ID=`xinput list | grep -Eio '(touchpad|glidepoint)\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
ID=`xinput --list | grep -i 'synaptics' | grep -o 'id=[0-9]*' | sed 's/id=//'`
declare -i STATE
STATE=`xinput list-props $ID|grep 'Device Enabled' | awk '{print $4}'`
if [ $STATE -eq 1 ]
then
	xinput disable $ID
	echo "Touchpad disable."
	notify-send 'DISABLED' -i /home/xmiah/.config/dunst/touchpad-disable-icon.png
else
	xinput enable $ID
	 echo "Touchpad enabled."
	notify-send 'ENABLED' -i /home/xmiah/.config/dunst/touchpad-enable-icon.png
fi

