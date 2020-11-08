#!/bin/bash

dir="/sys/class/power_supply/BAT0/"
status=$( cat $dir"status" )
capacity=$( cat $dir"capacity" )
percentage=$((current*100/capacity))
echo $capacity"% "

