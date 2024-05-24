#! /bin/bash
if [[ $( pwd ) == $HOME ]]
then
echo $HOME
echo 0
else
echo "Error: This file is not in the working dir!"
echo 1
fi
