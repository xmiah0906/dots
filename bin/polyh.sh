#!/usr/bin/env bash

#killall	-q polybar
#while pgrep -x polybar > /dev/null; do sleep 1; done
wal -a 99 -i "$HOME/Imagens/Wallpaper" -o ~/bin/wal-set -q
#polybar top -q & 
bspc config top_padding 0
