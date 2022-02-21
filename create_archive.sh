#!/bin/bash
read -p "Enter file name [.gitignore]: " filename
filename=${filename:-.gitignore}
file_archive='archives'

# Clean up the archives files.
rm "${file_archive}.zip"
rm "${file_archive}.tar.gz"

# @link https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# REGEX to exclude somme folders like vendor
REGEX_IGNORE_FOLDERS="^(\#|vendor\/)"


result=''
n=1
while read line; do
# reading each line
if [ -n "$line" ]; then
    if [[ $line =~ $REGEX_IGNORE_FOLDERS ]]; then
      echo "Line ${n} : ${line} has been ignored"
      # echo "${red}red ${n} text ${green}green text${reset}"
    else
      echo "Line $n: $line has been added"
      result+="$line "
    fi
fi
n=$((n+1))
done < $filename

if [ -n "$result" ]; then
echo "${green}Compression des fichiers${reset}"
# zip -r "${file_archive}.zip" $result
tar -czvf "${file_archive}.tar.gz" $result
fi
