#!/usr/bin/env bash
#list country + capital from dataset.
input=$1
len=$(($(awk '{ if (length($1) > max) max = length($1) } END { print max }' country-list.csv)+2))
if [ "$input" == "sort" ]; then
	awk -F',' 'NF >= 2 { print $2 "," $1 }' country-list.csv | sort | awk -F',' -v len="$len" '{printf "%-*s %s\n", len, $2, $1 }'

else
	awk -F',' -v len="$len" -v letter="$input" 'index($0, letter) NF >= 2 {printf "%-*s %s\n", len, $1, $2 }' country-list.csv
fi
