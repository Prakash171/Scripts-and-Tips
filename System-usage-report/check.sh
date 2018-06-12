#!/bin/bash
printf "Memory\t\tDisk\t\tCPU\t\tTime_Stamp\n"
#end=$((SECONDS+3600))
#while [ $SECONDS -lt $end ]; do
while sleep 15m; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
Time_Stamp=$(date "+%Y-%m-%d %H:%M:%S")
echo "$MEMORY$DISK$CPU$Time_Stamp"
sleep 5
done
