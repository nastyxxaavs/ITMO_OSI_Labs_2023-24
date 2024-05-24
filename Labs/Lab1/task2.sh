#! /bin/bash

strs=""
while true
do
read a
if [[ $a == "q" ]]
then
break
fi
strs=$strs$a
done
echo $strs
