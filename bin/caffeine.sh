#!/usr/bin/env bash
# this script toggles automatic screen blanking and suspend
# useful when watching videos, for example
# depends on: X, xautolock, notification daemon

# get dpms status
DPMS=$(xset q | grep "DPMS is Disabled")

if [ "$DPMS" == "" ]; then
    # dpms enabed, turn it off
    xset s 0 0
    xset s noblank
    xset -dpms
    echo "Caffeine mode enabled"
    # send notification
    notify-send -u low -a "Caffeine" -i "caffeine" "Caffeine Mode Enabled"
else
    # dpms disabled, turn it on
    xset s 0 300
    xset s blank
    xset +dpms
    echo "Caffeine mode disabled"
    notify-send -u low -a "Caffeine" -i "caffeine" "Caffeine Mode Disabled"
fi;
