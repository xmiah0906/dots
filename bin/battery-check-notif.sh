 #!/bin/bash
while true
do
battery_level=$(sh ~/bin/battery-status.sh | sed -e 's/%//g')

#Battery 0: Discharging, 13%, 00:52:52 remaining
#To get the battery percentage only we'll cut the
#second value which ends at ", ". So we get 13%
#Now we'll replace the % sign by "", so 13% will
#be changed to 13 now.
#acpi -b produces output as
echo $battery_level       #$battery_level=13

#If the charger is plugged in, acpi shows "charging"
#and if it's not plugged in, it shows "discharging".
#if acpi -b shows charging, "grep -c" will return 1
#else it will return 0
ac_power=$(acpi -b | grep -c "Charging")
echo $ac_power          #1 if charging(plugged in) and 0 if discharging (not plugged in)

#when the battery is charging and it gets charged up to 100%

if [[ $ac_power -eq 1 && $battery_level -eq 97 ]]  #if charging and battery_level==100
then
export DISPLAY=:0.0
notify-send -i "/home/xmiah/Desktop/lazy_girl.png" "Jsilver, Battery is full." "Level: $battery_level% ";
#it notifies Ali, Battery is full and shows the battery
#full image which is stored in /usr/local/bin directory

#so, it will narrate, please remove the
#charger. It's charged up to 100%.
espeak "Charge full, Please Remove the charger" -s 140

fi
#when the battery is not charging
#and it goes below 40%

if [[ $ac_power -eq 0 && $battery_level -lt 30 ]]
then
export DISPLAY=:0.0
notify-send -i "/home/xmiah/Desktop/iron-man.png" "Jsilver, Battery is Low." "Level: $battery_level% ";

#similarily, it narrates
#"please connect the charger"
espeak "Please connect the charger" -s 140

fi

sleep 600

done
