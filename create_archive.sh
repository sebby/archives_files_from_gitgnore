#!/bin/bash
read -p "Enter file name [.gitignore]: " filename
filename=${filename:-.gitignore}
file_archive='archives'

# Clean up the archives files.
rm "${file_archive}.zip"
rm "${file_archive}.tar.gz"


# REGEX to exclude somme folders like vendor
REGEX_IGNORE_FOLDERS="^(\#|vendor\/)"


result=''
n=1
while read line; do
# reading each line
if [ -n "$line" ]; then
    if [[ $line =~ $REGEX_IGNORE_FOLDERS ]]; then
      echo "Line $n: $line has been ignored"
    else
      echo "Line $n: $line has been added"
      result+="$line "
    fi
fi
n=$((n+1))
done < $filename

if [ -n "$result" ]; then
zip -r "${file_archive}.zip" $result
tar -czvf "${file_archive}.tar.gz" $result
fi
