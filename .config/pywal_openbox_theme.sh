#!/bin/bash

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
cache_dir="${XDG_CACHE_DIR:-$HOME/.cache}"

# Delete old themerc created
rm "$cache_dir"/wal/themerc
rm ~/.themes/Py/themerc

# Copy themerc template
mkdir "$config_dir"/wal/templates/ 2> /dev/null
cp themerc "$config_dir"/wal/templates/themerc

# Generate a themerc from current wal colors
wal -nqi $(cat $cache_dir/wal/wal)

# Symlink themerc
ln -sf $cache_dir/wal/themerc $HOME/.themes/Py/openbox-3/themerc
