#!/bin/bash
# Define the output directory
output_dir="output_logs"
mkdir -p "$output_dir"

# The log file name
logfilename="$output_dir/systemavailability$(date +%Y%m%d).log"

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

#size checking (byte) and log rotate
filesize=65000
size_checking=$(stat -c%s "$logfilename")

if [ "$size_checking" -gt "$filesize" ]; then 
  countfile=1

  while [ -f "$output_dir/systemavailability$(date +%Y%m%d)-$countfile.log" ]; do
    countfile=$((countfile + 1))
  done

  mv "$logfilename" "$output_dir/systemavailability$(date +%Y%m%d)-$countfile.log"
  touch "$logfilename"
fi

#zip log file yesterday
yesterday=$(date -d "yesterday" "+%Y%m%d") #date format of yesterday

zipfilename="$output_dir/systemavailability-$yesterday.zip"

if ls $output_dir/systemavailability$yesterday*log >/dev/null 2>&1 && [ ! -f "$zipfilename" ]; then
  zip -j -m "$zipfilename" $output_dir/systemavailability$yesterday*log
fi

#set the period of archive retention (days)
retention=30

find $output_dir -maxdepth 1 -type f -name "*.zip" -mtime +"$retention" -delete
