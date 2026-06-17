# Linux System Availability Logger

Simple Bash script to monitor system availability and automatically rotate log files.

## Features

- Create daily log files using format:
  
  systemavailabilityYYYYMMDD.log

- Record:
  
  - Current timestamp
  - Top 5 CPU-consuming processes
  - Memory usage percentage

- Automatic log rotation when file size exceeds 65 KB

- Archive previous day's logs into ZIP format

## Log Structure

Example:

systemavailability20260616.log
systemavailability20260616-1.log
systemavailability20260616-2.log

When the active log file exceeds 65 KB:

systemavailability20260616.log

will be rotated into:

systemavailability20260616-1.log

and a new log file will be created.

## Archive Process

At the start of a new day:

systemavailability20260615.log
systemavailability20260615-1.log
systemavailability20260615-2.log

will be compressed into:

systemavailability-20260615.zip

The original log files are removed automatically after compression.

## Requirements

- Linux
- Bash
- ps
- awk
- free
- stat
- zip

## Run

Make the script executable:

chmod +x systemavailability.sh

Execute:

./systemavailability.sh

## Example Output

==========================================
Time: 2026-06-16 09:30:12

Top 5 Proses CPU:
root 15.3% java
ubuntu 8.1% nginx
root 5.2% mysqld

Memory usage: 42.35%
==========================================

## Future Improvements

- Configurable log size threshold
- Archive retention policy
- Automatic cleanup of old archives
- Docker support
- Cron deployment examples
