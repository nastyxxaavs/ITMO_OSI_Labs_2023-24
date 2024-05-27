@echo off
set "sourceFolder=C:\LAB6\source"
set "destFolder=C:\LAB6\dest"

:syncFiles

xcopy "%sourceFolder%\*" "%destFolder%\" /E /Y /D

timeout /t 5 >nul
goto syncFiles
