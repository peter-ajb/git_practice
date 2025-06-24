#!/usr/bin/env bash

echo "Hello please enter: date=  Optional:  name=  due_date=  message=  sender="
defaults=(1999.7.13 Kurt 2012.12.12 PC_LOAD_LETTER Rick)
read -a reply
result=("${defaults[@]}")
for i in "${!reply[@]}"; do
	result[$i]="${reply[$i]}"
done
echo "Hi ${result[1]},
can you submit you TPS reports please by ${result[2]} seeing as it is ${result[0]}
 already and the movie has to come out soon.
Wishing you ${result[3]}
from,
${result[4]}"

#options=(date= name= due_date= message= sender= )
#options2=()

