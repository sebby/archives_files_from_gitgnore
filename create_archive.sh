#!/bin/bash
# read -p "Enter file name : " filename
filename='.gitignore'
file_archive='archives.zip'
rm $file_archive
b='#'
result=''
n=1
while read line; do
# reading each line
if [ -n "$line" ]; then
    firstCharacter=${line:0:1}
    if [ "$firstCharacter" != "$b" ]; then
      echo "Line No. $n : $line"
      result+="$line "
    else
      echo "This line $n: $line is not used"
    fi
fi
n=$((n+1))
done < $filename

echo $result
if [ -n "$result" ]; then
zip -r $file_archive $result
fi
