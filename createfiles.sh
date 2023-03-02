#!/bin/bash
#This is a script for creating a batch of 25 files

read -p "Please enter your name for file creation: " name
if test -z "$name"
then
   echo "Name is not entered. Please try again"
   exit 1
fi

# Search and extract the highest number from the list of matching filename 
startindex=$(ls -lfru | grep $name | tail -n 1 | sed s/$name//)
test -z $startindex&&startindex=1||startindex 

#Create a batch of 25 files by appending name and increasing numbers
for((counter=startindex;counter<startindex+25;counter++));
do
        touch $name$counter
        if [[ $? -eq 0 ]]
        then
            echo "File was created $name$counter"
        else
            echo "File"$name$counter"was not created"
        fi
done
