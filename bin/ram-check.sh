
#!/bin/bash
free_mem=`free -m | sed -n 2p | awk '{print $4}'`
total=`free -m | sed -n 2p | awk '{print $2}'`
usage=`free -m | sed -n 2p | awk '{print $2 - $4}'`

echo $usage"MiB "
