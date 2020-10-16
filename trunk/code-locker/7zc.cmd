set SevenZipEXE=7z.exe

if "%SevenZipEXE%". == "". goto nocompress

"%SevenZipEXE%" -aoa x "codelocker.zip" -o"codelocker\"
del "codelocker.zip"

cd codelocker
"..\%SevenZipEXE%" a -tzip -mx9 -psisko@7660$boo "..\codelocker.zip" -r
cd ..
rd "codelocker" /s /q

goto done

:nocompress
echo NoCompress !

:done
echo Done !
