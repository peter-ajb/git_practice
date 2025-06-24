#!/usr/bin/env bash

#seconds=$1
echo "How many seconds would you like to sleep? Or write t:'secs'"
read seconds
if [[ $seconds == *"t:"* ]]; then
	#trim seconds
	seconds2="${seconds#t:}"
	#get time now
	time_now=$(date +"%S")
	#get time future
	if (( seconds2 >= time_now )); then
		wait=$((seconds2 - time_now))
	else
		wait=$((seconds2 + (60-time_now)))
	fi
	seconds=$wait
	echo "Sleeping for $seconds seconds" 

fi
sleep "$seconds"
echo $(date +"%T")
while true; do
	echo "Snooze 3 seconds? y/n"
	read reply
	if [ "$reply" == "y" ]; then
		sleep 2
	else
		echo "Times up!!"
		break
	fi
done
