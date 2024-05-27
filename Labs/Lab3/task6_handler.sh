#! /bin/bash

echo $$ > .pid
MODE="*"
COUNT=1

stop() {
MODE="STOP"
}

usr1() {
MODE="+"
}

usr2() {
MODE="*"
}

trap 'stop' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2

while true
do
case $MODE in
"+")
let COUNT=$COUNT+2
;;
"*")
let COUNT=$COUNT*2
;;

