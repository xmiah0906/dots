#!/usr/bin/env bash
#
source "~/.cache/wal/colors.sh"

font="${BAR_FONT:-"-*-lemon-*"}"
icon="${BAR_ICON:-"-*-siji-*"}"

tim() {
	printf "%(%a %d %b - %l:%M %p)T"
}

vol() {
    cur="$(amixer get Master -n |
           awk -F '\\[|\\]' '/[0-9]{1,3}%/ {print $2" "$6}')"

    case "$cur" in
        [0-9]%*|*f*) vol_icon="\\uf026" ;;
        [1-4]?%*)    vol_icon="\\uf027" ;;
        [5-6]?%*|*)  vol_icon="\\uf028" ;;
    esac

    printf "%b" "$vol_icon ${cur/ *}"
}

get_memory() {
	mem="$(< free -m | grep Mem | tr -s " " | cut -d " " -f 3)"
	printf "%s\\n" "$mem"
}

main() {

while :; do
	printf "%s/%s/%s\\n" \
		"%{l}  ${memory}  " \
		"%{c}${tim}" \
		"%{r}${vol}	 "
	sleep .1s
done |\
	
	lemonbar -db \
					 -g 400x20+850+20 \
					 -B "${color0:-#000000}" -F "${color15:-#F0F0F0}"\
					 -n "bar" -f "$font" -f "$icon" 
}

main "$@"
