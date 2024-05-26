#! /bin/bash
ps u | grep $USER > task1.txt
printf "The number of processes launched by the $USER user: "
cat task1.txt | wc -l
awk '{printf ("%d : %s\n", $2, $(11))}' task1.txt
rm task1.txt
