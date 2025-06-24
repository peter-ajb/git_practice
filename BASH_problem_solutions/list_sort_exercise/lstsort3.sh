#!/usr/bin/env bash

array=("$@")
for (( j=0; j < ${#array[@]} - 1; j++)); do
        if [ "${array[j]}" == "a" ]; then
                echo "a ${array[j+1]}:"
                ls -1 "${array[j+1]}" | sort | sed 's/^/  /'
	fi
        if [ "${array[j]}" == "b" ]; then
                echo "b ${array[j+1]}:"
                ls -1 "${array[j+1]}" | sort -r | sed 's/^/  /'
	fi
        if [ "${array[j]}" != "b" ] && [ "${array[j]}" != "a" ] && [ "${array[j-1]}" != "b" ] && [ "${array[j-1]}" != "a" ]; then
                echo "c ${array[j]}:"
                ls "${array[j]}" | sed 's/^/  /'
        fi
done
