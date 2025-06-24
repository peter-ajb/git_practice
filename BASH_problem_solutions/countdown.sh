#!/usr/bin/env bash

#accept argument, count down from argument to 0, blast off!
time=$1
while ((time>0)); do
	echo -ne "T-minus $time seconds\r"
	sleep 1
	time2=$((time-1))
	time=$time2
done
echo -ne "BLAST OFF!               "
sleep 1
echo ""
