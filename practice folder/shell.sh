#!/bin/bash
echo "Date = $date"
echo "Hostname = $hostname"

FILE="/tmp/logs.txt"

if [ -f "$FILE" ]; then
    echo "File exists"
else
    echo "File doesn't exists"
fi

df -h  #disk usage

for item in vinti devops training; do
    echo "Item : $item"
done

LOAD=$(uptime | awk '{print $10}')
echo "Current CPU load is $LOAD"

for i in {1..10}; do
    echo "number $i"
done
