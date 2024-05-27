@echo off
mkdir \\DESKTOP-F49M7T7\c$\temp\

set /a curMinute=%time:~3,2%
set /a curHour=%time:~0,2%

if %curMinute% == 59 (
 set curMinute=0
 if %curHour% == 23 (
   set curHour=0
 ) else (
    set /a curHour=%curHour%+1
 )
) else (
  set /a curMinute=%curMinute%+1 
)

 if %curHour% LSS 10 (
  set curHour=0%curHour%
 )

 if %curMinute% LSS 10 (
   set curMinute=0%curMinute%
 )

SCHTASKS /Query /TN "myCopier" >NUL 2>&1 && SCHTASKS /Delete /TN "myCopier" /F >NUL 2
SCHTASKS /Create /SC minute /TN "myCopier" /TR "C:\OSI_LAB_6\copier.bat" /ST %curHour%:%curMinute%
SCHTASKS /Query /TN "myCopier" >NUL 2>&1 && SCHTASKS /End /TN "myCopier"
FC "C:\Windows\Web\Screen\img103.png" "\\DESKTOP-F49M7T7\c$\temp\img103.png" > "C:\LAB6\task4_info.txt" 2> NUL
xcopy /y /z "C:\Windows\Web\Screen\img103.png" "\\DESKTOP-F49M7T7\c$\temp\" /C
