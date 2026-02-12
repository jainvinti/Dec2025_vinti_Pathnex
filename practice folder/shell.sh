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
