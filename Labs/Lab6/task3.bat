@echo off
net start > "C:\LAB6\service_list.log"
net stop wuauserv
timeout /t 30
net start > "C:\LAB6\updated_service_list.log"
fc "C:\LAB6\service_list.log" "C:\LAB6\updated_service_list.log" > "C:\LAB6\differences.txt"
net start wuauserv
