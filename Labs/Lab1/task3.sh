#! /bin/bash

echo Please, choose one of this commands
echo 1 - nano 
echo 2 - vi
echo 3 - links
echo 4 - exit

while true
do
read a
case $a in
1)
read -p "1? (y/n):" ans
if [ "$ans" = "y" ]
then
nano
fi;;
2)
read -p "2? (y/n):" ans
if [ "$ans" = "y" ]
then
vi
fi;;
3)
read -p "3? (y/n):" ans
if [ "$ans" = "y" ]
then
links
fi;;
4)
read -p "4? (y/n):" ans
if [ "$ans" = "y" ]
then
break
fi;;
*)
echo Please, choose next command: 1, 2, 3, 4.
esac done
