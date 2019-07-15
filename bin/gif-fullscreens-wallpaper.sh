#!/usr/bin/bash
img="$1"

reload_wall() {
    killall xwinwrap
    while pgrep -x xwinwrap > /dev/null; do sleep 1; done
    xwinwrap -ov -g 1920x1080+0+0 -- mpv -wid WID "$img" --no-osc --no-osd-bar --no-video-osd --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings
}

main() {
    reload_wall &
}

main >/dev/null 2>&1
