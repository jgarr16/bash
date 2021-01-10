#!/bin/bash
PATH_CENT="/home/jrgarrigues/bin/"; PATH_MAC="/usr/local/bin/"; PATH_ALP="/usr/bin/"; host=$(hostname); case "$host" in CENTOS|CENT*) PATH_TO_USE="$PATH_CENT";;Johns|Johns*) PATH_TO_USE="$PATH_MAC";; *) PATH_TO_USE="$PATH_ALP" ;; esac; output=$("$PATH_TO_USE"speedtest); echo "$output" | awk '/Mbit\/s/ || /Testing from/ || /Hosted by/{print}' | nc -w 1 -u 192.168.1.107 9994



# Depending on the type of outcome you want:
# | nc -w 1 -u 192.168.1.107 9994
# > /dev/ttys009
# --server 14204
# sh -c "$(curl -  https://raw.githubusercontent.com/jgarr16/bash/main/jgspeed.sh)"
