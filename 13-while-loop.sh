#!bin/bash

while IFS= read -r line # Internal Field Separator
do 
    echo "$line"
done < 01-shell-practice.sh