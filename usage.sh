#!/bin/sh

# This script sends a UDP message to Splunk that includes a date/time-stamped
# event with the current bandwith utilization for the month; thereby allowing
# tracking and monitoring of potential usage overuns.

# Change history:
# 12/25/2020 - John Garrigues - original code.


Help()
{
	# Display Help messages on the command line
	echo "This script sends a UDP message to Splunk that includes a date/time-stamped event with the current bandwith utilization for the month; thereby allowing tracking and monitoring of potential usage overuns."
	echo
	echo "Syntax: scriptTemplate [-u | -h]"
	echo "options:"
	echo "-u     Submit the bandwidth USAGE (in Gigabytes)."
	echo "-h     Print this HELP message."
	echo
}


while getopts ":uh" option; do
    case $option in
	u) # Enter bandwidth USAGE (in Gigabytes).
		echo "$(date +%FT%T.000-08:00) Xfinity usage: $2 GB" | nc -w 1 -u 192.168.1.107 9993
	   echo "$2 GB"
	   exit;;
   	h) # Print help message.
	   Help
   	   exit;;
       \?) # incorrect option
    	   echo "Error: Invalid option. Try -h instead?"
	   exit;;
    esac
done


USAGE=${2?Error: no Usage given}

