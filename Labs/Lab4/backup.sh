#! /bin/bash 

curr_date=$(date +"%Y-%m-%d")
backup_dir="$HOME/Backup-$curr_date"

last_backup_date=$(ls ${HOME} | grep -o "Backup-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" | sort -n -r | head -1)

last_backup_date=${last_backup_date:7}

days_since_last_backup=$((($date -d "$curr_date" +%s) - $(date -d "$last_backup_date" +%s))/86400))

if [[ $days_since_last_backup -ge 7 ]] || [[ -z "$last_backup_date" ]]
then
mkdir $backup_dir
cp -R $HOME/source/* $backup_dir
echo -e "New backup dir was created" >> $HOME/backup-report.txt
else
backup_dir="$HOME/Backup-$last_backup_date"
echo "Change "$HOME/Backup-$last_backup_date": $(date)" >> $HOME/backup-report.txt
fi

readarray -t -d '' files < <(find "$HOME/source" -type f -print0)
for file in $"${files[@]}"
do
file="$(basename "$file")"
echo "$file"

if [[ ! -f "$backup_dir/"$file"" ]]
then
cp -r "$HOME/source/$file" "$backup_dir"
echo "File "$file" copied to $backup_dir" >> $HOME/backup-report.txt
else
source_size=$(wc -c < "$HOME/source/$file")
if [[ $source_size -ne $backup_size ]]
then
mv "$backup_dir/"$file"" "$backup_dir/"$file".$curr_date"
cp -r "$HOME/source/"$file"" "$backup_dir"
echo "File "$file" in $backup_dir was renamed to "$file".$curr_date and new version was copied from $HOME/source" >> $HOME/backup-report.txt
fi
fi
done


