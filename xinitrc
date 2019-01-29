#  ╻ ╻╻┏┓╻╻╺┳╸┏━┓┏━╸
#  ┏╋┛┃┃┗┫┃ ┃ ┣┳┛┃
#  ╹ ╹╹╹ ╹╹ ╹ ╹┗╸┗━╸

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
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
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx -d &

# Touchpad
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 &
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 0.45 &

# Fonts
xset +fp /usr/share/fonts
xset +fp /home/xmiah/.fonts
xset fp rehash

# Apps
nitrogen --restore &
sleep 0.2 ; xrdb -load ~/.Xresources &
#compton -b --backend glx --glx-no-rebind-pixmap -cCfFbG -I 0.05 -D 10 -r4 -l-6 -t-5 -o.99 --vsync opengl-swc --no-fading-openclose & 
compton -b --backend glx --glx-no-rebind-pixmap -cCGb -r 20 -l -30 -t -10 -o 0.6 --vsync opengl-swc --no-fading-openclose --blur-method kawase & 
xsetroot -cursor_name left_ptr &
urxvtd -q -f -o
xset m 1/1
bash /home/xmiah/Void-Linux/xmiah/Desktop/aria2rpc/aria2-daemon-firefox.sh &
tint2 &

# dunst
export DUNST_FONT='Roboto Mono for Powerline 8'
export DUNST_SIZE='0x0-20+30'
dunst -fn "$DUNST_FONT" -geometry "$DUNST_SIZE" &

# 2bwm 
sxhkd -c ~/.config/2bwm/2bwmrc &
exec 2bwm

