#!/bin/bash
pac=$(checkupdates 2>/dev/null | wc -l)
aur=$(cower -u 2>/dev/null | wc -l)

check=$((pac + aur))

if [[ "$aur" != "0" ]]
then
    echo "$check"
  else
    echo "$pac"
fi
