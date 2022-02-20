#!/bin/bash
read -p "Enter file name [.gitignore]: " filename
filename=${filename:-.gitignore}
file_archive='archives'

# clean up the archives files.
rm "${file_archive}.zip"
rm "${file_archive}.tar.gz"

b='#'
result=''
n=1
while read line; do
# reading each line
if [ -n "$line" ]; then
    firstCharacter=${line:0:1}
    if [ "$firstCharacter" != "#" ]; then
      echo "Line No. $n : $line"
      result+="$line "
    else
      echo "This line $n: $line is not used"
    fi
fi
n=$((n+1))
done < $filename

if [ -n "$result" ]; then
zip -r "${file_archive}.zip" $result
tar -czvf "${file_archive}.tar.gz" $result
fi
