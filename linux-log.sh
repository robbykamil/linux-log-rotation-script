#filename
systemavailability$(date + %Y%m%d)-1.log

#printout the time
date | awk '{print $4}'

#list top 5 of processes with CPU usage
ps aux | awk '{print $1, $3, $13}' | head

#check percentage of memory usage
free | awk '/Mem:/ {printf "%.2f%%\n", $3/$2*100}' 


