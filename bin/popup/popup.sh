#!/usr/bin/env bash
# usage:
# popup [file] [placement] -p [pointer location]

# fetch the colors
source "${HOME}/bin/popup/colors.sh"

# vars
background="${HOME}/bin/popup/img/bg.png"
pointer="${HOME}/bin/popup/img/pointer.png"
height=$(xdotool "getdisplaygeometry" | awk '{print $2;}')
ypos="40"

# exec
n30f -x "600" -y "32" -c "killall n30f" "$background" &
sleep ".05s"
n30f -x "605" -y "36" -c "killall n30f" "$1" &

# pointer
if [ "$3" == "-p" ] ; then
	n30f -x "$(expr "$2" + "$4")" -y "$(expr "$ypos" + "210")" -c "killall n30f" "$pointer"
else
	exit
fi
