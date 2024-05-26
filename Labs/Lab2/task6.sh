#! /bin/bash

max_mem = -1
ans=0

for pid in $(ps -axo pid | tail -n +2)
do
if [[ -r /proc/$pid/status ]]
then
memory=$(grep -s "VmHWM" /proc/$pid/status | awk '{print $2}')
if [[ $memory != "" ]]
then
if [[ $memory -gt $max_mem ]]
then
ans=$pid
max_mem=$memory
fi
fi
fi
done
echo "PID:" $ans "Memory:" $max_mem
echo "top max pid: $(top -bn 1 | tail -n +8 | sort -n -r -k 10 | head -1 | awk '{print $1}')"
