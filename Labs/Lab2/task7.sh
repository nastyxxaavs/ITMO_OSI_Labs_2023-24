#! /bin/bash

start_time=$(date +%s)
sleep 60
for pid_dir in /proc/[0-9]*/
do

pid=$(basename $pid_dir)
cmdline=$(cat $pid_dir/cmdline | tr -d '\0')

read_bytes=$(grep -s "read_bytes" $pid_dir/io | awk '{print $2}')

if [ -n "$read_bytes" ]
then
echo "PID=$pid : Command=$cmdline : ReadBytes=$read_bytes" >> temp_file
fi
done
sort -t= -nk3 temp_file | tail -n 3
