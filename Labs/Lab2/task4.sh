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

stat_file="/proc/$pid/stat"
if [ -e "stat_file" ]
then
nice_value=$(awk '{print $19}' "stat_file")
else
nice_value="NO WAY"
fi

echo $pid $PPid $avg_atom $nice_value >> file
fi
done
echo "$(sort -n -k 3 file | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3" : Nice="$4}')" > task4.txt
