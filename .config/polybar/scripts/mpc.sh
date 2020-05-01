#!/bin/zsh

# get title
title=$(mpc -f %title% | sed -n 1p);

# get artist
artist=$(mpc -f %artist% | sed -n 1p);

# create buffer file if isnt exist
if [ ! -f /tmp/polybuff ]
then
    echo "Creating file...";
    echo "mpcstate=1" > /tmp/polybuff;
fi

# write state in buff file


# get current state
state=$(cat /tmp/polybuff | grep "mpcstate" | cut -d "=" -f 2);

# invert state
state=$(($state*-1));

# backuping file
mv /tmp/polybuff /tmp/polybuff.bak;

# write value
cat /tmp/polybuff.bak | sed -s "s/mpcstate=.*/mpcstate=$state/" /tmp/polybuff.bak > /tmp/polybuff;

# remove old backup
rm /tmp/polybuff.bak;

# get string length of both informations
titleLenght=${#title};
artistLenght=${#artist};

# limit string lenght to $len
len=25;
title=${title:0:$len};
artist=${artist:0:$len};

# add space padding to string shorter than 20
while [ ${#artist} -lt $len ]
do
    artist="$artist ";
done
while [ ${#title} -lt $len ]
do
    title="$title ";
done

# display artist or title acording to state
if [ $state -eq -1 ]
then
    echo "$artist - $title";
else
    echo "";
fi

