#!/usr/bin/bash

# Get fields from mpc, split by tabs
IFS=$'\t' read artist title \
	<<< "$(mpc --format="%artist% - %title%")"

notify-send --urgency=low --expire-time=5000 --app-name=ncmpcpp \
	--icon="♫" "♫  $artist $title"
