#!/usr/bin/env bash

#accept argument, count down from argument to 0, blast off!
times=($@)

#count = longest in $@
for num in ${times[@]}; do
	if ((num > count)); then
		count=$num
	fi
done

#print initial set using echo
for num in "${times[@]}"; do
	echo "T-minus $num seconds"
done

#while count > -1, move up 1 line, itterate over times by index, clear the line and printf (as echo made wierd formatting)
while ((count > -1)); do
	echo -en "\033[${#times[@]}A"
	#echo -en \033[2K
        for (( j=0; j<${#times[@]}; j++ )); do
		echo -en "\033[2K\r"
		if (( ${times[j]} <= 0 )); then
			printf "BLAST OFF!\n"
		else 
			printf "T-minus %2d seconds\n" "${times[j]}"
			(( times[j]-- ))
		fi
	done
	((count--))
	sleep 1
done

# Move cursor to bottom again, leave work on screen for 2sec
echo -en "\033[${#times[@]}B\n"
sleep 2

#graveyard stuff                        echo -en T-minus ${times[j]} second
#BLAST OFF!%*s\n
#T-minus %2d seconds%*s\n ${times[j]} $((20-16)) 
