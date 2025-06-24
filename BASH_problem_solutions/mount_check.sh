#!/usr/bin/env bash

#Script to check if a $1 is mounted

echo "what drive am I searching for?"
read drive
#echo ${drive,,} ${drive^^}
if df -h | awk -v a="${drive,,}" -v b="${drive^^}" '$0 ~ a || $0 ~ b {found=1} END {exit !found }'; then
	echo "$drive drive:"
	df -h | awk -v a="${drive,,}" -v b="${drive^^}" '$0 ~ a || $0 ~ b {print $1, $3, $5}'
else echo "ERROR no drive found."
fi
