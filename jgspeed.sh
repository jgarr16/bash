#!/bin/bash
PATH_CENT="/home/jrgarrigues/bin/"; PATH_MAC="/usr/local/bin/"; PATH_ALP="/opt/bin/"; host=$(hostname); case "$host" in CENTOS|CENT*) PATH_TO_USE="$PATH_CENT";;Johns|Johns*) PATH_TO_USE="$PATH_MAC";; *) PATH_TO_USE="$PATH_ALP" ;; esac; output=$("$PATH_TO_USE"speedtest --server 14204); echo "$output" | awk '/Mbit\/s/ || /Testing from/ || /Hosted by/{print}' | netcat -w1 -u 192.168.1.107 9994



# Depending on the type of outcome you want:
# | netcat -w=1 -u 192.168.1.107 9994
# > /dev/ttys009
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/jgarr16/bash/main/jgspeed.sh)"
# TODO: build in some fault tolerance so that when server 14204 isn't reachable, the script will wait for 30 minutes and then try again
#       the error message looks like: ERROR: No matched servers: 14204
#       For Alpine:
#           n=1;while [ "/volume1/crontab_scripts/JGSpeed | grep -q 'ERROR: No matched servers: 14204'" ] ; echo "JGSpeed #$n";n=$((n+1));do sleep 60; done
#       For Centos:
#       For MacOS:
#           n=1;while [ "/Users/jrgarrigues/bin/JGSpeed | grep -q 'ERROR: No matched servers: 14204'" ] ; echo "JGSpeed #$n";n=$((n+1));do sleep 60; done
# TODO: build an if/then for the nc - netcat portion at the end so that Alpine uses netcat, while the others use nc
