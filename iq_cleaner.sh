#!/bin/bash

##### THIS SCRIPT CLEANS UP EVERYTHING AND LEAVES ONLY THE COMMENTS W/O EMOJIS ######
##### THIS WORKS WITH ONLY IQ (IQIYI) RELATED TEXT FILES #####

for file in $1/*;do
	echo $file
	
	name=$(basename "$file" .txt)

	## gets rid of 'reply', 'like', 'pic'. and those random number linesi, emojis, username and date lines
	sed "s/^Reply$//g" $file | sed "s/^Like$//g" | sed "s/^pic$//g" | tr 'A-Z' 'a-z' | sed "/\(month(s)\|day(s)\|hour(s)\)$/d" | sed "/-23$/d" | sed 's/replying to [^:]*://g' | tr -cd '[[:alnum:][:space:]]' | sed "/[0-9]\{8\}$/d" | sed '/^[0-9]*$/d' |

		## makes everything lowercase, deletes lines, and outputs clean file to same directory
		sed '/^$/d' > "${1}/${name}clean.txt" 			

	echo 'done'
done


## Combines all the cleaned files into a single one
for file in $1/*clean.txt;do
	folder=$(basename "$1")
	cat $file >> "${1}/${folder}combined.txt"

done

