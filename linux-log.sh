#!/bin/bash
# The log file name
logfilename="systemavailability$(date +%Y%m%d).log"

# Create the log file if does not exist
if [ ! -f "$logfilename" ];
  then touch "$logfilename"
fi

{
# Get the data and write out to the log
echo "=========================================="

# Current time (Format: YYYY-MM-DD HH:MM:SS)
echo "Time: $(date '+%Y-%m-%d %H:%M:%S')"

# List of top 5 processes
echo "Top 5 Proses CPU:"
ps aux --sort=-%cpu | awk 'NR>1 {print $1, $3 "%", $11}' | head -n 5

#Memory usage
echo -n "Memory usage: "
free | awk '/Mem:/ {printf "%.2f%%\n", $3/$2 * 100}'
echo "=========================================="
} >> "$logfilename"
