#!/usr/bin/env bash

#sed command to change owner of home directory files from _user to _resu
input="$whoami"
reverse="$input" | rev
reverse=$(echo "$input" | rev )
useradd "$reverse"
for file in "/home/$input.txt"; do
	sudo chown [:["$reverse"]] '$file' 
	echo "Was $file now: $reverse"
	backwrd=$(echo "$file" | rev )
	mv "$file.txt" "$backwrd.txt"
done
