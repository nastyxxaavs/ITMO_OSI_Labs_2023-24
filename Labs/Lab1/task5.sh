#! /bin/bash

file="/var/log/anaconda/syslog"
output_file="info.log"
touch output_file
while IFS= read -r line
do
if awk '{if ($2 == "INFO") print}'
then
echo "$line" >> "$output_file"
fi
done < "$file"
