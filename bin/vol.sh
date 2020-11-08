#!/usr/bin/env bash
# audio volume bar

. "${HOME}/.cache/wal/colors.sh"

IF="Master"      # audio channel: Master|PCM
SECS="3"         # sleep $SECS
BG="$color0"     # background colour of window
FG="#fff"        # foreground colour of text/icon
BAR_FG="$color1" # foreground colour of volume bar
BAR_BG="$color0" # background colour of volume bar
XPOS="1705"      # horizontal positioning
YPOS="40"        # vertical positioning
HEIGHT="35"      # window height
WIDTH="205"      # window width
BAR_WIDTH="160"  # width of volume bar
BAR_HEIGHT="3"   # height of volume bar

# don't touch
PIPE="/tmp/volpipe"

err() {
  echo "$1"
  exit 1
}

usage() {
  echo "usage: vol [option] [argument]"
  echo
  echo "Options:"
  echo "     -i, --increase - increase volume by \`argument'"
  echo "     -d, --decrease - decrease volume by \`argument'"
  echo "     -t, --toggle   - toggle mute on and off"
  echo "     -h, --help     - display this"
  exit
}

#Argument Parsing
case "$1" in
  '-i'|'--increase')
    [ -z "$2" ] && err "No argument specified for increase."
    [ -n "$(tr -d [0-9] <<<$2)" ] && err "The argument needs to be an integer."
    AMIXARG="${2}%+"
    ;;
  '-d'|'--decrease')
    [ -z "$2" ] && err "No argument specified for decrease."
    [ -n "$(tr -d [0-9] <<<$2)" ] && err "The argument needs to be an integer."
    AMIXARG="${2}%-"
    ;;
  '-t'|'--toggle')
    AMIXARG="toggle"
    ;;
  ''|'-h'|'--help')
    usage
    ;;
  *)
    err "Unrecognized option \`$1', see vol --help"
    ;;
esac

#Actual volume changing (readability low)
AMIXOUT="$(amixer set "$IF" "$AMIXARG" | tail -n 1)"
MUTE="$(cut -d '[' -f 4 <<<"$AMIXOUT")"
VOL="$(cut -d '[' -f 2 <<<"$AMIXOUT" | sed 's/%.*//g')"

#Using named pipe to determine whether previous call still exists
#Also prevents multiple volume bar instances
if [ ! -e "$PIPE" ]; then
  mkfifo "$PIPE"
  (dzen2 -tw "$WIDTH" -h "$HEIGHT" -x "$XPOS" -y "$YPOS" -bg "$BG" -fg "$FG" < "$PIPE"
   rm -f "$PIPE") &
fi

#Feed the pipe!
(echo "$VOL" | gdbar -fg "$BAR_FG" -bg "$BAR_BG" -w "$BAR_WIDTH" -h "$BAR_HEIGHT" ; sleep "$SECS") > "$PIPE"
