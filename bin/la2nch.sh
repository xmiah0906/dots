#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar top --quiet &
bspc config top_padding 28 & 

echo "Bars launches..."
