#!/bin/bash

##### THIS SCRIPT WILL TAKE THE CLEANED FILES AND TURN THEM INTO TOKENED LISTS #####
##### THE OUTPUT WILL BE IN THE DIRECTORY WORDLISTS #####

name=$(basename "$1" .txt | sed 's/\(combined\|cleaned\|clean\|copy\)//')

## anything that is a space or a digit becomes a new line + new lines are squeezed. Then it's sorted 
tr -s '[:space:][:digit:][:punct:]' '\n' < "$1" | sort > "${name}tokenlisttemp.txt"

## stopwords from the sorted stopwords list are taken out of the sorted word list
grep -Fv -w -f stopwords_sorted.txt "${name}tokenlisttemp.txt" > "${name}tokenlisttemp1.txt"

## comm was attempted originally, but since I want to preserve duplicates to get the word count grep is better
#comm -23 "${name}tokenlisttemp.txt" "stopwords_sorted.txt" > "${name}tokenlisttemp1.txt"


## sorted again then uniq + sorted into numbered list by freq --> sent into new numbered token list file
sort "${name}tokenlisttemp1.txt" | uniq -c | sort -nr > "wordlists/tokens/${name}tokenlist.txt"


## This is just to make the file that the sentiment analysis in python will use. It's without the frequencies
tr -s '[:space:][:digit:][:punct:]' '\n' < "$1"  | grep -Fv -w -f stopwords_sorted.txt > "wordlists/analysis/${name}_analysislist.txt"

rm "${name}tokenlisttemp.txt"
rm "${name}tokenlisttemp1.txt"
