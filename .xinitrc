
#  ╻ ╻╻┏┓╻╻╺┳╸┏━┓┏━╸
#  ┏╋┛┃┃┗┫┃ ┃ ┣┳┛┃
#  ╹ ╹╹╹ ╹╹ ╹ ╹┗╸┗━╸

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export _JAVA_AWT_WM_NONREPARENTING=1

# dbus-launch
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS";
then
	eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# Fcitx-Unikey
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
ibus-daemon -drx &
#fcitx -d &

# Touchpad
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 &
#xinput set-prop "Synaptics TM2668-02" "libinput Tapping Enabled" 1 &
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 0.45 &

# Fonts
xset +fp /usr/share/fonts
xset +fp /home/xmiah/.fonts
xset fp rehash

# Apps
wal -R -s -e &
sleep 0.2 ; xrdb -load ~/.Xresources &
#compton --xrender-sync-fence --xrender-sync -b --backend glx --glx-no-rebind-pixmap -cCGb -r 20 -l -30 -t -10 -o 0.6 --vsync opengl-swc --no-fading-openclose --blur-method kawase &
picom --config $XDG_CONFIG_HOME/picom/picom.conf &
xsetroot -cursor_name left_ptr &
urxvtd -q -f -o
xset m 1/1
xset s 180 180
xset r rate 250 50
bash /home/xmiah/Desktop/aria2rpc/aria2-daemon-firefox.sh &
bash /home/xmiah/bin/battery-check-notif.sh &
xcalib -d :0 ~/Desktop/ICC/LG_34WL75C.icm &
bash /home/xmiah/bin/wallblur.sh &

# Windows Managers
sxhkd -c ~/.config/openbox/openboxrc &
#sxhkd -c ~/.config/2bwm/2bwmrc &
#bash /home/xmiah/.config/openbox/wal-set &
#sleep 0.4 ; pkill -9 polybar
exec openbox


# vim:ft=dosini
