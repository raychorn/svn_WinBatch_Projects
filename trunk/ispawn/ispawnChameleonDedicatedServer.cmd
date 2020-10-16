if %1. == .. if exist ..\console.log del ..\console.log
if %1. == .. if exist C:\ispawn\Activity-Log_192.168.1.8+28000.txt del C:\ispawn\Activity-Log_192.168.1.8+28000.txt

cd ..\
Tribes2.exe -dedicated -mod Chameleon_v110

