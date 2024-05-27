#! /bin/bash

num="12345"
while true
do
read digit < dop_pipe

if [ "$digit" == "${num:0:1}" ]
then
echo "Верно, угадывай дальше"
num="${num:1}"
else
echo "Неверно, игра завершена"
break
fi

if [ -z "$num" ]
then 
echo "Мы победили"
break
fi
done
