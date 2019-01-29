#CURRENT=×
#OCCUPIED=×
#UNOCCUPIED=-
#!/bin/sh
work=$(xprop -root _NET_CURRENT_DESKTOP | sed -e 's/_NET_CURRENT_DESKTOP(CARDINAL) = //')

if [ ${work} -eq 0 ] 
then
    echo -e '  2BWM  ×  -  -  -  -  -  -  '
elif [ ${work} -eq 1 ]
then
    echo -e '  2BWM  -  ×  -  -  -  -  -  '
elif [ ${work} -eq 2 ]
then
    echo -e '  2BWM  -  -  ×  -  -  -  -  '
elif [ ${work} -eq 3 ]
then
    echo -e '  2BWM  -  -  -  ×  -  -  -  ' 
elif [ ${work} -eq 4 ]
then
    echo -e '  2BWM   -  -  -  -  ×  -  -  '
elif [ ${work} -eq 5 ]
then
    echo -e '  2BWM   -  -  -  -  -  ×  -  '
elif [ ${work} -eq 6 ]
then
    echo -e '  2BWM   -  -  -  -  -  -  ×  '
fi

