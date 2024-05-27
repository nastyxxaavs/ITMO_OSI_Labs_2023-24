@echo off 
set latestFile=
for /f "delims=" %%a in ('dir /b /a-d /od') do set latestFile=%%a
for %%f in (*) do (
if not "%%f"=="%latestFile%" (
del "%%f"
)
)
