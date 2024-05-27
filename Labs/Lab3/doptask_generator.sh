#! /bin/bash

echo "Угадайте цифру: "
while read -n 1 digit
do
echo "$digit" >> dop_pipe
done
