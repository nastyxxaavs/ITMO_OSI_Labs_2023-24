@echo off
driverquery /FO table > "C:\LAB6\DRIVERS"
sort /r "C:\LAB6\DRIVERS" > "C:\LAB6\sorted_DRIVERS"
