@echo off

title HoYo Account Switcher

:menu
cls

echo.
echo ^+------------------------------------------------------^+
echo ^|                HoYo Account Switcher                 ^|
echo ^+------------------------------------------------------^+
echo ^| 1. Create current Genshin Impact account shortcut    ^|
echo ^| 2. Create current Honkai Star Rail account shortcut  ^|
echo ^| 3. Create current Honkai Star Rail account shortcut  ^|
echo ^|                                                      ^|
echo ^| 4. Game locations                                    ^|
echo ^|                                                      ^|
echo ^| 5. Exit                                              ^|
echo ^+------------------------------------------------------^+
echo.

set /p option= "Select an option: "

if %option% equ 1 goto option1
if %option% equ 2 goto option2
if %option% equ 3 goto option5
if %option% equ 4 goto settings0
if %option% GEQ 5 goto exit0



:option1
cls
echo.
echo ^+------------------------------------------------------^+
echo ^|    Create current Genshin Impact account shortcut    ^|
echo ^+------------------------------------------------------^+
echo.

for /f "tokens=3" %%a in ('reg query "HKCU\SOFTWARE\miHoYo\Genshin Impact" /V MIHOYOSDK_ADL_PROD_OVERSEA_h1158948810 ^|findstr /ri "REG_BINARY"') do set account=%%a

if not exist Directories md Directories

cd Directories

set directoryFile=GenshinImpact.txt

if exist %directoryFile% (

	for /F "delims=" %%x in (%directoryFile%) do set gameLocation=%%x
	
) else (

	set /p gameLocation= "Game location: "
	echo.
)

>%directoryFile% echo %gameLocation%

cd ..

set /p accountName= "Account name: "
echo.

if not exist Accounts\GenshinImpact md Accounts\GenshinImpact

cd Accounts\GenshinImpact

>"%accountName%".bat (
	echo @echo off
	echo REG ADD "HKCU\SOFTWARE\miHoYo\Genshin Impact" /v MIHOYOSDK_ADL_PROD_OVERSEA_h1158948810 /t REG_BINARY /d %account% /f
	echo cd %gameLocation%
	echo start launcher.exe
	echo exit
)

if not exist "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Genshin Impact" md "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Genshin Impact"

@Set "SCRIPT=%TEMP%\LinkMaker-%RANDOM%-%RANDOM%.vbs"
@(  echo Set oWS = WScript.CreateObject("WScript.Shell"^)
	echo sLinkFile0 = "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Genshin Impact\Genshin Impact (%accountName%).lnk"
    echo Set oLink0 = oWS.CreateShortcut(sLinkFile0^)
    echo oLink0.TargetPath = "%CD%\%accountName%.bat"
	echo oLink0.WorkingDirectory = "%CD%"
	echo oLink0.IconLocation = "%gameLocation%\launcher.exe"
    echo oLink0.Save
    echo sLinkFile1 = "C:\Users\%USERNAME%\Desktop\Genshin Impact (%accountName%).lnk"
    echo Set oLink1 = oWS.CreateShortcut(sLinkFile1^)
    echo oLink1.TargetPath = "%CD%\%accountName%.bat"
	echo oLink1.WorkingDirectory = "%CD%"
	echo oLink1.IconLocation = "%gameLocation%\launcher.exe"
    echo oLink1.Save
)>"%SCRIPT%"
@"%__AppDir__%cscript.exe" //NoLogo "%SCRIPT%"
@Del "%SCRIPT%"

cd ..\..

pause
goto menu


:option5
cls
echo.
echo ^+------------------------------------------------------^+
echo ^|    Create current Honkai Impact account shortcut    ^|
echo ^+------------------------------------------------------^+
echo.

for /f "tokens=3" %%a in ('reg query "HKCU\SOFTWARE\miHoYo\Honkai Impact 3" /V MIHOYOSDK_ADL_PROD_OVERSEA_h1158948810 ^|findstr /ri "REG_BINARY"') do set account=%%a

if not exist Directories md Directories

cd Directories

set directoryFile=HonkaiImpact.txt

if exist %directoryFile% (

	for /F "delims=" %%x in (%directoryFile%) do set gameLocation=%%x
	
) else (

	set /p gameLocation= "Game location: "
	echo.
)

>%directoryFile% echo %gameLocation%

cd ..

set /p accountName= "Account name: "
echo.

if not exist Accounts\HonkaiImpact md Accounts\HonkaiImpact

cd Accounts\HonkaiImpact

>"%accountName%".bat (
	echo @echo off
	echo REG ADD "HKCU\SOFTWARE\miHoYo\Honkai Impact 3" /v MIHOYOSDK_ADL_PROD_OVERSEA_h1158948810 /t REG_BINARY /d %account% /f
	echo cd %gameLocation%
	echo start launcher.exe
	echo exit
)

if not exist "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Honkai Impact 3" md "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Honkai Impact 3"

@Set "SCRIPT=%TEMP%\LinkMaker-%RANDOM%-%RANDOM%.vbs"
@(  echo Set oWS = WScript.CreateObject("WScript.Shell"^)
	echo sLinkFile0 = "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Honkai Impact 3\Honkai Impact 3 (%accountName%).lnk"
    echo Set oLink0 = oWS.CreateShortcut(sLinkFile0^)
    echo oLink0.TargetPath = "%CD%\%accountName%.bat"
	echo oLink0.WorkingDirectory = "%CD%"
	echo oLink0.IconLocation = "%gameLocation%\launcher.exe"
    echo oLink0.Save
    echo sLinkFile1 = "C:\Users\%USERNAME%\Desktop\Honkai Impact 3 (%accountName%).lnk"
    echo Set oLink1 = oWS.CreateShortcut(sLinkFile1^)
    echo oLink1.TargetPath = "%CD%\%accountName%.bat"
	echo oLink1.WorkingDirectory = "%CD%"
	echo oLink1.IconLocation = "%gameLocation%\launcher.exe"
    echo oLink1.Save
)>"%SCRIPT%"
@"%__AppDir__%cscript.exe" //NoLogo "%SCRIPT%"
@Del "%SCRIPT%"

