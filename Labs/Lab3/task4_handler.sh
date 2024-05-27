#! /bin/bash

./task4_generator.sh&PID1=$!
cpulimit --pid $PID1 --limit 10
./task4_generator.sh&PID2=$!
./task4_generator.sh&PID3=$!
echo $PID1
echo $PID2
echo $PID3
kill $PID3
