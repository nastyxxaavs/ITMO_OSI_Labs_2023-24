@echo off
mkdir C:\LAB6
systeminfo > C:\LAB6\osVersion_info.txt
wmic logicaldisk get size, freespace, caption > C:\LAB6\disk_info.txt
wmic os get BuildNumber, Caption /format:LIST > C:\LAB6\wmicOSVersion.txt
wmic os get FreePhysicalMemory, TotalVisibleMemorySize /format:LIST > C:\LAB6\wmicOSMemory.txt
wmic logicaldisk get Name, Description /format:LIST > C:\LAB6\wmicOsDiscs.txt
mkdir C:\LAB6\TEST
copy C:\LAB6 C:\LAB6\TEST
cd C:\LAB6\TEST
type * > all_files.txt
for %i in (*) do if not "%i" == "all_files.txt" del /Q "%i"
