#!/usr/bin/bash
img="$1"
_resolution="$(identify -format '%wx%h\n' "$img" | head -1)"

_w="$(identify -format '%w\n' "$img" | head -1)"
_w="$(expr 1920 - $_w)"
_w="$(expr $_w / 2)"

_h="$(identify -format '%h\n' "$img" | head -1)"
_h="$(expr 1080 - $_h)"
_h="$(expr $_h / 2)"


_reload_bg() {
    _solid="$(convert "$img" -crop 1x1+0+0 -depth 8 txt: | grep -Eo \
    '#[A-F0-9]{6}(FF|)' | sort -u | head -n 1)"

    _solid="${_solid%%FF}"

    printf '%s\n' "${_solid}"
}


solid_bg() {
    _bg="$(_reload_bg)"

    hsetroot -solid "$_bg"
}


reload_wall() {
    killall xwinwrap
    while pgrep -x xwinwrap > /dev/null; do sleep 1; done

    xwinwrap -ov -g "$_resolution"+"$_w"+"$_h" -- mpv -wid WID "$img" --no-osc --no-osd-bar --no-video-osd --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings
}

main() {
    reload_wall &
    solid_bg &
}

main >/dev/null 2>&1