cd ..\..

pause
goto menu


:option2
cls
echo.
echo ^+------------------------------------------------------^+
echo ^|   Create current Honkai Star Rail account shortcut   ^|
echo ^+------------------------------------------------------^+
echo.

for /f "tokens=3" %%a in ('reg query "HKCU\SOFTWARE\Cognosphere\Star Rail" /V MIHOYOSDK_ADL_PROD_OVERSEA_h1158948810 ^|findstr /ri "REG_BINARY"') do set account=%%a

if not exist Directories md Directories

cd Directories

set directoryFile=HonkaiStarRail.txt

if exist %directoryFile% (

	for /F "delims=" %%x in (%directoryFile%) do set gameLocation=%%x
	
) else (

	set /p gameLocation= "Game location: "
	echo.
)

>%directoryFile% echo %gameLocation%

cd ..

set /p accountName= "Account name: "
echo.

if not exist Accounts\HonkaiStarRail md Accounts\HonkaiStarRail

cd Accounts\HonkaiStarRail

>"%accountName%".bat (
	echo @echo off
	echo REG ADD "HKCU\SOFTWARE\Cognosphere\Star Rail" /v MIHOYOSDK_ADL_PROD_OVERSEA_h1158948810 /t REG_BINARY /d %account% /f
	echo cd %gameLocation%
	echo start launcher.exe
	echo exit
)

if not exist "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Star Rail" md "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Star Rail"

@Set "SCRIPT=%TEMP%\LinkMaker-%RANDOM%-%RANDOM%.vbs"
@(  echo Set oWS = WScript.CreateObject("WScript.Shell"^)
    echo sLinkFile0 = "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Star Rail\Honkai Star Rail (%accountName%).lnk"
    echo Set oLink0 = oWS.CreateShortcut(sLinkFile0^)
    echo oLink0.TargetPath = "%CD%\%accountName%.bat"
	echo oLink0.WorkingDirectory = "%CD%"
	echo oLink0.IconLocation = "%gameLocation%\launcher.exe"
    echo oLink0.Save
    echo sLinkFile1 = "C:\Users\%USERNAME%\Desktop\Honkai Star Rail (%accountName%).lnk"
    echo Set oLink1 = oWS.CreateShortcut(sLinkFile1^)
    echo oLink1.TargetPath = "%CD%\%accountName%.bat"
	echo oLink1.WorkingDirectory = "%CD%"
	echo oLink1.IconLocation = "%gameLocation%\launcher.exe"
    echo oLink1.Save
)>"%SCRIPT%"
@"%__AppDir__%cscript.exe" //NoLogo "%SCRIPT%"
@Del "%SCRIPT%"

cd ..\..

pause
goto menu


:settings0
cls
echo.
echo ^+------------------------------------------------------^+
echo ^|                    Game locations                    ^|
echo ^+------------------------------------------------------^+
echo ^|

if not exist Directories md Directories

cd Directories

set genshinLocation=GenshinImpact.txt

if exist %genshinLocation% (

	for /F "delims=" %%x in (%genshinLocation%) do echo ^|  Genshin Impact:	%%x
	
) else (
	
	echo ^|  Genshin Impact:	Not set
)

set starRailLocation=HonkaiStarRail.txt

if exist %starRailLocation% (

	for /F "delims=" %%x in (%starRailLocation%) do echo ^|  Honkai Star Rail:	%%x
	
) else (
	
	echo ^|  Honkai Star Rail:	Not set
)

set honkaiLocation=HonkaiImpact.txt

if exist %honkaiLocation% (
	for /F "delims=" %%x in (%honkaiLocation%) do echo ^| Honkai Impact: %%x
)
else (
	echo ^| Honkai Impact: Not set
)
cd ..

echo ^|
echo ^+------------------------------------------------------^+
echo ^| 1. Change Genshin Impact game location               ^|
echo ^| 2. Change Honkai Star Rail game location             ^|
echo ^| 2. Change Honkai Star Rail game location             ^|
echo ^| 4. Back                                              ^|
echo ^+------------------------------------------------------^+
echo.

set /p option= "Select an option: "

if %option% equ 1 goto genshinNewLocation
if %option% equ 2 goto starRailNewLocation
if %option% equ 3 goto honkaiNewLocation
if %option% GEQ 4 goto menu


:genshinNewLocation
echo.

cd Directories

set directoryFile=GenshinImpact.txt

set /p gameLocation= "Game location: "

>%directoryFile% echo %gameLocation%

cd ..

goto settings0


:starRailNewLocation
echo.

cd Directories

set directoryFile=HonkaiStarRail.txt

set /p gameLocation= "Game location: "

>%directoryFile% echo %gameLocation%

cd ..

goto settings0

:honkaiNewLocation
echo.

cd Directories

set directoryFile=HonkaiImpact.txt

set /p gameLocation= "Game location: "

>%directoryFile% echo %gameLocation%

cd ..

goto settings0

:exit0
exit
