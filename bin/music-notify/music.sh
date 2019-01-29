spotify=$(pgrep -x spotify)

if [ "$spotify" == "" ]; then
	${HOME}/bin/music-notify/mpd-notify.sh
else
	${HOME}/bin/music-notify/spotify-notify.sh
fi

