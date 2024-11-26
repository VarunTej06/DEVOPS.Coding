#!/bin/bash

set -x
: '
For Loop Syntax:

for mission in $(cat mission-names.txt)
do
mkdir $mission
done


for mission in 1 2 3 4 5 6
# loop......

for mission in {1..5}
# loop .....

for (( mission=0 ; mission<=10 ; mission++ ))
# loop.......'

# Sample -1: FInd Word and Line count in files
for file in $(ls); do
  echo "word count of $file is $(cat $file | wc -w)"
  echo "line count of $file is $(cat $file | wc -l)"
done

# Sample -2: Create and delete files using loops

# Define an array with elements
# dependency_req=("git" "docker.io" "tree")
filename=("sai" "varun" "teja")

for tool in "${filename[@]}"; do #preferred to read tools req. or users req. or files req. from anoter file using cat command
# sudo apt -y install $dependency_req
sudo touch "${tool}.txt" #since .txt is there add curly braces to the variable
echo "created file is: ${tool}.txt"
done

if [ -e "sai.txt" ] || [ -e "varun.txt" ] || [ -e "teja.txt" ]; then
  for name in "${filename[@]}"; do
     rm -f ${name}.txt
     echo "Deleted ${name}.txt"
  done
else
  echo "Unable to delete created files"
fi
