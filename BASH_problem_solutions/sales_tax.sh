#!/usr/bin/env bash

#create a sales tax calculator for 22% tax
#accept 12.00, round to 2dp. 
rate=122
item=$1
if [[ $item = "" ]]; do
	echo "Error, no price to calculate"
else
	awk -v a=$rate -v b=$item "BEGIN {printf \"$%.2f \", (a/100)*b}" | tr ',' '.'
	echo ""
fi
