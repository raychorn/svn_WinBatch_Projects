* The ispawn.exe gets installed in your C:\iSpawn folder.

* The ispawnChameleonDedicatedServer.cmd goes into the folder your Chameleon server is installed in.

* The chameleonParams.txt file goes into the C:\iSpawn folder. The iSpawn Chameleon_v110.lnk file goes in your START Menu folder.

* The chameleonParams.txt file has the following lines :
--- Begin ---
60
192.168.1.8:28000
90
D:\Tribes2\GameData\Chameleon_v110\ispawnChameleonDedicatedServer.cmd
D:\tribes2
3
0
1
-t2s
Tribes2.exe

--- End ---

Line #1 is the time in seconds iSpawn will wait to POLL the server to determine if it is in-fact online.
Line #2 is the IP address for your local server.
Line #3 is the time in seconds iSpawn will wait to POLL the server the first time after start-up.
Line #4 is the fully qualified PATH for your ispawnChameleonDedicatedServer.cmd file.
Line #5 is the root folder for your Tribes2 server.
Line #6 - DO NOT CHANGE.
Line #7 - DO NOT CHANGE.
Line #8 - DO NOT CHANGE.
Line #9 - DO NOT CHANGE.
Line #10 - DO NOT CHANGE.

* The ispawnChameleonDedicatedServer.cmd has the following lines :

--- BEGIN ---
if %1. == .. if exist ..\console.log del ..\console.log
if %1. == .. if exist C:\ispawn\Activity-Log_192.168.1.8+28000.txt del C:\ispawn\Activity-Log_192.168.1.8+28000.txt

cd ..\
Tribes2.exe -dedicated -mod Chameleon_v110
--- END ---

Line #1 is the command that deletes the console.log - comment this out to maintain your console.log intact.
Line #2 is the command that deletes the C:\ispawn\Activity-Log_192.168.1.8+28000.txt iSpawn Activity Log file for your server.
Line #3 is blank.
Line #4 is the command that points the current directory at the place where your Tribes2.exe file lives - DO NOT CHANGE.
Line #5 is the command that starts the Tribes2 server for the Chameleon Mod - DO NOT CHANGE.
