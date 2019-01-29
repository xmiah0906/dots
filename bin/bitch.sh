#!/bin/sh

f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
d=$'\e[1m'
t=$'\e[0m'
v=$'\e[7m'
 
gtkrc="$HOME/.gtkrc-2.0"
GtkTheme=$( grep "gtk-theme-name" "$gtkrc" | cut -d\" -f2 )
GtkIcon=$( grep "gtk-icon-theme-name" "$gtkrc" | cut -d\" -f2 )
GtkFont=$( grep "gtk-font-name" "$gtkrc" | cut -d\" -f2 )
 
# Wallpaper set by feh
# Wallpaper=$(cat ~/.fehbg | cut -c 16-70)
 
# Settings from ~/.Xdefaults
xdef="~/.Xresources"
#TermFont="$(grep 'font' ~/.Xresources | awk '{print $2}' | cut -d ":" -f2 | cut -d ":" -f1)"
 
# Time and date
time=$( date "+%H.%M")
date=$( date "+%a %d %b" )
 
# OS
OS=$(uname -r)
dist=$(cat /etc/*-release | grep -i name | cut -d'=' -d'"' -f2 | sed -n 1p)
bit=$(uname -m)
 
# WM version
wm=$(wmctrl -m | grep -i name | awk '{print $2}')
 
# Other
UPT=`uptime | awk -F'( |,)' '{print $2}' | awk -F ":" '{print $1}'`
uptime=$(uptime | sed 's/.*up \([^,]*\), .*/\1/')
uptime2=$(uptime | sed -nr 's/.*\s+([[:digit:]]{1,2}):[[:digit:]]{2},.*/\1/p')
size=$(df | grep '^/dev/[hs]d' | awk '{s+=$2} END {printf("%.0f\n", s/1048576)}')
use=$(df | grep '^/dev/[hs]d' | awk -M '{s+=$3} END {printf("%.0f\n", s/1048576)}')
gb=$(echo "G")
pac=$(pacman -Qe | wc -l)
pacman=$(pacman -Q | wc -l)
COUNT=$(cat /proc/cpuinfo | grep 'model name' | sed -e 's/.*: //' | wc -l)
cpu=$(lscpu | grep -i 'model name' | awk -F ':' '{print $2}' | cut -c13-54)
#laptop=$(dmidecode | grep Product)
lap1=$(cat /sys/class/dmi/id/sys_vendor)
lap2=$(cat /sys/class/dmi/id/product_name)
vga=$(lspci | grep -i vga | cut -c36-76)
memkb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
ram=$(expr $memkb / 1024)
freeram=$(free -m | grep -i mem | awk '{print $3}')

cat << EOF
$f7$d
$f7                            .      'o;       .
$f7                          ;Nd   'dNMMo   'oKMd                            .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
$f7                         oMMX.oXMMMMMOl0WMMMMd  ..,:cl.                  MM                                           MM
$f7                        dMMMMMMMMMMMMMMMMMMMMNKWMMMMMMd                 MM                                             MM
$f7           .,:ldkO0KXXXXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMX                 MM    MMMMM   MM MMMMMM .dOkc  MM  MM          MM
$f7     .;oONMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                MM    0M  MM  MM   MM   KX  Ml MM  MM          MM
$f7     kMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'                MM    MMmmW.  MM   MM   X0     MM  MM          MM
$f7     .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM;                MM    MMMMMM  MM   MM   X0     MKMMMM          MM
$f7      kMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                MM    MM  WN  MM   MM   KK  Ml Mk  MM          MM
$f7       NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0                MM    MMMMM'  MM   MM   '0XXx' Xd  XM  M  M    MM
$f7       'WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMx               MM                                             MM
$f7        :MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:              cK;                                           MM
$f7         oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW.              .OW.   .:MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
$f7          dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd              x0..ckOo,
$f7           oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMk KW            'XNkko'            $f6 $USER $f7@ $f1$HOSTNAME
$f7            oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMk kM;          .Ol'                $H $f4$time$NC - $f7$date
$f7             :WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXMMNx.
$f7              :MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMMMMMMMMMMMMMM0.
$f7              .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  MMMMMMMM' OMMMOl         OS »$f4 $OS$NC $bit
$f7               NMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  MMMMMMMMKxMM0X:         $f7 WM »$f4 $wm
$f7               .NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW;
$f7                KMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO.              Theme » $GtkTheme
$f7               kMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0,                Icon  » $GtkIcon
$f7              cMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNk;.                  Font  » $GtkFont » #$f6$TermFont
$f7              c;'.dMMMMMMMMMMMMMMMMMMMMMMMM$t$f1 KKK0kxd             $d$f7
$f7                  OMMMMMMMMMMMMMMMMXdlc;'.  $t$f1 :ddxx,             $d$f7        $dist » $f2$freeram$f7 with $f2$ram$f7 MB Memory
$f7                  WMM"'   NMMMMMMk'            $t$f1 lxx.            $d$f7        pacman » $f2$pacman$f7 on $f2$size$f7 GB
$f7                  W       ,MMMM0.              $t$f1 .xxo            $d$f7
$f7                           :MN;                $t$f1  ;xx;           $d$f7
$f7                            '.                 $t$f1   dxx.          $d$f7        $cpu
$f7                                               $t$f1   'xxx.         $d$f7
$f7                                               $t$f1    dxxxc.       $d$f7        $vga
$f7          "..you still can go                  $t$f1    .xxxxxo'     $d$f7
$f7           fuck yourself.."                    $t$f1     ,xxxxxxxl.  $d$f7
$f7                       the$f1 cat$f7                 $t$f1      cxxxxxxxd  $d$f7
$f7                                               $t$f1       :cloodxx' $d$f7
$f7
EOF
