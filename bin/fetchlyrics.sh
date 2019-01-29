#!/bin/bash
# fetchlyrics.sh - Fetches and displays lyrics for Spotify
# Copyright (C) 2017 oneseveneight
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
# 
# Email: oneseveneight@airmail.cc

rm -rf /tmp/lyrics/
if dbus-send --print-reply \
	--session \
	--dest=org.mpris.MediaPlayer2.spotify \
	/org/mpris/MediaPlayer2 \
	org.freedesktop.DBus.Properties.Get \
	string:'org.mpris.MediaPlayer2.Player' \
	string:'Metadata' > /dev/null 2>&1 
then
	mkdir /tmp/lyrics
	touch /tmp/lyrics/dummy
	while [[ true ]] 
	do
		SONG=$(dbus-send --print-reply \
			--session \
			--dest=org.mpris.MediaPlayer2.spotify \
			/org/mpris/MediaPlayer2 \
			org.freedesktop.DBus.Properties.Get \
			string:'org.mpris.MediaPlayer2.Player' \
			string:'Metadata' | grep title -A 1 |tail -n 1 |cut -c 43-| sed 's/"*"//g')

		ARTIST=$(dbus-send --print-reply \
			--session \
			--dest=org.mpris.MediaPlayer2.spotify \
			/org/mpris/MediaPlayer2 \
			org.freedesktop.DBus.Properties.Get \
			string:'org.mpris.MediaPlayer2.Player' \
			string:'Metadata' | grep albumArtist -A 2 | tail -n 1 | cut -c 26- | sed 's/"*"//g')
		NAMECLN=$(echo "$ARTIST $SONG" | sed -e 's/\(.*\)/\L\1/' \
			-e 's/[\.,()?\:\x27#]//g' \
			-e 's/&/and/g' \
			-e 's/ feat .*//g' \
			-e '/remix/!s/ - .*//g' \
			-e 's/side[^:]*://g' \
			-e 's/  */ /g' \
			-e 's/ /-/g' \
			-e 's/--*/-/g' \
			-e 'y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜ/aaaaeeeeiiiioooouuuuuuuu/' \
			|tr -d '\200-\377')-lyrics 
		if [[ -e /tmp/lyrics/$NAMECLN ]]
		then
			sleep 1
		else
			clear && clear
			echo "$ARTIST - $SONG"
			rm /tmp/lyrics/*
			if wget -q https://genius.com/$NAMECLN -O /tmp/lyrics/$NAMECLN; then
				cat /tmp/lyrics/$NAMECLN \
					|grep -e '<div' -e '<br>' -e '</a>' -e '</p>' \
					|tr -d "\n" \
					|sed -e 's/Check <a.*GENIUS//g' \
					-e 's/<\/p>.*//' \
					-e 's/.*<div class="lyrics">//g' \
					-e 's/<br>/\n/g' \
					-e 's/}[^>]*>//g' \
					-e 's/<[^>]*>//g' \
					-e 's/    //g' \
					-e 's/  //g' \
					-e 's/<a.*{//g' \
					-e 's/&amp;/\&/g'
			elif [[ $SONG = "" ]]; then
				echo "It appears Spotify has been closed, exiting..."
				exit
			else
				echo "Could not retrive lyrics from https://genius.com/$NAMECLN"
			fi
		fi
	done
else
	echo "Could not connect to Spotify"
fi
rm -rf /tmp/lyrics
