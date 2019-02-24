#!/bin/bash

notify-send -t 5000 -i "$DIR/icon.svg" "aria2" "<i>$(date +%T): Download completed</i> [#${1:0:6}] <b>${3##*/}</b>"
