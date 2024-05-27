#! /bin/bash

MODE="+"
COUNT=1

(tail -f pipe_task5) |
while true
do
read LINE

case $LINE in
"+")
MODE="+"
echo "add"
;;
"*")
MODE="*"
echo "multiply"
;;
QUIT)
echo "Exit"
killall tail
exit 0
;;
[0-9]*)
case $MODE in
"+")
echo $COUNT "+" $LINE "=" $(($COUNT + $LINE))
COUNT=$(($COUNT + $LINE))
;;
"*")
echo $COUNT "*" $LINE "=" $(($COUNT * $LINE))
COUNT=$(($COUNT * $LINE))
;;
esac
;;
*)
echo "Incorrect input"
killall tail
exit 1
;;
esac
done
