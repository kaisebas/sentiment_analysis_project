#!/bin/bash

##### THIS SCRIPT WILL CLEAN ONLY IMDB RELATED FILES #####
##### IT WILL LEAVE ONLY THE REVIEWS #####

for file in $1/*;do
        echo $file

        sed -i '/Was this review helpful to you\?/,/\(Rewatch Value\|This review may contain spoilers\)/d' $file

        name=$(basename "$file" .txt)
        tr -cd '[[:alnum:][:space:]]' < $file | tr 'A-Z' 'a-z' |
                # eliminates extra lines and outputs new clean file in the same directory
                sed '/^$/d' > "${1}/${name}clean.txt"
done

