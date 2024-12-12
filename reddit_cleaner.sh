#!/bin/bash

##### THIS SCRIPT WILL CLEAN REDDIT RELATED FILES LEAVING ONLY THE COMMENTS W/O EMOJIS #####

for file in $1/*;do
        echo $file

	name=$(basename "$file" .txt)

        ## gets rid of everything from upvote to (not including) /u ##
	sed "s/^Edited [0-9]\+\(mo ago\|y ago\)$//g" < $file | sed "/^$/d" |
		sed "s/^[0-9]\+\(mo ago\|y ago\)$//g" | sed "/^$/d" |
		sed "s/^Comment Image$//g" | sed "/^$/d" |
		sed "s/^OP$//g" | sed "/^$/d" |
		sed "/avatar$/,+1d" |
		#sed '/^•/{N;d}' |
		sed "/^Profile Badge/d" | 
		sed "/^1 more reply$/,+1d" | 
		sed "/^[0-9]\+ more replies$/,+1d" | 
		#sed "/^u\//{N;d}" | 
		sed "/^emoji:/,+1d" | 
		sed "s/^[0-9]\+$//g" | sed "/^$/d" |
		sed "/^Upvote$/,+6d" | 
		#sed "/^[[:alpha:]]\+$/d" |
		## lowercase everything. eliminates extra lines and outputs new clean file in the same directory
		tr 'A-Z' 'a-z'| 
		tr -cd '[[:alnum:][:space:]]' | 
		tr -d ')(/' > "${1}/${name}clean.txt"

done


## Combines all the cleaned files into a single one
for file in $1/*clean.txt;do
        folder=$(basename "$1")
        cat $file >> "${1}/${folder}combined.txt"

done


