#! /bin/bash

if [ $# -ne 1 ]
then
echo "Error: Incorrect number of parameters. Usage: $0 <filename>"
exit 1
fi

if [[ -d $1 ]]
then
echo "Error: dir is not processec"
exit 1
fi

if [[ ! -f $1 ]]
then
echo "Error: File does not exists"
exit 1
fi

file_name=$(echo "$1") 
home_dir="$HOME"
trash_dir="$home_dir/trash"

if [[ ! -d $trash_dir ]]
then
mkdir $trash_dir || { echo "Error: Unable to create .trash dir in home dir"; exit 1;}
fi



