#!/bin/bash
PATH_CENT="~/bin/"; PATH_MAC="/usr/local/bin/"; PATH_ALP="/usr/bin/"; host=$(hostname); case "$host" in CENTOS|CENT*) PATH_TO_USE="$PATH_CENT";;Johns|Johns*) PATH_TO_USE="$PATH_MAC";; *) PATH_TO_USE="$PATH_ALP" ;; esac; output=$("$PATH_TO_USE"speedtest --server 14204); echo "$output" | awk '/Mbit\/s/ || /Testing from/ || /Hosted by/{print}' 


# | nc -w0 -u 192.168.1.108 9994
