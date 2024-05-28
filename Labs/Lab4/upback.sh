#! /bin/bash

if [[ -d $1 ]]
then
echo "Error: dir is not processec"
exit 1
fi
restore_dir="$HOME/restore"

if [[ -d $restore_dir ]]
then
rm -r $restore_dir
fi

last_backup_date=$(ls ${HOME} | grep -E "^Backup-" | sort -n | tail -1 | sed 's/^Backup-//')
last_backup="$HOME/Backup-${last_backup_date}"

if [[ -z "$last_backup_date" ]]
then
echo "Backups not found, run over script"
exit 1
fi

mkdir $restore_dir
for file in "$last_backup"/*
do
echo "$file"
file=$(basename "$file")
file=$(echo "$file" | grep -E -v "\.[0-9]{4}-[0-9]{2}-[0-9]{2}$")
if [[ -d "$last_backup"/"$file" ]]
then
continue;
fi
if [[ ! -z "$file" ]]
then
cp "$last_backup/$file" "$restore_dir/$file"
fi
done
