#!/bin/bash
# read -p "Enter file name : " filename
filename='.gitignore'
file_archive='archives.zip'
rm $file_archive
result=''
n=1
while read line; do
# reading each line
if [ -n "$line" ]; then
  # @todo chercher avec des extensions
  if [ -n "$line" ]; then
    echo "Line No. $n : $line"
    result+="$line "
  fi
fi
n=$((n+1))
done < $filename

test='file1.txt'
if [ -n "$result" ]; then
zip -r $file_archive $result

fi
