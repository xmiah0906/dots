#!/bin/bash

CAP=$(xset q | grep Caps | tr -s " " | awk '{print $4}')

if [[ "$CAP" == "off" ]]
then
	notify-send -t 2500 -i dialog-information 'CAPSLOCK: OFF' -i '/home/xmiah/.config/dunst/caps-lock-off.png'
else
	notify-send -t 2500 -i dialog-information 'CAPSLOCK: ON' -i '/home/xmiah/.config/dunst/caps-lock-on.png'
fi
