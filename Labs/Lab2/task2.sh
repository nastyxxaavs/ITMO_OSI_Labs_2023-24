#! /bin/bash
:> task2_ans
for pid in $(ps -axo pid | tail -n +2)
do 
if [[ -r /proc/$pid/exe ]]
then
cat /proc/$pid/cmdline | grep "/sbin" | echo $pid >> task2_ans
fi
done
