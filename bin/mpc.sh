csong=$(mpc current)
playing=$(mpc status | grep -o 'playing' )
p=" "

if [ "$playing" == "playing" ]; then
  notify-send -t 1000 -u low "$af0$txt $csong$p"
else [ "$playing" == "" ];
  echo ""
fi
