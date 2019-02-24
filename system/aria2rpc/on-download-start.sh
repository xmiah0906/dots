#!/bin/bash
notify-send -i "$DIR/icon.svg" "aria2" "<i>$(date +%T): Downloading</i> [#${1:0:6}]"
