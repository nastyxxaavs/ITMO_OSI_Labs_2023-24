#! /bin/bash

 :> file
for pid in $(ps -axo pid | tail -n +2)
do
if [[ -r /proc/$pid/status && -r /proc/$pid/sched ]]
then
PPid=$(grep -s -E "^PPid" /proc/"$pid"/status | awk '{print $2}')
sum_exec_runtime=$(grep -s -E "^se.sum_exec_runtime" /proc/$pid/sched | awk '{print $3}')
nr_switches=$(grep -s -E "^nr_switches" /proc/$pid/sched | awk '{print $3}')

if [[ ${nr_switches} -ne "" ]]
then
avg_atom=$( echo "$sum_exec_runtime / $nr_switches" | bc -l)
fi
echo $pid $PPid $avg_atom >> file
fi
done
sort -n -k 2 file > file2


prev_ppid=0
sum_time=0
count=0

:> task5
while read -r line
do
ppid=$(echo $line | awk '{print $2}')
art=$(echo $line | awk '{print $3}')

if [[ $ppid -eq $prev_ppid ]]
then
echo $line >> task5
sum_time=$(echo "$sum_time + $art" | bc -l)
count=$(( $count + 1 ))
else
avg_time=$(echo "$sum_time / $art" | bc -l)
echo "Average_Running_Children_of_ParentID=$prev_ppid is $avg_time" >> task5
echo $line >> task5
sum_time=$art
count=1
prev_ppid=$ppid
fi
done < file2
avg=$(echo "$sum_time / $count" | bc -l)
echo "Average_Running_Children_of_ParentID=$prev_ppid is $avg" >> task5


