engine=$(ibus engine)
if [ "$engine" == "Unikey" ]; then 
    ibus engine "xkb:us::eng"
else
    ibus engine "Unikey"
fi