#!/bin/bash

output=$(/usr/local/bin/speedtest --server 14204)
echo "$output" | awk '/Mbit\/s/ || /Testing from/ || /Hosted by/{print}' | nc -w0 -u 192.168.1.108 9994
echo "done..."
