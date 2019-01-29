#!/usr/bin/env bash

# vars
csf=`mpc -f %file% | head -1`
csil="/tmp/cover.png"
csbil="${HOME}/bin/popup/img/bg.png"
pointer="${HOME}/bin/popup/img/ztn.png"

# extract the album art
ffmpeg -loglevel 0 -y -i "$HOME/Music/$csf" -vf scale=-200:200 "$csil"

# display it
sleep ".1s"
~/bin/popup/popup.sh /tmp/cover.png "$csbil" "600" -p "700" &
sleep ".05s"
n30f -t "poinz" -x "708" -y "28" -c "killall n30f" "$pointer" &
#n30f -t "coverp" -x "600" -y "32" -c "killall n30f" "$csil" &

# delete it
sleep ".25s"
rm "$csil"
