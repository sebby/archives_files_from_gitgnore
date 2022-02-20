#!/bin/bash
# read -p "Enter file name : " filename

filename='.gitignore'
n=1
while read line; do
# reading each line
if [ -n "$line" ]; then
    echo "Line No. $n : $line"
fi
n=$((n+1))
done < $filename
