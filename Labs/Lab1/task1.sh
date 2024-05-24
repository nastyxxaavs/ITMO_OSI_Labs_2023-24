#! /bin/bash
read a b c 
if [[ $a -gt $b ]] && [[ $a -gt $c ]]
then
echo $a 
else
if [[ $c -gt $a ]] && [[ $c -gt $b ]]
then
echo $c
else
echo $b
fi
fi
