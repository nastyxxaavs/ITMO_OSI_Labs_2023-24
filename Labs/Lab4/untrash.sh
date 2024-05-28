#! /bin/bash

if [ $# -ne 1 ]
then
echo "Error: Incorrect number of parameters. Usage: $0 <filename>"
exit 1
fi

DIR="/root/trash"
if [[ ! -d $DIR ]]
then
echo "Hidden dir not found"
exit 1
fi

log_file="$HOME/trash.log"
if [[ ! -f $log_file ]]
then
echo "Hide log file not found"
exit 1
fi

for i in $(grep "$1" $log_file | awk '{print $NF}')
do
file_name=$(grep $i $log_file | awk '{$NF=""; print $0"}')
$file_name=$(echo "$file_name" | sed 's/ *$//') 2> /dev/null
read -p "${file_name} Are you sure?: [y/n]" ans

case "$ans" in
"y")
new_file_name=""
id=$i
file_dir=$(echo "$file_name" | awk 'BEGIN{FS=OFS="/"}; {$NF=""; print $0}')
restoredFile=$(echo "$file_name" | awk 'BEGIN{FS="/"}; {print $NF}')

if [[ ! -d $file_dir ]]
then
echo "Dir did not find, File restored in home dir"
if [[ -f "${HOME}${restoredFile}" ]]
then
read -p "File already exists. Enter new name: " new_file_name
ln "${id}" "${HOME}/${new_file_name}" 2> /dev/null
rm "${id}" 2> /dev/null
else
ln "${id}" "${HOME}/${restoredFile}" 2> /dev/null
rm "${id}" 2> /dev/null
fi
else

if [[ -f "${file_name}" ]]
then
read -p "File already exists. Enter new name: " new_file_name
ln "${id}" "${file_dir}/${new_file_name}" 2> /dev/null
rm "${id}" 2> /dev/null
else
ln "${id}" "${file_name}" 2> /dev/null
rm "${id}" 2> /dev/null
fi
fi


sed "/${i}/d" $log_file 2> /dev/null
echo "OK"
continue
;;
*)
continue
;;
esac
done

