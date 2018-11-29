<# : AlwaysOnTop2.bat -- http://stackoverflow.com/a/37912693/1683264
@echo off
::Updates to be done:
:: New Sounds
cls
title CB Chattio by Lucas Elliott with IT COMMAND
if exist dir.txt cd ..
set version=[11.03.0]
set setup=False
setlocal EnableDelayedExpansion
if "%~1"=="notif1" goto Enable1
if "%~1"=="updated" goto cleanupdate
if "%~1"=="updatedf" goto cleanupdatef
if "%~1"=="notif0" goto Dissable0
if "%~1"=="antivirual" goto antiviral
if "%~1"=="Notif" goto notifadmin
if "%~1"=="Admin" (call :c 0e "Loading as admin . . ." & echo %cd%>C:\users\Public\CDC.txt & powershell start -verb runas '%0' am_admin & exit /b)
if "%~1"=="am_admin" set setup=True
if not exist C:\users\Public\chat md C:\users\Public\chat
:topreset
if not exist lc.exe goto nolc
:backlc
if not exist cmdwiz.exe goto nocmd
:backcmdwiz
if not exist tick.wav goto notick
:backtick
if %setup%==True goto setupss
if not exist settings.cmd goto findserver
::Presets
::call :c 08 "Running ITCMDCOS version %version%   http://www.itcommand.tech"
set color=07
set 404=Exit
set BoldColor=0e
set mini=False
set LegacyMini=False
set TextColor=0a
set endl=No
set pingr=N
set SystemColor=0b
set MiniClose=No
set spam=YoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYoYo
set alwaysScan=False
set debug=No
call settings.cmd
color %color%
net use| find "CHAT">nul
if %errorlevel%==1 net use \\%him%\CHAT /user:"ITCMD" Guest 2>nul >nul
if %debug%==Yes set >set.txt
if not exist \\%him%\CHAT\ goto offline
if not exist \\%him%\chat\Local.cmd call :404 "Local.cmd"
if not exist \\%him%\chat\Users.log call :404 "Users.Log"
if not exist \\%him%\chat\Notif\Notif.bat call :404 "Notif.bat"
if not exist Notif\ md Notif\
copy "\\%him%\CHAT\Notif\Notif.bat" "Notif\Notif.bat" >nul
copy "settings.cmd" "Notif\settings.cmd" >nul
(echo %~0)> "Notif\dir.txt
:skipnotif
if exist NoNotif goto skipnotif2
echo Dim WinScriptHost >"C:\users\Public\CHAT\Notif.vbs"
echo set WinScriptHost = CreateObject("wscript.shell")>>"C:\users\Public\CHAT\Notif.vbs"
echo WinScriptHost.CurrentDirectory = "%cd%\Notif">>"C:\users\Public\CHAT\Notif.vbs"
(echo  WinScriptHost.Run chr(34^) ^& "%cd%\Notif\Notif.bat" ^& chr(34^), 0)>>"C:\users\Public\CHAT\Notif.vbs"
(echo Set WinScriptHost = Nothing)>>"C:\users\Public\CHAT\Notif.vbs"
if defined NotifSupress goto skipnotif2
schtasks /query /TN ITCMD-CHAT-NOTIF2 | find "ITCMD-CHAT-NOTIF2                        N/A                    Ready">nul
if %errorlevel%==0 goto skipnotif2
cls
call :c 0c "Log On Notifications are dissabled. Would you like to enable them now?"
call :c 08 "You can change this later in the Options Menu"
choice /c YN
cls
if %errorlevel%==1 goto getnotif
call :c 0f "Would you like to supress this message?"
call :c 08 "Again, you can change this in settings"
choice /c YN
if %errorlevel%==1 echo. >NoNotif
goto skipnotif2
:getnotif
call :c f0 "Loading As Administrator . . ."
echo %cd%>C:\users\Public\CDC.txt
powershell start -verb runas '%0' Notif & exit /b
:notifadmin
set /p cdd=<C:\users\Public\CDC.txt
cd %cdd%
call :c 0a "Enabling Notifiactions . . ."
schtasks /query /TN ITCMD-CHAT-NOTIF | find "ITCMD-CHAT-NOTIF                         N/A                    Ready">nul
if %errorlevel%==0 schtasks /DELETE /TN ITCMD-CHAT-NOTIF /F
schtasks /Create /TN ITCMD-CHAT-NOTIF2 /SC ONLOGON /tr "C:\users\Public\CHAT\Notif.vbs" /F
goto topreset
:skipnotif2
cls
set cls=False
call :c 08 "Running ITCMDCOS version %version%   http://www.itcommand.tech"
echo.
call "\\%him%\chat\Local.cmd"
for /f %%a in ('hostname') do (set hostname=%%a)
find "[%me%]-[%hostname%]" "\\%him%\chat\Users.log" >nul
if %errorlevel%==1 echo [%me%]-[%hostname%]>>"\\%him%\chat\Users.log"
:skiphost
timeout /t 1 >nul
cls
if not exist \\%him%\CHAT\Ban call :404 "Ban"
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
for /f %%a in ('hostname') do (set hostname=%%a)
find "[%hostname%]" "\\%him%\CHAT\Host.inf" >nul
if %errorlevel%==0 goto skipbancheck
find "[%NetworkIP%]" "\\%him%\CHAT\Ban" >nul
if %errorlevel%==0 goto banned
find "[%hostname%]" "\\%him%\CHAT\Ban" >nul
if %errorlevel%==0 goto banned2
find "[%me%]" "\\%him%\CHAT\Ban" >nul
if %errorlevel%==0 goto banned
:skipbancheck
if not exist \\%him%\chat\chat.txt call :404 "chat.txt"
if exist LeftMessage.txt type LeftMessage.txt >>\\%him%\chat\chat.txt & echo ---%TIME: =0%----%me%-Left-Messages---->> \\%him%\CHAT\LOG.txt & type LeftMessage.txt >>\\%him%\chat\LOG.txt & echo ------END OF %me% LEFT MESSAGES---->> \\%him%\CHAT\LOG.txt & del /f /q LeftMessage.txt
if not exist FilesOnConnect.txt goto nff
for /f "tokens=*" %%A in (FilesOnConnect.txt) do (
	if exist %%A copy "%%~A" "\\%him%\CHAT\Files\"
	call :c 08 "A File was Uploaded. Adding to Log . . ."
FOR %%i IN ("%%~A") DO (
SET filename=%%~ni
SET fileextension=%%~xi
)
if /i "%fileextension%"==".zip" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Zipped File) >> "\\%him%\CHAT\Chat.txt" & goto nll
if /i "%fileextension%"==".txt" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Text File) >> "\\%him%\CHAT\Chat.txt" & goto nll
if /i "%fileextension%"==".png" call :image2
if /i "%fileextension%"==".jpg" call :image2
if /i "%fileextension%"==".bmp" call :image2
if /i "%fileextension%"==".ico" call :image2
if /i "%fileextension%"==".bat" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Batch File) >> "\\%him%\CHAT\Chat.txt" & goto nll
if /i "%fileextension%"==".exe" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Executable) >> "\\%him%\CHAT\Chat.txt" & goto nll
if /i "%fileextension%"==".doc" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Word Document) >> "\\%him%\CHAT\Chat.txt" & goto nll
if /i "%fileextension%"==".otf" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Open Office Doc) >> "\\%him%\CHAT\Chat.txt" & goto nll
if /i "%fileextension%"==".pdf" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (PDF Document) >> "\\%him%\CHAT\Chat.txt" & goto nll
if /i "%fileextension%"==".lnk" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Shortcut Link) >> "\\%him%\CHAT\Chat.txt" & goto nll
echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (%fileextension% File) >> "\\%him%\CHAT\Chat.txt"
:nll
echo %TIME: =0%-SERVER} %me% Uploaded: %Filename% (%fileextension% File) >> "\\%him%\CHAT\Log.txt"

)
:nff
set forcerefresh=No
set num=0
::U1
::U2
if not exist firsts goto okm
Title CB Chattio by Lucas Elliott  
echo X=MsgBox("Welcome to the CB Chattio. This tool allows you to send and recieve messages with Lukaka. To start, simply press T to talk. Once there you can enter in your message. For Help, enter -H in the talk dialoge. Your possible commands are always listed in the Title of the window.",0+64,"Welcome to the ITCMD CB Chattion Beta.") >msg.vbs
start "" "msg.vbs"
timeout /t 2 >nul
del /f /q "msg.vbs"
del /f /q firsts
:okm
if not exist "\\%him%\Chat" call :404 "EVERYTHING IS MISSING. THER IS NO \\%him%\Chat"
if not exist "\\%him%\chat\chat.txt" call :404 "Chat.txt"
if not exist "\\%him%\chat\Log.txt" call :404 "Log.txt"
if not exist C:\users\Public\Chat\localchat.txt echo %date% >C:\users\Public\Chat\localchat.txt
if not exist C:\users\Public\chat\Localdll.dll echo [Started[%date%]%time%] >C:\users\Public\chat\Localdll.dll
if not exist "chat-listener.bat" call :createchat
if not exist "chat-listener.vbs" call :createchatvbs
echo [S]%TIME: =0%-SERVER} %me% Joined the server >>\\%him%\Chat\chat.txt
if not exist \\%him%\Chat\log.txt exit /b
echo %TIME: =0%:   %me%  Joined >>\\%him%\Chat\log.txt
start "" "chat-listener.vbs"


:type	
setlocal enableextensions enabledelayedexpansion
for /F "tokens=*" %%A in (\\%him%\CHAT\chat.txt) do (
	set /a num+=1
    set "line=%%A"
	if "!line!" equ "!line:[=!" set line=%TextColor% "!line!"
	if "!line!" neq "!line:[C]=!" call :CodeBlock "!line!"
    if "!line!" neq "!line:[B]=!" set line=%BoldColor% "!line:[B]=!"
    if "!line!" neq "!line:[S]=!" set line=%systemColor% "!line:[S]=!"
	if "!line!" neq "!line:[U]=!" set line=%TextColor% "!line:[U]=!" /u
	if "!line!" neq "!line:[D]=!" set line=08 "!line:[D]=!"
    call :c !line!
	if !num!==31 cls & goto clear20
)
Endlocal
copy /Y "\\%him%\CHAT\Chat.txt" "C:\Users\Public\chat\Localchat.txt" >nul
set "Start=%TIME%"
goto wait

:codeblock
set "Back=%~1"
set "Front=%Back:[C]="&:%
set "Back=%Back:*[C]=%"
set "Inside=%Back:[/C]="&:%
set "Back=%Back:*[/C]=%"
call :c %TextColor% "!Front!" /n
call :c 70 "!Inside!" /n
set line=%textColor% "!Back!"
(echo !Inside!)> "\\%him%\CHAT\CodeBlock.txt"
exit /b




:banned
cls
call :c 0c "You have been banned from the server %him%"
echo.
find "[%NetworkIP%]" "\\%him%\CHAT\Ban"
pause
exit
:banned2
cls
call :c 0c "You have been banned from the server %him%"
echo.
find "[%hostname%]" "\\%him%\CHAT\Ban"
pause
exit


:setupreg
cls
echo A Change Need to be made to the system for this Program to work.
echo Would you like to
echo.
echo 1] Have this program do it automatically.
echo 2] Walk you through doing it yourself without giving this program admin access.
choice /c 12
if %errorlevel%==2 goto walkreg
echo. >SetupClient.txt
call chat.bat Admin
exit
:setreg2
del /f /q SetupClient.txt
call :c 0a "Applying changes . . ."
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0 /v NtlmMinClientSec /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0 /v NtlmMinServerSec /t REG_DWORD /d 0 /f
echo.
control /name Microsoft.NetworkAndSharingCenter /page Advanced
if not exist nircmd.exe call :getnir
nircmd win close title "Advanced sharing settings"
call :c 0a "Complete."
call :c 08 "Press any Key to exit. On next startup you may connect to a server."
pause
exit


:walkreg
cls
echo When The Control Panel Opens click on the "All Networks" tab on the bottom of the page.
echo.
echo Then click "Enable file sharing for devices that use 40- or 56-bit encryption."
echo.
echo Then Press "Save Changes".
timeout /t 3 >nul
control /name Microsoft.NetworkAndSharingCenter /page Advanced
pause
call :c 0a "Thank you! The program will now relaunch."
start "" "%~0"
exit

:findserver

cls
call :c 0f "Preparing Setup . . ."
call :c 0a "Checking for update . . ."
bitsadmin /transfer myDownloadJob /download /priority High https://raw.githubusercontent.com/ITCMD/chat-batch/master/version "%cd%\versionDownload.txt" >nul
find "%version%" "versionDownload.txt" >nul
if %errorlevel%==0 call :c 0a "You are up to date." & timeout /t 1 >nul & cls & goto backfindserver
call :c 0f "An Update is available. Downloading . . ."
bitsadmin /transfer myDownloadJob /download /priority High https://raw.githubusercontent.com/ITCMD/chat-batch/master/chat.bat "%cd%\chatUPDATE.txt" >nul
echo @echo off >update.bat
(echo title Update Installer . . .
echo color 0a
echo echo Installing Update . . .
echo if not exist chatUPDATE.txt echo ERROR ^&pause ^&exit /b
echo copy /b/v/y "chatUPDATE.txt" "%~nx0" ^>nul
echo start "" "%~nx0" updatedf
echo timeout /t 2 ^>nul
echo exit)>>update.bat
start "" "update.bat"
exit 


:cleanupdatef
cls
call :c a0 "Update Installed."
call :c 08 "Cleaning up . . ."
timeout /t 3 >nul
del /f /q "chatUPDATE.txt"
del /f /q "update.bat"
del /f /q "versionDownload.txt"
call :c 08 "Cleanup complete."
echo.
goto topreset
:backfindserver


set cdd=<C:\users\Public\CDC.txt
cd %cdd%
for /f "tokens=2*" %%a in ('reg query \\%computername%\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0 /v NtlmMinClientSec') do set "regrez=%%b"
if not  "%regrez%"=="0x0" goto setupreg
for /f "tokens=2*" %%a in ('reg query \\%computername%\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0 /v NtlmMinServerSec') do set "regrez2=%%b"
if not  "%regrez2%"=="0x0" goto setupreg
cls
echo do you want to:
echo 1] Host on this PC
echo 2] Connect to a server
call :c 08 "Note: If you have already set up host on this pc choose connect to server"
choice /c 12
if %errorlevel%==2 goto connect
echo This file will now restart. Please grant it ADMIN access.
echo.
call chat.bat Admin
exit
:setupss
if exist SetupClient.txt goto setreg2
set cusf=n
cls
echo Begining Hoast Setup . . .
echo Host Destination Will be set to "C:\users\%Username%\Chat"
echo Would you like to change this? (choose in 10 seconds)
choice /c "YN" /t "10" /D "N"
if %errorlevel%==1 (
	echo Drag and Drop Folder here
	set /p fold=">"
	if not exist %fold% goto setupss
	set cusf=y
)
echo Setting Up . . .
call :c 0a "Turning on Shared Folder . . ."
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
call :c 0a "Setting encryption to Correct Bit"
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0 /v NtlmMinClientSec /t REG_DWORD /d 0 /f
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0 /v NtlmMinServerSec /t REG_DWORD /d 0 /f
call :c 0a "Dissabling pasword protection for folder . . ."
reg add Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa /v everyoneincludesanonymous /t REG_DWORD /d 1 /f
reg add Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters /v restrictnullsessaccess /t REG_DWORD /d 0 /f
if %errorlevel%==1 (
	call :c 0c "Error Detected for Reg Add"
	call :c 0a "Error was expected and is being Handled. Stand By . . ."
	reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa /v everyoneincludesanonymous /t REG_DWORD /d 1 /f
	reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters /v restrictnullsessaccess /t REG_DWORD /d 0 /f
	call :c 0a "Error Handled and fixed."
)
call :c 0a "Creating Folder . . ."
if %cusf%==n set fold="C:\users\%username%\CHAT"
if %cusf%==n if not exist %Fold% md %fold%
call :c 0a "Setting Up Files . . ."
for /f %%A in ('hostname') do set host=%%A
set fold2=%fold:"=%
echo LOG FILE CREATED %DATE% %TIME% %USERNAME% ON %HOST%>"%fold2%\Log.txt"
echo Server}    [S] BEGIN CHAT>"%fold2%\chat.txt"
md "%fold2%\FILES\"
echo [TheDevil] For being evil >"%fold2%\Ban"
(
echo echo Welcome to %username%'s %host% Server
echo echo Running since %date%
echo timeout /t 2 ^>nul
echo set cls=true
)>"%fold2%\Local.cmd"
for /f %%a in ('hostname') do (set hostname=%%a)
(echo [%hostname%])>"%fold2%\Host.inf"
echo [Hostname]-[Username] >"%fold2%\Users.log"
md "%fold2%\chat batch file\"
copy "%~0" "%fold2%\Installed-Chat-Version.txt"
(echo Installed %date%-%time%)>"%fold2%\%version:~1,-1%"
call :c 02 "Downloading Required Setting Files . . ."
if not exist "%fold2%\Notif\" md "%fold2%\Notif"
bitsadmin /transfer myDownloadJob /download /priority High  https://raw.githubusercontent.com/ITCMD/chat-batch/master/DefaultSettings.txt "%fold2%\Settings.txt" >nul
bitsadmin /transfer myDownloadJob /download /priority High  https://raw.githubusercontent.com/ITCMD/chat-batch/master/notif.bat "%fold2%\Notif\Notif.bat" >nul

for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
call :c 0a "Sharing Folder..."
net share CHAT=%fold% /GRANT:EVERYONE,FULL
Icacls %fold% /grant EVERYONE:F /inheritance:e /T
icacls %fold% /grant EVERYONE:(OI)(CI)F
Icacls "%fold2%\Settings.txt" /deny EVERYONE:(W,D,M)
Icacls "%fold2%\Local.cmd" /deny EVERYONE:(W,D,M)
Icacls "%fold2%\Ban" /deny EVERYONE:(W,D,M)
Icacls "%fold2%\Host.inf" /deny EVERYONE:(W,D,M)
cacls "%fold2%\Settings.txt" /E /G EVERYONE:R
cacls "%fold2%\Mini.bat" /E /G EVERYONE:R
cacls "%fold2%\Local.cmd" /E /G EVERYONE:R
cacls "%fold2%\Ban" /E /G EVERYONE:R
cacls "%fold2%\Host.inf" /E /G EVERYONE:R
echo Completed.
echo.
echo Done
call :c a0 "Complete. If there were anny errors please copy them to the below link:"
echo  https://github.com/ITCMD/chat-batch/issues
echo.
call :c 0a "%host% is the name wou will need to share with people so they can connect"
call :c 02 "They may also be able to use %NetworkIP%"
echo.
call :c 0a "Press any key to continue . . ."
pause>nul
cls
call :c a0 "The Computer now needs to restart"
echo Would you like to do this now?
choice /c YN
if %errorlevel%==2 goto alt
restart /r /t 20 /c "This PC Will restart in twenty seconds to apply changes. Once the PC has restarted you can connect to your PC with localhost as the server name. Others can connect with %host%."
exit /b

:alt
cls
echo Restart will not occur.
call :c 0a "Note: You can work around the need to restart by changing a couple of things in the Control Panel."
call :c 02 "Would You like to do this now?"
choice /c YN
if %errorlevel%==2 goto noalt
cls
echo When The Control Panel Opens click on the "All Networks" tab on the bottom of the page.
echo.
echo Then click "Turn Off Password Protected Sharing."
echo.
echo Then Press "Save Changes".
timeout /t 3 >nul
control /name Microsoft.NetworkAndSharingCenter /page Advanced
pause
call :c 0a "Thank you! The program will now relaunch."
start "" "%~0"
timeout /t 2 >nul
exit


:connect
cls
echo What would You like to do?
echo 1] Search for a chat server on this network (Very Slow)
echo 2] Enter the hostname or IP manually
choice /c 12
if %errorlevel%==2 goto manual
cls
echo Beginning search . . . This may take some time . . .
if exist NetViewCompleted.txt del /f /q NetViewCompleted.txt
echo @echo off >RunNet.temp.bat
echo setlocal EnableDelayedExpansion>>RunNet.temp.bat
echo echo. ^>NetView.txt >>RunNet.temp.bat
echo for /F "skip=3 tokens=1*" %%%%a in ('net view ^^^| findstr /vb The') do ( >>RunNet.temp.bat
(echo 	set /a num+=1)>>RunNet.temp.bat
echo 	echo %%%%a ^>^>NetView.txt>>RunNet.temp.bat
echo 	)>>RunNet.temp.bat
echo ren NetView.txt NetViewCompleted.txt>>RunNet.temp.bat
echo exit>>RunNet.temp.bat

echo Dim WinScriptHost >Runnet.vbs
echo set WinScriptHost = CreateObject("wscript.shell")>>Runnet.vbs
(echo  WinScriptHost.Run chr(34^) ^& "%cd%\RunNet.temp.bat" ^& chr(34^), 0)>>Runnet.vbs
(echo Set WinScriptHost = Nothing)>>Runnet.vbs

start "" "Runnet.vbs"
timeout /t 5 >nul
if exist NetViewCompleted.txt goto netviewc
timeout /t 10 >nul
if exist NetViewCompleted.txt goto netviewc
:backnv
echo Net View Faled. Doing it the longer way.
echo if you are using LogMeInHamachi this will not connect
echo and you can close this window.
echo.
echo.
set numv=0
:loopnv
set /a numv+=1
title ITCMD Chattio Setup
call :c 08 "Searching for CHAT in 192.168.1.%numv%
call :timeout 192.168.1.%numv% 3
if %errorlevel%==2 goto setserv
if %numv%==30 goto notfoundchat
goto loopnv


:notfoundchat
echo Searched 30 IP Addresses and no server found
echo Please ask the administrator for the server name.
pause
exit

:chatfoundyeah
cls
echo A Chat Server was found on 192.168.1.%numv%.
echo Connecting . . .
set nme=192.1681.%nme%
timeout /t 3 >nul
goto setserv


:timeout
set ran=%random%%random%
::135 fsp mc nmapp
set ip=%1
set to=%2
echo @echo off >RunTM.temp%ran%.bat
(echo set val=1
echo net use \\%ip%\CHAT /user:"PING" ITCMD
echo set val=%%errorlevel%%
echo if %%val%%==0 echo %ip%^>found.txt 
)>>RunTM.temp%ran%.bat
echo Dim WinScriptHost >RunTM%ran%.vbs
echo set WinScriptHost = CreateObject("wscript.shell")>>Runtm%ran%.vbs
(echo  WinScriptHost.Run chr(34^) ^& "%cd%\RunTM.temp%ran%.bat" ^& chr(34^), 0)>>RunTM%ran%.vbs
(echo Set WinScriptHost = Nothing)>>RunTM%ran%.vbs
start "" "RunTM%ran%.vbs"
timeout /t %to% >nul
set server=None
if exist found.txt set /p server=<found.txt
if %server%==None del /f /q RunTM%ran%.vbs & Del /f /q RunTM.temp%ran%.bat & exit /b 0
del /f /q RunTM%ran%.vbs & Del /f /q RunTM.temp%ran%.bat
call :c 0a "Server Found on %server%"
del /f /q found.txt
set nme=%server: =%
timeout /t 2 >nul
exit /b 2





:netviewc
echo Testing Net View Devices . . .
set nme2=NONE
for /f %%a in (NetViewCompleted.txt) do (
	if exist %%a\CHAT set nme2=%%a
)
if %nme2%==NONE goto backnv
echo Server found!
set nme=%nme2:\=%
goto setserv


:manual
cls
echo Please Enter the server name or IP
if exist \\Localhost\chat call :c 0a "This PC has a chat server on it. Enter Localhost to connect."
set /p nme=">"
ping %nme% -n 1 >nul
set nmes=%errorlevel%
net use \\%nme%\CHAT /user:"ITCMD" Guest >nul 2>nul
if exist "\\%nme%\CHAT\" (
	set nmec=0
) ELSE (
	set nmec=1"
)
if %nmec%==0 goto setserv
call :c 0c "Unable To connect to  Server %nme%"
if %nmes%==1 call :c 0f "The Computer is not online or accessable."
if %nmes%==0 call :c 0f "The Computer is online, but the shared folder was not found."
pause
exit

:setserv
cls
call :c 0a "Connected to %nme%"
set vert=no
:finderv2
if %vert%==Yes call :c 08 "Just Letters Numbers and Hyphens please!"
set vert=Yes
echo Please Enter A Username:
set /p usr=">"
echo %usr%| findstr /r /i ^^[a-z][a-z0-9-]*$ && echo. || goto finderv2
:bcklop
call :c 0a "Okay %usr%. Setting up . . ."
echo set me=%usr%> Settings.cmd
echo Set him=%nme%>> Settings.cmd
cls
call :C 0a "All Set Up. Restarting in 3 seconds."
timeout /t 3 >nul
echo. >firsts
start "" "%~0"
exit










:notick
echo -----BEGIN CERTIFICATE----- >t.tmp
(echo UklGRvJRAABXQVZFZm10IBAAAAABAAIARKwAABCxAgAEABAATElTVBoAAABJTkZP 
echo SVNGVA4AAABMYXZmNTguMTYuMTAwAGRhdGGsUQAAHP8f/xn+HP58/X/9h/2K/fv9 
echo /v2h/qL+X/9d/xsAFwDAALsAPwE8AZIBkQGuAa4BnAGaAYcBhwGNAY8BdQF7AecA 
echo 7gDW/9r/rP6r/uz96f2o/aT9nP2Z/d792/2p/qP+nv+W/x8AGAAoACUAKQApAGMA 
echo YgDJAMUARQE/AcsBxgEpAicCGwIeAqoBrgEjASgBnwCkAPH/9f8E/wj/AP4C/jL9 
echo Mv3e/N78A/0C/W39bf34/fj9j/6P/kH/Qv9fAGEAAwIFArkDuwPrBOoESAVGBbQE 
echo tARCA0YDYgFpAdX/3f8K/xD/pv6q/hP+FP5b/Vv93fza/JP8kPxR/E78WPxX/Bv9 
echo Hf2G/or+4P/l/6QAqAAQARIBkgGQASsCJgLMAsYCegN2AwwECwRDBEUEDQQOBGAD 
echo XwM5AjYCxADBAET/Q//r/e39wfzF/Lz7wPv5+vz6vPq++hX7FvvX+9b79/z1/IX+ 
echo gv5RAE0A5wHjARUDEQMiBB4EMgUvBdoF2QXABcEFEAUPBf8D/AOGAoICuAC1AMj+ 
echo yP7V/NT8B/sE+8L5vPlR+Uv5l/mX+Uv6UvqJ+5T7kP2Y/fX/9//zAfIBcwN0A8kE 
echo zATXBdkFagZoBrsGtQbFBr8G9QXzBRoEGATJAcQBdv9v/wv9B/3I+sn6Z/lr+f34 
echo APnx+PT4T/lT+bT6uvrl/Oz89/78/rsAvgC0ArcCowSmBHoFfAUBBQMFVgRXBFUE 
echo VgSHBIcEJwQlBB0DGgOoAaYB8//x/zP+Mf6e/J38W/td+636sfrR+tb6lPuX+2r8 
echo bvwU/Rr93f3l/RD/Fv+CAIMA7QHtAVYDVwOwBLEEjQWKBZkFkgX5BPAE2APUAx8C 
echo IgL3//3/Fv4Z/gD9AP1l/GP8x/vG+0P7RPsv+zP7n/uj+7b8t/yp/qb+CgEGAeYC 
echo 4gLoA+YDkQSSBAwFDwXRBNYEyQPPA5QCmAJSAVUBpv+p/xL+FP54/Xf9Wf1T/aL8 
echo mfzU+877Kfws/Fb9Xv1U/ln+Rf9D/44AhwB4AXEBmAGVAd0B3QGVApgCnAKfAswB 
echo zgGvAa0BRQI/AukA4gCz+637avNj82fpX+ki3xjfm9iS2KDamNpL5ETkk+6M7p71 
echo lfV1/mv+Jg8cD38kdySzNK80EjoTOhg2GzYiKyMrERkQGa0BsAG768LrDN4U3gPZ 
echo B9l613vXbNVv1cfTztNY1l7WA+AB4Ajx//D/BvQGSx1DHUouRi47NTw1pDCpMPUj 
echo /iM5FkEWDw0UDTIINAj4AvgCDfoJ+hjuE+594Xjhndag1jHRO9HH1dDVNuU25bX5 
echo r/mpCqUKMxM2E7EUtRT2E/YTEBUMFegY6BiYHZ0dCCAMICUdIR3nEt4SUQJLAnvw 
echo e/Cv47Pjut693tjf29/+4wXkRelP6SvuNO4w8TPxAPP+8mH3X/eTAZQB7w/yD5Ac 
echo kxxpImsi2CDZIJoamhrJEsUSeAtvC9cFywXtAeQB/P37/Xr3ffd47Xjty+HD4X7X 
echo c9fP0MfQA88Azy7TK9N83XPdj+uC6+H41/gyAjIC7QjyCA4SExJ4IHogjTCOMKA6 
echo oToJOgo6ejB6MC8iLiLvEO4QyfzH/FToUugA2f7YMtI00hjSH9J91IXUf9eG10nc 
echo Ttxa5F7k6e/q71D+UP5DDkEOTx1PHZoonCh+LoEusS6xLhgpFyn6Hfkdfw98D38B 
echo eAHQ9sX2bO9h797p2+nB5cXl3ePk41DkV+Tm5evl5Ofp587r1Os89EH0fgGDARwQ 
echo IhAzGzgbCCAJIPQe8h65GbUZGBIVEuMJ3wn4AvECXP5S/pP7iPtB+Tn5WPZU9sPy 
echo w/JZ71/vf+2G7Xvuge7A8sPygvmD+f8AAgFSB1cHJQsoC+ML5QvICcoJBwYMBqAC 
echo pAI9AT0BzgHJAX0CewJ4AYABp/61/of7k/uF+Yz5BfkL+eb57/la/GL8kACSAKkF 
echo owWeCZYJsAqpCswIxwhqBWMFFQIPAmb/Zf85/UD9dvt++xv6HvrK+Mj47vbv9sD0 
echo yPS+88fzfvWD9Rz6G/oqACkAEgYZBggLFQunDrIOcRB1EAgQBRCQDYgNmgmPCRIF 
echo BwUnAR8BjP6H/o38ifx7+Xb5nfSZ9GLvYe9E7Efsquys7CrwJvCF9X31wvu9+zIC 
echo NwL+BwgIPQxCDL4Oug44EDAQXxFaEdcR1hF/EH4QuQy3DP4G/QY8ADwAQ/lD+fXy 
echo 9PJv7m3uZOxi7Jvsm+xR7lDu+PD28Hf0d/Tq+O74Y/5p/q4EswQbCx4LihCMEOMT 
echo 5xOnFKsUFBMVE9sP2g+xC7AL9wb4BsQBxgE7/Dz8wfbD9uTx5/Ep7i7uHuwh7Fvs 
echo Wuwg7x7v1fPW80H5Rfls/m/+PgM9AwAI/AeMDIgMJhAmECYSJxJpEmkSDBEKEQMO 
echo AQ5CCUQJTQNQA0L9RP0j+CL4KfQl9AjxA/HS7s3uL+4t7pzvm+++8r/y0/bW9nf7 
echo fPuoAKwAGAYZBvYK9QppDmcOEBAPEPgP+A9XDlQObgtoC5MHjQcsAykDmv6a/kD6 
echo Q/qh9qX2RvRI9GjzavPU89fzMPUz9Vb3WPdD+kT6q/2r/foA+QDKA8YDJwYhBioI 
echo JgiKCYkJxwnHCcEIwgjlBucGswSzBE4CSwKt/6b/Ef0H/f/69vrR+cz5Zvll+XH5 
echo cPnk+eP59Prz+p/8oPyI/of+UQBLAP4B9AG0A6wDNgU3BekF8QVpBXAF9AP0AyUC 
echo IwJzAHUADf8Q/wX+Av5r/WX9P/07/V79X/2i/af9Bv4K/qL+n/6E/3v/mwCXALkB 
echo vwGTAp0C1ALcAksCUQIiASYB4f/j/xn/Gv8E/wj/cP91/+D/4//e/93/Sv9F/2z+ 
echo aP7U/dT9+f37/eH+3/4QAAwA5QDnAAsBEgGtALEARgBDADkAMwCUAJIAEAEXAVQB 
echo XgEdASABTgBIAAP/+v6q/af96/zr/DT9Mf1o/mD+9v/v/0gBRgEOAhMCUAJaAkYC 
echo UQI4Aj4CVwJVApkCkQKvAqUCOAI1AhEBEwFs/2v/tv2w/W/8afz1+/L7TvxN/BL9 
echo E/2r/a79yP3L/Z39nP2r/an9WP5Y/qv/q/9kAWQBKwMrA58EnwRrBWoFawVpBbsE 
echo vASpA6sDggKBAmkBZQFLAEoA+P78/kf9Sv1P+0/7mPmV+dH40PhW+Vn58/r8+if9 
echo M/2M/5b/8QH1ARsEGQS0Ba8FjgaLBskGyQaIBokGmAWZBaEDpAO/AMQAof2n/QT7 
echo C/tA+Uf5afhv+KX4qPgS+hT6Zfxn/Nn+2v7BAMIAFAIZAjEDOANDBEkEFgUZBWMF 
echo ZwUOBRIFGAQcBHoCgAJdAGIAQP5A/rn8tPwJ/Af8CfwM/GL8aPzg/Ob8a/1u/dv9 
echo 2f0p/if+pP6o/rX/uv9hAWEBKQMnA2cEaQTdBN4EswSxBBYEFQQQAxEDvQG7AWYA 
echo YABM/0j/Xf5b/kb9Q/3w++v7u/q3+jT6L/qf+pr63vvf+7T9uv3h/+b/AQL/AZcD 
echo kQNrBGcEtgS2BNoE2QTpBOQEkQSNBIIDfwO8AbYBhP9+/0P9RP15+337mvqW+sH6 
echo t/qL+4b7afxt/Cj9K/36/fv9I/8k/5wAnAAlAiMCowOkAwgFDgX7Bf0F6wXlBakE 
echo owS/AsECCgENAdX/1f++/r3+YP1h/dL7z/t4+nL6rPms+Z/5pPmI+oj6iPyC/ET/ 
echo Q//4Af0B9gP7AwsFDQV4BXkFhgWEBTsFOQWgBJ4E0wPSA8ICwAIfAR0Bwv7A/hL8 
echo D/zo+eX57vjs+CP5Ivka+hf6ZPtg+9b8z/xs/mX+IQAeAPIB9AHhA+IDuAW2BQYH 
echo BAdmB2cHvga+Bj8FPQU5AzYD9wDyALz+s/7A/Lj8HfsZ+9H50Pnl+OX4nvib+F35 
echo V/lG+0H7Av4D/vIA9ABtA2oDDQUHBcQFwwXEBcYFVAVYBbMEuATwA/QD+gL6ArEB 
echo rwENAA4AR/5H/q/8rPyH+4T79/r2+gD7//qA+4H7UvxX/Ez9U/1X/lv+g/+G/+QA 
echo 6ABsAnEC2APbA7AEsQSpBKoE6APrA9IC2ALLAdAB9QD2ADEAMgBW/1v/T/5U/hz9 
echo Hf3y+/L7QvtF+2/7cvuD/If8G/4g/rD/tP/4APsA7gHxAakCrQI+A0EDrAOtA+YD 
echo 5wPUA9QDSgNKAysCLAKnAKkAJP8m//f9+f01/Tf9yvzM/KD8o/yr/LD83vzh/Dj9 
echo N/3N/c39wv7F/hwAHACTAY0BuAKzAkYDRwM+Az8DxgLEAhECDgJRAVIBsgC1ADMA 
echo NACW/5j/qf6q/of9hf2o/KX8jfyP/Ff9W/2q/qr+/P/6//AA7wCAAX8B6gHnAVcC 
echo VQK9ArsC7gLnArACpwL1AfEB8QD0AOr/7/8N/w//ZP5k/u798P29/cH92v3e/SP+ 
echo If5e/lf+eP5y/p3+mf4W/xP/+//7/xABEgHyAfMBTgJMAg8CDgJ1AXQB3gDcAIkA 
echo hQB4AHQAdgBzADYAMwCX/5n/yv7R/ir+MP75/fz9SP5I/vr++v7Z/9X/mwCWAAwB 
echo CAEnASUBFQETAQQBAgH/AP8A5QDqAJUAngAbACAAm/+X/zH/Kf/w/uz+6v7q/iv/ 
echo Kv+i/6H/FwAYAEEARAAFAAoAlP+d/0//WP+D/4X/OwA1ADABKQH4AfQBQgJBAv0B 
echo /QFdAV0BsQCxABwAGwB7/37/m/6i/nr9fv1Z/FP8mvuS+5v7l/uG/Ij8N/46/jsA 
echo PgAFAgoCJgMsA4QDiANcA18DEAMRA9cC1AKpAqMCXgJVAs8BxwH2APAA6v/q/8/+ 
echo 0v7S/dX9Jf0n/dr83vzR/NX85Pzl/A/9EP17/Xz9Wv5X/qf/pP8mAScBiwKOApED 
echo kwMDBAMExQPFA/gC8wIIAgECagFoAS8BLwH3APMARwBBAPX+9P5Z/V/9AfwI/Er7 
echo UPtP+1P7+vv8+wn9CP0w/i/+Tv9N/4EAfwD/AfwBxQPBA2wFaAVaBloGHgYhBq8E 
echo rwRqAmcC6v/q/9H90v2F/Ib8CfwJ/Bv8HPxu/G38xvzD/Af9B/1J/Uv9zf3L/dL+ 
echo zv5UAFMA5gHpAfQC8gI2AzAD8gLxArwCvgLjAuQCPwM8A10DWwPKAsoCRwFGAfP+ 
echo 8v5j/GL8d/p2+tf50/l7+nf65vvk+439i/0k/yH/mQCXAOQB4QHuAusCvAO6A1kE 
echo WQSvBLAEfQR8BIYDgwPxAe8BRgBGAP3+/f5E/kL++v32/cL9wP1a/Vv9vPy9/BH8 
echo EPyx+7H7DfwO/FL9Uf1E/0L/TwFOAdwC3AKqA6wD2QPcA7YDuAN/A4EDMAMyA6UC 
echo pALDAcEBbQBrAKv+qv7k/OL8tfuy+5/7nPui/KP8Hv4j/lL/Vv/j/+T/6f/q/8D/ 
echo wf/C/8X/OQA9AEwBTgHHAsUCBQQDBGMEZQSyA7cDWAJbAvkA+wDz//X/Nv84/4D+ 
echo gf6Z/Zr9dvx4/Fb7V/u7+rr6Mfst+9X80/wq/y//ZwFsAeMC4gJsA2wDSQNMA+wC 
echo 7AK1ArUC1ALaAhYDHgPuAvIC5QHqAQUADADw/fb9efx9/Ab8CPxu/G38Q/08/Qf+ 
echo //1n/mP+X/5f/jz+Pv6H/oj+q/+o/4sBiQGIA4wD5ATqBCsFLQVmBGgE+AL7AmAB 
echo YAEWABsAV/9j//f+A/+L/on+rP2g/Wr8Yvxq+2n7U/tT+1P8T/wb/hX+EgANAKIB 
echo pAFtAngCawJ3AgACAgK4AbQB4AHeAVsCXAK3ArcCgQKAAqgBpQFgAFwA5P7g/oj9 
echo hv24/Lj8vvy+/IT9f/2I/oH+RP8//4z/iv+W/5n/yP/K/1oAWQBHAUYBTwJTAgQD 
echo BwP+Av0CQAI8Ai8BLQFXAFcA///8/+r/5f+q/6b/Cf8F/xL+Ef4N/RD9Xvxf/FD8 
echo S/wB/f78U/5Y/tr/4v8fASUB5QHnATMCNAJHAkkCWgJdAn0CgAKdAp0CigKCAv8B 
echo 9AHcANgARf9I/6X9qf2M/I78V/xa/PD89Pzh/ej9rv62/if/Kf91/3T/6P/o/7oA 
echo ugDtAewBRwNHA1sEXQS2BLcEHwQfBMUCxwIgASIBjv+M/yz+Lf4G/Qv9LPws/Kn7 
echo p/uG+4r7yvvO+4H8gPy1/bb9R/9L/94A3gAmAiQCDAMLA6YDpQPyA/ID2gPcA2gD 
echo aQPQAs8CNwI4AoIBhgGGAIoAQ/9D/+796/3B/L783vva+1f7U/tN+0j7z/vJ+8L8 
echo vfz4/fX9ZP9h/wcBBQG5ArgCHQQcBOgE5wQdBR4F8ATtBGgEZQReA14DvQG9Ab// 
echo vP/J/cn9Nvw2/Dv7OPvs+ur6TvtO+z78Pvxy/XL9qf6m/tf/z/8JAQUBPgJAAk8D 
echo UAMABP0DNgQyBPQD8QNAAz0DIgIhAr8AvQBT/07/F/4R/hv9Gf1R/FP8u/u9+3X7 
echo evut+7P7dPx0/Kn9pP0o/yX/6ADmAL8CvQJPBEwEKwUjBSAFFwVsBGsEgQOHA5QC 
echo mAKNAYsBSgBFANP+0v5b/V/9JPwn/Fv7XPsj+yL7kvuQ+438jPzT/dn9Pf9F/7YA 
echo uAAgAh4CUANPAxkEGgR0BHUEgAR+BD0ENwRzA24DBQICAiYAJgBI/kj+zvzQ/PT7 
echo 9fvD+8T7EfwS/I78lvz8/AX9Vv1X/eH94P3u/vD+dgB1ABcCEQJnA2IDPwQ5BLUE 
echo rATOBMcEawRtBI4DlgNZAl0C3gDcAB7/H/8v/Tb9ZPto+zf6M/r7+fT5uPq0+jn8 
echo Ovwh/iT+CgALAJ8BoQG5ArsCZgNnA9cD2AMxBDUEaARpBDUEMgRlA2cDEQIYAnIA 
echo dADG/sX+Sf1M/SP8J/xq+2T7DvsD+/T68Po3+zb7DvwJ/Ir9hv2H/4b/nAGcAVQD 
echo WAOGBIwENgU5BWMFaAUMBRQFNwQ/BAgDDwOhAacBDQAOAFT+Uv6j/KP8RPtD+3j6 
echo dvpZ+lf68vrx+kv8Tfw2/j3+QABGAPIB9AEaAxgD2APXA1gEWQR/BIIEFAQZBCMD 
echo JwP1AfgBxADJAJ7/pv+E/on+jf2M/eL83vyI/IP8VvxU/Ev8UPyk/Kv8f/2D/az+ 
echo s/7c/+H/4QDfAOAB4gEHAw0DKwQnBNsE0gTOBMwEEwQVBOkC6QJ4AXgB2f/Z/0j+ 
echo RP4I/QP9PPw6/Nf72Pu7+7v78fvx+6D8ovzI/c39Lv8z/34AhQCTAZwBggKLAlAD 
echo VwPcA90D/wP8A7UDsQMbAxcDPwI6AgwBBQGS/4n/G/4U/u788Pw5/D38AvwE/Df8 
echo OvzP/M/8qf2j/Yb+hv5Y/1//QABAAFkBUQGIAoICfwN+AwcEBwQfBB0EwgO+A9sC 
echo 1wJvAXAByP/O/1v+Y/5u/XL94/zi/IT8hPxQ/FL8dPxz/AP9/fzg/dj95/7i/gcA 
echo CQAyATUBRwJHAhUDFQOEA4MDmAOWA1ADTwOvAq0CygHFAcEAvQC4/7L/vP64/tL9 
echo 1/0c/ST9w/zF/M38y/wn/Sf9uP28/Xr+f/56/3r/qwCjANgBzgHKAsQCVANUA2ED 
echo ZgMDAwMDSAJCAkMBPwElACUAKv8r/3/+fP4n/iH++/31/dH90f22/br9zP3S/SD+ 
echo KP6s/rD+Y/9h/0YARgBKAUsBLwIuArICsALLAswCnwKhAk4CTQLKAcgB8QDzAOL/ 
echo 5P/m/uT+Jv4l/q39r/2T/ZP94v3i/YD+g/4d/xr/Zf9c/2T/X/+C/4L/DQAJAOgA 
echo 5ADBAcMBYwJnAqkCrQJpAmwCkAGOAVQAUQAk/yb/ZP5p/iH+JP4o/if+V/5W/qb+ 
echo p/7//gD/Rf9E/3j/c//H/7//YQBcABwBHAGSAZMBkwGWAUkBTQH7APoAvwC8AIQA 
echo hQBIAEoAGwAcAO3/8P+c/5r/Fv8S/4P+hf43/jv+W/5b/sT+wv43/zP/p/+j/yIA 
echo IQCgAJ4A+gDzABIBCwEGAQABCwEEATEBKwFVAVQBTgFRARIBFQGvALIALQAyAJj/ 
echo m/8D/wP/hP6F/iv+Lv75/fn96/3r/R/+H/6v/q3+ff99/0UARgDRAM4AHgEbAVkB 
echo WAGXAZYBwQHFAc4B1gHAAcABiwGEASQBHgGNAIoA7f/p/2b/Yv/w/uv+cP5w/vD9 
echo +f2q/bf94P3p/X/+hv4z/zn/0v/U/2cAZQD9APsAfgF8AbEBrQGFAYIBOAE8AQgB 
echo CgHrAOcAtACxAEkASgDK/8f/T/9L/8n+xv47/jj+0/3T/cf9zf00/jr+5/7t/pH/ 
echo l/8eAB4AmACZAAQBCgFqAXEB0QHUAT4CQAKmAqgCxwLKAlsCXwJgAWQBJAAlAAz/ 
echo Cf9H/kD+yv3F/ZT9kv20/bP9Hf4a/p3+lv79/vT+M/8w/2f/aP+4/7n/LwAwAM4A 
echo 0wCQAZcBSgJSArACuAKPApICBgIGAmgBZwHcANoANgA2AE//T/8//kD+Uf1V/cL8 
echo yPyg/KH89vzz/Nj92P0a/xz/QgBBAPAA7AAmASIBPwFBAZ8BoQEyAi8CqQKmAuIC 
echo 3wLCAr4CJQIlAgwBEAGt/6//bP5v/p79pf1I/U79Of05/Uf9Q/1a/Vj9e/17/b79 
echo v/1K/kv+U/9R/9QA0ABzAnACqwOsAxsEHATEA78D7gLpAvsB+QE2ATUBqACqAB0A 
echo IABg/2D/af5l/nb9cP3n/OT85/zt/Gb9bf01/jf+E/8Y/+D/5/+SAJQAGgEcAYkB 
echo jQH7AfoBbAJmAr8CuQLAArwCRgJFAlQBVAESABEAzv7M/ub95f2I/Yr9qP2r/Qj+ 
echo C/5d/mL+kv6X/r/+vv4L/wf/ov+g/4YAgQB1AW8BJwInAnYCdQJhAlwCBAICAnAB 
echo dgGzALsA7//0/0n/SP/H/sb+UP5U/tn93P2E/YL9e/16/dr92f2b/pj+kf+U/5EA 
echo mgBvAXUB9QH2AQ8CEQLiAeEBlAGOATMBLAG6ALYAOwA3AOL/3f+8/7r/pf+n/3X/ 
echo d/8y/zX/Bf8I/wL///4R/w3/G/8Z/yH/Hv85/zv/cv96/7//w/8QABAAZwBrAMcA 
echo zAAVARcBKAErAQIBBwHhAN4A3ADVANUA1AC0ALUAdAByAC8AKgAFAAMA6f/q/7j/ 
echo tv9t/2z/K/8v/xb/Gv8r/yz/Tf9P/37/gv/G/8v/DAASACUALAD//wUAyf/M/83/ 
echo y/8aABYAfwB8ALsAuACqAKgAaABmACEAHwDb/9n/lf+S/2X/YP9c/1r/ef96/5n/ 
echo lf+a/5b/i/+P/5//pf/z//T/dAB1APAA8QA9ATgBQAE7AQEB/wCkAKQAVwBWAEAA 
echo PgBhAGIAgQCDAF0AXADf/97/J/8n/3r+ev4b/hz+I/4l/or+iv4i/yD/qf+m/wYA 
echo //9GADsAiwCCAPYA8QB4AXoB4QHnAQkCDALZAdcBRQFEAV0AXwBX/1n/jv6M/jr+ 
echo Nv5L/kr+fv6A/o3+j/51/nf+fP58/tv+1f6N/4f/cgBwAFEBUQHnAeoBGQIiAvsB 
echo BgLJAc0BsgGvAaIBnQFbAVcBtQCyAMj/wv/S/s7+Df4P/of9jv09/UT9M/04/W79 
echo c/3x/fX9rP6s/oz/iv+MAI0AnwGhAaQCpQJtA3ADxwPKA4sDiQOyAq4CagFpAQgA 
echo CgDj/uL+IP4b/rH9r/2H/Yn9l/2V/c/9xv0W/hH+Zv5o/tX+2P59/4H/VABbACEB 
echo JwG1AbgBEAIWAlQCWQKKAokCjwKKAjoCNQKQAYgBsgCsALj/tf+y/q3+v/24/Qr9 
echo B/23/Lj8zfzJ/C39Kv3B/cb9lv6Z/qv/p//ZANkA8QH2Ac8CzwJeA1wDqQOqA7sD 
echo uwNxA2wDnwKZAkoBRQGo/6H/Df4H/sr8x/z/+/77uPu4+/H78vuJ/Iz8Zv1o/YL+ 
echo gf7Q/8//OAE4AY4CjQKVA5UDJAQmBC8ELwSwA68DuQK7AokBjgFwAHEAlv+Q/+P+ 
echo 4f44/j3+iP2N/d/84fxf/GP8K/ww/GP8Yvwn/ST9d/54/iEAIwDNAcsBHwMcA+ED 
echo 4gMTBBcEyAPJAx0DHwNGAk0CZQFrAXwAewBz/3P/RP5H/hv9G/1G/EH8BfwB/G78 
echo bfxe/V79j/6N/rj/tv+nAKUASQFLAbkBvAEeAh8ChwKFAtUC1QLbAt8CegJ+Aq0B 
echo sgGUAJoAdP93/5D+j/4O/g3+8v3x/Rv+F/5G/kH+Pv49/hD+D/4J/gT+fv53/of/ 
echo hv/cAOIA9QH6AX4CfwJ+AoICNAI6AtgB3AGGAYkBSAFLARIBEwGgAKAAqf+p/z7+ 
echo QP7d/OD8Jfwr/GP8afxc/V/9of6g/s3/y/+RAJEA4wDmAPgA/QAVARoBdgF7ARcC 
echo GwKxArUCAQMAA9ICygIZAhECCwEJAev/7//z/vz+Pf5K/qj9tv0d/Sn9vfzC/LD8 
echo r/wQ/Qz94f3a/QX//P5ZAFEAoQGeAY4CkgL/AggDCAMQA94C4wK2ArYChgKDAhMC 
echo EgI0ATYB8f/y/4j+hf5F/UD9WvxV/O376PsS/A78v/y7/NH9zP0K/wf/JgAmAAwB 
echo DAHNAcwBeAJ8Ag0DEwNrA2wDcQNuAxADEQNFAkkCFQEVAar/qP9P/k3+Uv1N/dj8 
echo z/zJ/MH8+fz0/F39Wf30/fH9sv6x/o//jf+IAIQAmQGSAagCogJwA24DsAOxA2kD 
echo agPJAswC9wH+AQQBDAH9/wEA+f74/hj+Fv5g/Vz90vzJ/In8fvym/KH8Ov09/Sv+ 
echo Lv44/zv/OAA7ABcBGQHCAb4BLQIpAm4CagKoAqAC2gLPAscCwAI/Aj8CVAFWATYA 
echo OAAX/x7/G/4k/kb9Tf2v/LT8evx+/Kr8rPwt/S798P3x/eT+5P4AAAAAJgEpASUC 
echo JwLfAtsCSgNBA2UDXwM4AzQDwgK/AgwCCwIpAS0BJAArAAj/EP/y/f79FP0h/aT8 
echo qfyu/K38G/0X/c/9y/2w/qz+mv+Z/24AcgAZASABowGmASACHwKVApUC7ALxAgoD 
echo DQPWAtMCRQJAAlQBUwERABIAtP63/o79k/3f/OT8r/yw/Nj81fw7/Tf91P3Q/Z/+ 
echo mv6H/4T/bgBtAD4BPQHzAfMBfwKBArgCvAKIAowCCwILAnUBcAHmAN4AWgBTAL7/ 
echo uf8N/wf/Vf5S/rr9vv1b/WH9T/1P/aP9oP1R/k7+P/86/0IAOwAhARsBvgG5AR0C 
echo FwJHAkMCTAJKAjMCMwLuAewBagFoAaYApACj/6H/gf5//of9hv37/Pz8Av0D/YH9 
echo gv0//j7+DP8K/9P/1P+EAIgACAEKAVIBUQF5AXgBnAGdAcIBwgHUAdABqAGmATQB 
echo NQGVAJgA7v/x/0//U//S/tT+if6H/nz+dv6j/p3+6P7l/jn/Of+Y/5z/AgAKAGsA 
echo cwDBAMgA+gD/AA8BEQH8APsAxgDBAIIAewBgAF4AegCBAKYAsQCSAJoAHAAgAHD/ 
echo cP/T/s3+av5g/jr+NP5S/lL+xv7G/nr/eP8oACkAngChANcA2ADtAO4AAQEBARgB 
echo FAEmASABGwEXAeEA4gBsAHAA0P/U/0j/TP8N/w7/F/8X/zr/Pf9Q/1X/S/9O/zT/ 
echo N/8g/yb/Jv8q/1b/VP+y/6//KQApAJ4AnADvAOsAFAERASIBIgE2ATYBWQFYAW8B 
echo bwFMAU0B0gDTAAUABwAW/xv/Uv5Y/u/98/30/fj9Sv5Q/sD+xf4w/zH/k/+S//P/ 
echo 9f9kAGkA+AD8AJsBmwEcAhoCSgJIAgkCBwJdAVkBbQBpAHX/df+7/rz+cP5u/or+ 
echo hv7F/sb+3P7h/sr+zv7A/sT+8/73/nT/eP8jACUAzQDNAFEBUQGhAaIBwQHAAccB 
echo yAHCAcYBsAGzAX8BfAEJAQIBPAA4AC7/LP8D/v798/zs/E78SvxK/Ef84/zd/OD9 
echo 2/3+/gD/GgAhACQBKAETAhMC5QLlAosDjAPcA90DrAOtA+EC4QKZAZYBJQAhAN3+ 
echo 2v4D/gL+n/2f/Yz9iv2g/Z79wP2//dr92f3+/f79Sv5L/tb+2P6s/6r/tgCvAMMB 
echo vQGmAqQCOgM8A2MDZwMcAyEDgQKGAsgBzwEMARUBNgA9ACT/Kf/k/er9t/y8/On7 
echo 6vuj+6L76fvr+7v8u/z//f39ef94//MA8wBVAlICiQOIA2MEZQSZBJsE/gP/A8gC 
echo zAJwAXUBQwBDAED/Pf9U/lH+j/2N/RX9E/3i/OH83vze/An9CP1+/X79W/5b/pX/ 
echo k//yAPIANAI2AjIDLwO+A7UDvAO1Az4DPAN7AncCogGbAb4AvADA/8T/sv6z/q/9 
echo q/3c/Nf8YPxd/Fb8UvzB/Lz8lP2R/Z7+ov6k/6r/iQCMAE0BTQH+Af8BrAKtAj8D 
echo PgN/A34DQQNCA3kCfAJQAVMBEgAXAA//E/9u/mz+G/4V/uX93/20/bH9j/2Q/ZH9 
echo lf3Q/dH9Sv5K/vj++v7R/9H/vwC7AJcBlQEqAi8CYAJjAlACSwImAiIC+wH9AcsB 
echo zQF5AXUB7wDoADIALgBU/1P/Zv5n/pf9l/0c/R/9Df0S/VT9VP3F/cL9UP5O/gn/ 
echo Cv8BAAEAGwEbASUCJwLyAvMCXQNcA0kDSQOyArUCxgHHAcwAyQDq/+j/Ff8X/z3+ 
echo Qf56/Xz9+/z8/On87PxK/VD9AP4D/uv+6P7x/+z/6ADnAKwBrQEuAi4CdQJ1ApMC 
echo lQKMAo8CRAJDAqsBpAHQAMUAyf/D/7v+uP7Z/dX9W/1U/Vf9U/2v/bD9Kv4o/pf+ 
echo kv73/vL+dv90/zQAMwAcARoB/AH5Aa4CqQIMAwgD+gL4AnQCcQKWAZIBmQCXAKf/ 
echo q//R/tT+Gf4Y/oX9hP0t/S/9KP0p/W39a/3+/f397/7w/ioAKgBcAVwBIQIiAk4C 
echo TgIUAhQCxQHIAXgBfwETARwBgQCJANT/3P8x/zf/pv6s/kD+Rv4v/jP+kf6T/jr/ 
echo Pf/O/9H/EwATACMAIwBHAE0AnwClAAMBAQFLAUQBcAFuAXIBcwE8ATkBrwCuAOH/ 
echo 5f8i/yP/sv6q/pX+jv6y/rH+8/7z/kj/Rv+a/5z/3P/j/x8AIwB8AHoA7gDqAEcB 
echo RwFWAVUBCQEFAXoAegDl/+r/gv+F/1//W/9a/1X/W/9Y/1j/Vf9L/0n/RP9G/2L/ 
echo Zf+m/6b//v/8/1oAWACpAKYA2QDYAOEA5QDBAMYAjQCRAFsAYAAuADMAAQAAAMf/ 
echo xP+G/4j/VP9a/zv/Pf87/z3/Xf9j/57/ov/h/97/BAAAAAIABAAGAAoANQA4AIIA 
echo hADBAMQA3QDfANcA1gC2ALcAdgB5ABsAHADE/8T/jP+Q/3T/eP9f/17/Ov83/yH/ 
echo JP9C/0f/mv+Y//3/+f9QAFEAlgCXAMoAyQDQANAAnACeAFMAVQAgACIAEQATABUA 
echo EQAFAAIA2v/h/6b/r/9v/2//O/85/yn/LP9Z/1r/x//A/zsANQB+AHwAjQCLAIcA 
echo hAB+AHwAeAB0AG4AaABgAFsATgBJACsAIwDu/+n/pP+l/2j/af9E/0L/Nv80/zv/ 
echo Ov9b/1r/j/+R/8n/zv8DAAUAOAA4AG8AcgCwALIA5ADiAOkA5wC9AMAAewCAAEEA 
echo QgAXABQA8//w/8n/yP+Y/5f/bP9o/1X/U/9S/1T/Wv9b/23/bf+W/5b/3f/d/zsA 
echo OwCQAJIAxQDKAN8A4QDeAN4AvQDAAIYAigBIAEoAEAAPANb/1/+P/5L/Sf9J/x7/ 
echo G/8Z/xb/Kf8o/z3/PP9P/03/cP9s/7L/rv8WABIAhgCBAPAA6gBNAUcBiAGEAYQB 
echo ggE0ATIBqQClAPz/9v9F/z//qP6n/lX+Vf5c/lv+q/6q/h//If+e/6H/HQAdAJsA 
echo mAAPAQ0BYgFkAYMBhwFyAXQBNAE0AcsAzwBJAE0Awf/A/07/Sv8N/wv/Av8G/xv/ 
echo H/8+/z3/Tv9N/0v/TP9O/07/bv9q/7D/q/8KAAoAZwBqALAAsQDVANQA1QDWAL4A 
echo vwCiAKAAgwCAAFwAXAAiACYA1f/Z/4b/iP9E/0f/Hv8g/yD/H/9L/0f/kP+Q/+T/ 
echo 5v80ADQAYQBiAF4AYABDAEMAPAA4AFYAUAB7AHkAkQCPAIIAgABWAFcALQAvABMA 
echo EwAEAAAA9f/x/+P/4P/V/9T/y//N/7n/vf+i/6f/kf+V/4f/iP+C/4D/hP+F/5j/ 
echo mv/H/8j/BAAHADYAPQBXAFwAaQBnAHQAcgCEAIMAiQCHAHIAcQBEAEcAFAAXAPb/ 
echo 9v/n/+b/1P/T/7n/t/+g/53/mf+Y/6n/rP/H/8r/5v/p/wAAAQAPAA8AGgAbACwA 
echo LgBMAE0AdwB4AJcAmwCPAJUAWwBgAA0ADwDH/8j/pv+n/6j/qf+6/7v/0P/R/9T/ 
echo 1/+3/7v/gf+D/0r/Sf8u/y3/O/86/2v/Z/+x/67/BAAEAFkAWwCtAKwA9QD0ADAB 
echo LgFbAVUBXQFWARoBFgGQAJEA3f/f/y7/Lv+y/rH+iv6J/rr+uP4k/x//nP+W//L/ 
echo 8v8UABoAGgAfACgAJwBDAD8AZwBmAJoAmQDTANAA/gD7AAQBBwHhAOgAowClAF4A 
echo WQAYABIAyf/H/2P/Y//r/uv+f/6E/kf+T/5Z/l/+sv60/jz/Pf/a/9z/cQB1AOkA 
echo 8AA6AUMBcAF4AZABlgGLAZEBSgFOAckAygAeACIAef9+//3+Av+z/rf+lf6W/qb+ 
echo pP7o/uT+Rf9C/5n/lv/S/87/AQD9/0QAQQCjAKAADwEKAWgBYwGTAZABhgGEAT8B 
echo PAHHAMIANQAwAKT/of8k/yP/uf63/mj+ZP5F/kP+Xf5e/qz+rP4m/yH/sv+t/zkA 
echo OQCvALAABQEEATgBNQFOAUwBSgFHASgBIgHmAOEAjwCOADMAMgDQ/8//av9q/xn/ 
echo Gf/v/uz+7v7r/hP/E/9M/0v/ff99/6L/pP/E/8X/6v/o/x0AHQBkAGYAuQC2AP0A 
echo +QAUARgBAgEJAc8A0ACGAIIANwA2AOv/7P+n/6T/av9l/zj/N/8d/yD/If8i/zn/ 
echo Nv9g/13/nf+c/+z/7P9EAEIAkACPAL0AvgDPANAA0ADPAMQAwwCtAKsAhACCAE4A 
echo TQAOABEAwf/F/2z/b/8o/yr/Bv8H/wn/C/8s/zD/Zf9q/6//sf/7//z/NQA5AF8A 
echo YwCGAIYAswCzANwA4ADiAOQAtACzAGUAZwAYAB0A5//o/9H/zf/G/8P/uv+6/6L/ 
echo ov93/3b/SP9G/zD/Lv8+/zv/bP9p/6v/qv/0//f/RwBIAJUAkgDIAMYA0QDRALIA 
echo sgCEAIAAVwBTAC0AKwABAP//zP/K/5L/kf9k/2H/Uf9N/17/W/+I/4b/wv++//b/ 
echo 8/8UABQAHgAaAB8AFgAhABwAKQArAD8APwBgAFoAhQCCAKoArQDIAMkAzgDMALAA 
echo sgBwAHYAGgAcALz/u/9p/2v/OP87/yr/LP8v/zD/NP82/zr/Pf9R/1T/hP+H/9b/ 
echo 1/86ADoAlwCaANgA2gDoAOgAxgDGAI0AjwBeAF8APwA6ACIAHQADAAQA4v/n/7X/ 
echo u/93/3r/Nf80/w//Df8n/yr/hv+N/wMACABdAF4AcgByAFAAVAAfACYADQAQADMA 
echo NACRAJEA9wD7ACQBLAHyAPwAdAB5AN7/2/9i/17/Fv8Y/wH/Bf8a/xr/Rv9F/1// 
echo Yf9h/2L/Xv9b/3r/eP/X/9j/ZwBnAO4A7wA+AUEBRAFEAf4A+wCGAIUADgAPAMX/ 
echo wf+t/6j/qP+o/5T/l/9h/2L/HP8c/+z+6/7s/ur+Iv8g/4j/if8MAAsAjACIAOYA 
echo 4wANAQsBFwESARgBFAEUARQBAAH/AMgAwwBoAGYA/v///5//n/9S/1P/Jv8o/x7/ 
echo G/8z/yz/Vv9U/3T/ef+O/5H/tv+2//P/9P87AD4AfwCBALEAtADNANAAygDKAJ8A 
echo oQBgAGYAKAAtAAEAAQDh/9//uv+4/5D/jP9z/3P/cv93/43/k/+0/7X/0v/Q/+D/ 
echo 3v/i/9//3v/d/+L/4//1//f/GgAZAEgARABlAGAAXgBbADQAMwD1//T/u/+5/5r/ 
echo nf+e/6X/yP/L////+v8dABYAGQAXAAYACAD6//z/BgAHACIAIQA2ADQAOwA6ADMA 
echo MQAdABwABwALAP//BwAHAAoAHAAZADEALwA3ADYAJwAkAAEA/v/M/8z/mf+b/3// 
echo gf+J/4r/q/+p/9H/z//0//L/FAATADcANwBjAGQAkACPAKsApQCcAJQAXwBaABIA 
echo DwDP/8z/pf+j/6L/ov/C/8H/7//s/xYAEwAkACMAEgARAPD/7v/b/9j/5f/k/xUA 
echo FQBVAFQAfwB+AHUAdwA2ADoA4v/i/5v/mf9v/3T/Z/9u/37/f/+c/5n/rP+u/7P/ 
echo uP++/77/1v/T/wAA//82ADgAaQBuAIgAjwCGAIkAXQBdAB0AHgDf/+H/u/+7/77/ 
echo v//e/+L/AgAEAA8ADQD8//r/2//Y/8v/xf/W/9P/8//3/x0AHwBGAEIAUgBOAEEA 
echo PgAoACEAEgAIAAoAAgAXABIAJAAjAB4AHQAGAAEA4P/Y/7v/tv+q/6r/rv+w/8T/ 
echo xv/k/+f//v8AAAwACwAQAA4ACwAJAAUABAAMAA4AJwAsAFIAVwB/AIMAmACbAI0A 
echo jgBiAGEAJwAqAO3/9P++/8H/mP+W/3b/dP9Y/1r/T/9R/2X/Yv+T/4//y//N//3/ 
echo BgAnAC8ASwBLAGgAZgCFAIgAnQCiAJsAnwB3AHgAPQA8AAMAAwDf/+L/0v/V/8// 
echo 0P/M/83/v//B/6X/pv+H/4b/bf9v/2v/b/+Q/47/zf/F/woABQBAAEAAZgBlAHIA 
echo bgBvAGoAZQBjAGEAYwBqAG4AcgBxAF0AWAAkACIA2P/b/5b/mf92/3b/d/93/4b/ 
echo iP+X/5n/qP+o/67/sP+u/7P/wv/I//j//v9GAEsAmQCcANAAzwDVANIAsgCyAHgA 
echo fAA3ADkABgACAOv/5v/i/+L/2f/b/7L/r/9q/2b/Jv8m/wn/D/8n/yv/ef91/+H/ 
echo 2f8+ADsAfgB/AJgAlwCZAJcAogCnAMUAzQDtAOwA7wDpALsAugBZAGAA3//m/2j/ 
echo af8O/wr/3P7b/tr+3f4A/wH/Mv8t/17/Wv+Q/5H/0f/W/x8AIgB5AHkA1QDSABkB 
echo FQEwATABHQEfAeUA5ACSAI8APQA9APf/9/+1/6//bv9o/yf/Kv/y/vj+3/7d/uz+ 
echo 6P4c/x7/d/96/+r/6v9VAFIApQCjANQA0QDjAOIA4QDiANYA1QC/AL0AogCjAHsA 
echo fgA/AEAA9P/z/6f/qf9j/2b/Nf80/xv/GP8N/w7/D/8R/y3/LP9h/17/pP+h//T/ 
echo 8v9NAE8AowCoAPAA8gAoASUBPQE5ATMBMAETAREB1ADQAHAAbQD5//j/hv+B/x// 
echo Gv/N/sv+nf6c/pz+mP69/rv+7f7y/ir/MP99/3z/5v/h/1wAXADPANEALgEsAW4B 
echo awGFAYkBcQF5ATMBNwHMAMoASwBIAL//v/83/zz/yv7Q/or+jP6B/n3+rf6o/vr+ 
echo +f5b/1n/yP/D/zAALQCFAIUAyQDJAAAB/wAqASkBRwFDAUoBRAEmASUB3gDgAIAA 
echo gAAUABMAnv+g/zT/Nf/m/uP+tP60/qT+qf64/r7+4P7k/hX/Gv9f/2P/v//B/y0A 
echo LwChAKQACgEKAVYBVAF6AXoBegF7AV8BXgEpASkB0QDRAFQAUQC4/7j/H/8j/6z+ 
echo sP5v/m3+Yf5c/nb+c/6m/qT+7v7s/kv/S//G/8X/VwBSAN0A2wBFAUsBjAGTAaoB 
echo qwGZAZgBWgFcAfIA9ABtAG0A5P/j/2b/aP8A/wL/s/6z/oH+f/5t/mv+g/6A/sb+ 
echo xf4w/zH/tf+4/0IARAC6ALkADQEIAUUBPwFqAWgBfQF8AXYBcgFEAUAB4ADhAFUA 
echo WAC2/7X/G/8Y/6P+o/5i/mT+Xf5g/or+jv7S/tT+Kv8o/5H/jP8AAP//bgB1ANkA 
echo 4wA7AUEBhwGJAagBrgGVAZ4BTwFSAd0A1wBPAEwAw//K/1X/XP8F/wb/0v7Q/rr+ 
echo uP6x/q7+tv61/tn+2/4j/yT/i/+J/////v9uAG8A1ADTACsBKQFgAWEBawFrAVAB 
echo SwEOAQoBswC0AFMAUgDs/+j/ef96/wr/D/+x/rb+f/6E/oH+iP68/sH+Iv8j/5r/ 
echo m/8NABEAbwBzAMIAwwACAQIBJAEkASgBKQEVARkB7gDvALkAtQBxAGsACAAIAJP/ 
echo k/8w/yr/6P7i/sT+xP7N/s3+8/7t/iT/Hv9a/1n/nf+a//X/8P9hAGEAzQDRACcB 
echo JQFgAVkBaAFkAUEBQQH4APgAmQCVACcAJAC1/7X/Vv9Z/xb/GP/3/vb+7f7s/vT+ 
echo 9v4U/xf/Sf9G/4f/gf/T/8//KgAnAHwAeADCALwA8gDsAAkBBgEJAQwB7gD1ALoA 
echo vwB4AHYAKgAnANv/3f+W/5v/WP9c/yb/Kv8I/w3//P7//gj/B/8x/y3/cv9y/8P/ 
echo yv8bACMAbwByALIAsQDeAN8A/AD+AA4BDQEGAQUB4wDmAKgArABRAFEA5f/i/3H/ 
echo bv8O/wr/0f7P/r/+wv7Y/tr+EP8N/07/S/+P/47/2P/Z/ykALACGAIoA5wDpAC4B 
echo LQFIAUcBNAE0AfYA+ACmAKcAWABXAA4ADADF/8P/ev94/zL/L//2/vH+yf7G/rj+ 
echo tf7S/sz+Fv8R/3r/eP/y//D/bABpANAA0gAQARgBMwE4AToBOQEhAR4B7ADpAKAA 
echo nwA9AD8A0v/T/3H/bv8r/yj/C/8M/w3/Dv8d/x//Nv86/1T/Vv98/33/u/+8/w0A 
echo DQBuAGkA0QDMABgBGAExATIBIwEdAfMA6wCuAKsAZQBnAB8AIgDU/9X/gf9+/yj/ 
echo JP/U/tb+nP6h/pb+mf7G/sf+H/8j/5P/mP8RABIAhACDAOMA5QArATEBVgFaAV0B 
echo XQFEAT8BDAEEAbEArAA7ADwAxf/K/2v/bP8u/yv/BP8B/+v+6v7g/t3+3v7c/vH+ 
echo 8/4n/yv/g/+D/////f+HAIcA/gD+AFEBTwF0AXUBYwFoAS4BMAHeAN0AeQB6ABIA 
echo GQC1/77/Xf9j/wj/Df/C/sb+m/6f/qT+pv7Z/tr+LP8t/47/kf/w//H/SgBIAJYA 
echo lgDTANUABAEHASkBKAEuASwBDQEPAckA0AB0AHoAGwAcAMH/wP9r/23/KP8r/wH/ 
echo A//+/vz+Gv8U/z//N/9q/2j/pP+n/+n/7P83ADYAgwCDAMcAyAADAQIBJwEiARwB 
echo FQHrAOUAqACmAF0AXwAUABMAyf/G/3n/ev8x/zT/+P72/s7+x/62/rH+wv7A/vv+ 
echo +P5S/0//vP+8/y8AMgChAKUACAEOAVQBWQFyAXIBagFoAUUBRAH/AP4AoACdACsA 
echo JwCv/63/Tv9Q/xX/Gf/9/v3+/f75/gX/AP8S/xD/Lv8s/1b/Vv+R/5T/6f/r/0cA 
echo RgCOAI4AtwC4AMkAygDQAM4A0ADLAMUAvwCrAKgAewB9AEAAQAD6//j/pv+n/1r/ 
echo W/8r/yr/Hv8c/zH/M/9Z/1v/gf9//6n/pP/S/9H/AAACAD8AQQCOAI0A2wDWAAsB 
echo CAEFAQMBxwDEAHAAbQAZABwA0v/W/5//oP93/3f/Vv9X/zz/Pf8m/yj/IP8i/0T/ 
echo Q/+Z/5b/CgALAHQAeAC6ALoA1QDUANIA1gC9AMIAoACfAIoAhQB5AHUAWgBZACQA 
echo JwDZ/97/jP+N/0//Tf8o/yn/Gf8a/yb/JP9H/0f/d/94/67/qP/i/9f/GQAUAF4A 
echo YQCvAK4A7wDsAAABAAHcAN0AlgCVAD4AQADs/+//tv+0/6D/nP+h/6H/q/+u/7L/ 
echo sv+v/7D/rP+w/7H/tP+9/73/xP/I/8//1f/t//D/EwASADIAMABJAEsAXgBjAHcA 
echo fQCTAJYAmgCbAHwAfwBBAEUA+P/5/6v/qP9i/2H/Nv83/zn/Of9i/2H/nP+c/9n/ 
echo 3P8RABcARABJAHAAcQCIAIkAjwCTAJEAlgCRAJMAewB+AD8AQwDr/+//nP+i/2P/ 
echo av9N/0//Wf9X/3j/ev+q/7H/3f/g//H/7f/u/+v/9f/3/xUAGABMAE4AiACGAK4A 
echo pwC0ALAAlgCWAFgAVwAUABAA4//f/8//zf/R/87/yv/H/63/rf+J/4j/bP9o/2P/ 
echo Xv92/3X/qP+p//H/8/83ADgAYwBhAG8AawBlAGMAWwBZAF4AXABrAGgAeAB1AHcA 
echo cwBbAFkAKQAoAOT/4/+V/5T/YP9g/1n/VP9s/2H/hP99/5n/m/+u/7D/yf/G/+v/ 
echo 6v8WABgAUQBSAJUAkwDAAL0AugC5AIYAigBBAEUACQAGAOX/3//L/83/wf/J/8r/ 
echo 0P/Y/9b/2f/V/8r/x/+y/7H/ov+j/6n/qv/A/8H/5f/m/xkAGABKAEMAYABcAFwA 
echo XwBUAFQAVgBSAF8AXABaAFoAPAA5AAgAAQDJ/8b/kP+R/23/bf9t/2n/jf+J/8T/ 
echo wv/7//3/HAAiACQAKgAiACQAHgAbAB4AGwAqACgAOwA8AEkASwBIAEkAKAArAPn/ 
echo /v/c/97/2P/W/+X/5P/2//f//P/7//D/7P/Y/9T/wP++/7j/uf/M/87/+P/6/ywA 
echo LABPAE8AVgBVAEMAPgAkABwACwAFAAAA/f8AAAQACQAQABAAEQAFAAMA5//q/8P/ 
echo yf+z/7f/vv+//9H/0f/k/+T/9P/y//b/9v/v//j/6v/2/+7/9f8MAAoAPAA3AGYA 
echo YgB4AHsAbABzAEoAUAAiACQA/f///+L/5//X/93/0//X/87/0P/A/8L/rf+x/6v/ 
echo r/+7/7z/z//O/+P/6P/z//7//P8DAAYABgAOAA4AFQAXACUAJgA4ADsARwBPAEwA 
echo VgBEAEcAMgAuABYAFAD3//r/4//l/9//3P/k/97/9f/u/wcABAALAA0ABgAHAP3/ 
echo /P/w//D/5P/l/97/2//b/9b/1v/V/9H/0f/R/9H/2//b//H/8v8VABUAPQA7AFUA 
echo UgBWAFIAQwBCACIAIgD8//r/3P/Y/8f/w/+//73/xP/G/8//1P/b/9//6f/p//n/ 
echo 9f8TAA0APAA0AGMAXwB8AHwAhAB/AGsAZAAxADAA8//y/8T/wP+r/6j/p/+o/7H/ 
echo sf/A/7r/x//C/8b/x//I/8n/1v/Q/+3/6/8OABEALwAsADwANQAuACwAFgATAAUA 
echo AAALAAgAKwArAFgAVAB2AHEAdAB0AFAAVQARABUAz//Q/6H/ov+L/4z/h/+G/43/ 
echo iv+S/5D/lv+V/6H/of/A/8L/9v/2/zwANwB/AH0AqgCvALIAtwCaAJkAaQBmADIA 
echo MgAIAAkA7f/t/+H/4f/h/+T/3f/h/8z/z/+3/7T/nf+V/4P/gP9+/4D/mv+a/8// 
echo zf8GAAgALwAzAEkASgBPAFMASABOAE8AUABlAGIAcQB0AG8AeABXAF4AJgApAOf/ 
echo 6f+m/6j/c/9z/1r/Xf9c/2L/fv9+/63/qf/Q/9b/8P/6/xMAFgAtADEASABNAGMA 
echo ZQBzAHMAdAB2AF4AXQAzAC8ADAAKAPT/9//z//f/CAAHABkAFwAdABwADgAPAOb/ 
echo 5/+5/7f/mv+Y/5H/k/+m/6f/y//M/+v/8P8GAAoAFwAXABsAGQAhABwAKgAoADMA 
echo NAA5ADYAKwAoAAgACADi/+H/xv/I/8D/xf/T/9T/7f/u/wIABwAPAA8ADQAIAAQA 
echo AwAEAAYAFgAYADIANABNAFAAWwBgAFQAVgA3ADIACwAIAN3/4f+9/7//sP+w/7T/ 
echo tv+9/8H/vf+//7f/s/+x/6z/tP+z/9T/0P8TAAwAVQBXAIcAiACeAJQAiACAAFYA 
echo VQAmACYABgAFAPb/9f/o/+f/zP/P/67/tP+X/5r/hf+K/4z/j/+t/6r/1//U/wIA 
echo AgAmACcAPQA8AEoARwBRAE8AWABXAGQAYABoAGMAXABbAEMARAAfABoA8v/n/8H/ 
echo vP+e/6D/jf+O/3//gP94/3f/hP99/5z/l/+9/7//8v/w/zAAKgBoAGYAlQCXAK4A 
echo sgCvALUAngCgAHsAeABGAEgAEQAXAOH/6P+3/7r/k/+P/3L/a/9W/1f/UP9W/2X/ 
echo Zv+K/4L/tv+t/97/3f///wQAJgAoAFEATQB0AG8AjwCMAKIApACoALAAogCsAI8A 
echo kgBpAGUAMgAuAPD/7/+s/67/df95/1X/Wf9J/0r/R/9E/0v/SP9g/1//jv+P/9T/ 
echo 1P8pACUAfAB3ALcAuQDUANoAzwDRAK4ArgCAAIIAUABPACQAIQD3//j/w//E/5D/ 
echo jv9m/2f/Tf9P/03/TP9p/2z/nP+k/9j/2v8GAAMAHgAdACkAKAAyADEASABGAG0A 
echo aQCTAJMArQCwAKsAqgB/AHsANAAuAN7/1v+X/5P/dv90/3f/c/+E/4T/kf+U/5z/ 
echo m/+m/6X/tv+7/93/4P8hABsAaQBlAJwAowCtALUAmACXAGkAZAA0AC8ABQAFAOf/ 
echo 7v/e/+H/2f/V/8P/wf+c/5z/cf9v/1r/V/9l/2T/mP+Z/+z/7P9DAEIAhgCKAK0A 
echo sgCvALAAjgCOAF8AYwA6AD4AHwAfAP7/AgDT/9//qP+z/3//gP9b/1n/Tf9O/2L/ 
echo Zv+Y/6H/4P/n/yMAIQBSAE0AagBqAHoAfQCLAJAAlwCaAJMAkQCCAH4AYABfAC8A 
echo MAD1//X/uv+6/4r/j/9q/3H/Vf9V/0//R/9V/1D/Z/9s/4//lv/H/8b/BQAAAEMA 
echo QwB5AH4AnwCkALQAswCxAKoAoACbAIUAhgBbAGAAKgAtAPj/+P/H/8b/p/+k/5T/ 
echo lP+I/4r/iv+F/4z/iP+K/5D/lv+c/67/s//W/9v/DwAOAEEAPABgAF8AdAB1AH0A 
echo ggCBAIgAgACEAHMAdABcAFgAMwAtAPP/8v+u/6//dP9w/1H/Tf9Q/0//a/9q/5P/ 
echo kP/B/7v/6f/n/wsADAAsACoASgBIAGkAaQCJAIUAmgCZAJcAmwCEAIUAYQBdADIA 
echo LgABAP//2P/b/7r/vP+j/5z/hv9//1v/Wv83/zP/MP8r/1H/T/+g/5v/BwACAGkA 
echo aACzALIA1QDUAM8AzgC1AK4AjwCIAGYAZQBJAEYALQApAAgACwDh/+T/tP+z/4D/ 
echo fP9N/0n/Jv8n/yT/I/9H/0H/eP94/7f/u//5//v/LwAyAGIAYgCXAJEAyQDDAPgA 
echo 8wAPAQ4B+wD8ALwAvABUAFgA2//g/3j/df8z/y3/C/8L/wb/B/8Z/xr/N/87/2T/ 
echo bP+l/63/+v/9/1UAVgChAKIA1gDTAOoA6ADbAOAAtwC/AIsAkABbAFYAJgAfAOz/ 
echo 7f+y/7T/eP95/0H/RP8X/xj/Bv8D/w7/EP82/zj/f/+A/9v/3v83ADsAjQCOAMwA 
echo zADwAPMABAEHAQABAgHfAOEArQCrAGQAXgADAAMApv+q/2H/Yf87/zn/Of81/0n/ 
echo Rv9g/2H/fP95/5X/j/+w/67/2P/X/wcABgA3ADkAZwBnAIwAiwCjAKQArgCvAKoA 
echo qgCVAJUAaABpACoALADm/+v/ov+r/2z/cf9H/0b/M/8z/zv/Pf9h/2P/l/+b/9X/ 
echo 1/8NAA8AOQA/AGMAZwCNAI4AtQCyANMAzADYANMAuAC5AHgAegAlACsA2P/c/57/ 
echo mv95/3f/aP9p/2P/Yv9h/2H/Zf9k/2z/bf+B/4j/sP+0//f/8v9FAEEAhgCFAK0A 
echo rAC3ALUApACiAH0AfwBTAFQALAAoAAwABADp/+f/wf/H/6H/pf+L/4r/fv+A/4T/ 
echo hf+b/5j/uf+7/+T/5/8KAA0AJAAqAD4APgBNAEkAUQBTAFkAWwBfAFwAWgBXAE0A 
echo SQA0ADEAFQAUAPX/8//S/9H/tf+1/6X/oP+d/5T/oP+c/7H/sf/N/8z/7f/p/wUA 
echo AwAYABgAKgAsADsAPgBOAEwAVgBSAEYASQAsADIADwAUAPL/9f/l/+X/5P/n/+b/ 
echo 7f/k/+r/1f/Z/8H/wf+2/7T/tP+2/8T/xP/g/+D/+////xMAFgAmACcANwA1AEYA 
echo QABMAEoAUABSAFQAVwBUAFYATwBMADwAOgAXABwA7f/u/8H/vv+b/53/kv+S/6D/ 
echo nv+v/6//uP+4/7n/uv+7/7b/yf++/+P/4v8SABcAUABMAHsAeACMAIkAhAB9AGYA 
echo YQBBADwAHAAbAPr/AwDl/+r/2P/T/8b/xf+z/7P/of+e/5T/k/+U/5b/pf+m/8X/ 
echo x//w//L/HAAdAD8AQABaAFgAcABoAH8AegCHAIkAigCLAH4AfwBcAF4AIQAhANb/ 
echo 0/+R/4z/Yf9a/0T/RP9H/0n/Zv9i/4j/if+s/7L/2v/c/w8ADgBMAEgAhACCAKkA 
echo rAC4ALgAqACqAIEAhgBWAFYAKQAnAP///P/a/9f/tf+1/5H/j/9x/2v/Vv9U/0z/ 
echo Sf9Z/1P/fP96/7r/uf8LAAkAYwBjALAArgDdANoA5QDjAMsAzACVAJ4AVgBcABsA 
echo FgDh/9r/qf+m/3v/fv9h/2j/XP9f/2r/Z/+H/4X/rf+t/9f/1v8AAP//IwAjAEUA 
echo RQBjAGIAcwB1AHgAfgBzAHcAXABdADoAOwAVABUA7f/t/8v/zv+x/7b/nv+i/5n/ 
echo lf+V/5D/l/+W/6z/qv/O/8v/9//4/ykAKgBUAFcAcwB4AIIAhAB9AH0AbgBuAFgA 
echo VgA4ADcAFwAWAPL/7//G/8P/of+d/4X/gv93/3P/gP96/5b/k/+z/7P/1v/X//P/ 
echo +f8QABcALwA0AEkATgBhAGcAdAB6AHwAfgB5AHYAawBpAFUAVAA6ADgAGAAXAO// 
echo 6f++/7X/h/+G/13/YP9N/03/W/9b/4X/h/+//8H/9//6/yYAKwBHAFAAWgBgAGUA 
echo ZQBjAGgAWQBhAEgASwAtAC8AEAAQAPj/9f/r/+j/6v/m/+v/5v/n/+X/1//a/7r/ 
echo w/+f/6j/lP+Y/6D/of/K/8v/CAALAEsAUwCGAJAApgCtAKUApwCKAIcAWgBVACQA 
echo HgD0/+7/yf/H/6b/pf+L/4z/dP96/2r/cf9v/3X/hP+I/6f/qP/P/8//9//6/yEA 
echo JgBIAFAAbAB1AI8AkQCmAKAAqwCeAJgAjABvAGkAOAA2APn/+/+4/73/gf+F/1z/ 
echo X/9P/1L/Yf9i/5D/j//N/8v/CAAIADMANQBLAE0AUgBVAFAAVQBPAFIAUQBSAFEA 
echo UQBHAEYALwAuAA4ACgDp/+H/wv+8/6T/ov+R/5P/iv+P/5L/lP+l/6b/xP/E/+j/ 
echo 6f8OABMAMwA6AFMAWABrAGwAeAB1AHcAcgBpAGQATgBLACsAKgAGAAYA5P/k/8n/ 
echo yv+1/7n/qv+u/6X/qP+o/6f/sP+s/73/uv/Q/9D/6P/r/wMABwAgACEAOQA2AEsA 
echo RgBVAFEAVQBVAE0AUAA/AEIALgAvABwAGQAIAAQA9P/w/93/3P/G/8j/s/+2/6j/ 
echo q/+p/6z/t/+4/8z/y//h/9//8f/v//r/+/8CAAkAEgAeAC4AOwBSAFsAbwBzAHkA 
echo eQBoAGcAQgBCABUAFgDw//H/2//a/9T/0v/T/8//zP/J/73/vP+r/6v/oP+f/6X/ 
echo of+9/7f/4f/b/wgABgArACsARABEAFIAUABVAFEATgBKAEAAPwAsAC0AFQAXAAAA 
echo AADt/+7/4P/i/9v/3f/a/9v/3P/b/93/2//d/9v/3//d/+X/4//w/+//AAABABIA 
echo FQAjACgAMQA0ADsAOQA/ADoAPgA5ADcANQApACsAFgAZAPv//v/b/97/vP++/6X/ 
echo pv+c/53/n/+k/67/tP/B/8f/1f/Y/+n/6v/+/wEAGAAeADYAPQBUAFgAaQBnAGsA 
echo ZQBaAFUAPwA+ACUAJwATABYABgALAPr/AwDo//P/0P/Z/7f/uf+k/6D/nv+Z/6j/ 
echo qP/C/8j/4v/r/wAACAASABsAGwAjACEAKAArADAAOwA+AE0ATwBWAFsAUgBXAD0A 
echo PgAaABQA8f/n/83/w/+0/6//qf+p/6n/q/+t/7D/tP+2/7//vv/Q/87/6v/o/wsA 
echo DQAvADQATwBVAGQAaABqAG0AYABkAEwAUwAzADsAGgAhAAQABgDv/+7/2f/X/8L/ 
echo wP+q/6b/l/+P/4v/hP+P/43/p/+s/9L/2P8IAAkAOwA0AF4AVABxAGgAegBzAH8A 
echo eACAAHcAdQBuAFgAVAAmACUA5//k/6f/oP9y/2r/VP9O/1H/UP9o/2r/kv+S/8X/ 
echo w//6//j/LQAtAFoAXAB9AIAAkACUAJIAlgCEAIUAaABiAEAANQARAAQA3//W/7P/ 
echo rv+T/5D/gP98/3v/dv+B/4D/lv+Y/7r/v//t//L/KAAsAGAAYwCHAIgAlwCTAIsA 
echo ggBqAF8APwA2ABUAEQD1//X/3//f/87/zf+8/73/q/+u/6L/pv+m/6j/uP+2/9D/ 
echo 0P/q/+3/AQAHABUAGAAnACIANAAsAD4ANwBFAEMARwBKAEMARwA2ADoAIAAjAAQA 
echo BgDp/+r/1P/T/8b/xP+//77/vf+9/77/vf/B/7//yP/F/9X/0//q/+v/CAAKACoA 
echo KwBMAEoAZQBgAHEAaABsAGIAWABPADoANAAXABUA8f/1/8//1f+0/7j/o/+j/57/ 
echo m/+m/6L/uf+4/9j/2f/8//3/HgAdADYAMQA/ADcANwAwACQAIgAQABEAAAADAPr/ 
echo +P/6//P//v/1/wQA/f8KAAcAEAAQABQAEwATABIACwANAP7/BADu//j/3//q/9P/ 
echo 2//L/9H/y//P/9T/1v/n/+X/AQD6/xsAEQAvACcAOgA3ADwAPwA3AD4ALgA1ACIA 
echo JQAQABAA+P/3/9v/2v+//8H/rv+w/7D/r//C/77/3f/a//n/+v8RABUAIwAqADMA 
echo NgBAAD8ASQBFAEoASABCAEMALwAxABQAEwD3//H/2//U/8b/wf+6/7j/t/+2/7r/ 
echo uP/B/7z/y//F/9r/1v/v/+7/CAAKACAAJAAyADYAOgA7ADkANgA1AC8ANAAuADYA 
echo NAA5ADwANwA6ACgAKQAKAAcA4//g/7//v/+p/7D/q/+0/7//yP/Z/9//7//y//z/ 
echo /v8EAAYADQAQABsAHQArACsAMwAzADEALwAiAB8ADAAHAPb/8v/n/+b/4P/k/+H/ 
echo 5//k/+j/5f/l/+H/4P/c/93/3f/f/+n/6/8AAAAAHAAaADMAMwBBAEMARABGAD8A 
echo PwA1ADIAJwAhABQADwD+//v/6P/m/9H/z/+8/7n/rf+r/6v/qv+4/7b/z//O/+n/ 
echo 6P//////DwAQAB4AHAAtACkAPQA3AEkARQBRAE4AUQBQAEkASAA5ADgAIgAiAAUA 
echo BgDm/+f/yP/H/6//q/+e/5n/l/+U/5//nP+0/7D/z//L/+v/5/8BAAEAFAAYACcA 
echo LgA+AEMAVQBZAGcAawBqAHAAXABjAD8ARQAZABwA8v/y/8//z/+6/7r/tv+2/7// 
echo vP/K/8X/z//I/8v/xf/G/8L/y//K/+L/4f8HAAYAMQAvAFQAUwBoAGgAZwBnAFEA 
echo VAAzADcAFwAbAAIABgDz//X/4v/j/8v/zP+y/7L/oP+g/5//nf+z/7H/2f/a/wcA 
echo DAAxADgASQBPAE4AUQBFAEUANQA0ACcAJgAeAB8AGQAZAA0ADAD0//P/0P/Q/6v/ 
echo rf+U/5f/lv+Z/7D/s//U/9j/9v/7/xEAFAAiACIAKgAoADIAMABBAEAAUwBUAFwA 
echo XgBYAFoARwBJACoAKwAFAAYA4//l/83/z//B/8L/vP+8/7z/u/+9/7r/uv+4/7j/ 
echo uf/B/8T/1//b//j/+/8dAB0APAA5AE4ASQBRAE0ATABJAEQAQQA4ADQAKQAkABcA 
echo EgAAAP7/5//n/87/zv+7/7j/sf+t/7L/rv+5/7b/xv/G/9z/3v/6//z/FgAXACwA 
echo KgA5ADYAPwA8ADwAOwA2ADkAMgA2AC8AMwAsAC4AKAAoAB0AGwAHAAUA7P/q/9X/ 
echo 0v/D/7//tP+v/6z/qf+u/6//uf+7/8v/zv/l/+X/AAD+/xgAFQArACgANwA2ADsA 
echo PAA7AD0AOwA9ADwAPQA8AD4AOQA7AC0ALwAWABgA+v/7/9v/2v+3/7f/mv+b/5H/ 
echo lP+b/5//rv+w/8b/xv/l/+P/BgAEACUAJABFAEYAYwBmAHcAegB9AH8AdgB3AFoA 
echo WgAsACsACAAGAA== 
echo -----END CERTIFICATE----- 
)>>t.tmp
certutil -decode t.tmp tick.wav >nul
del /f /q t.tmp
goto backtick



:nocmd
echo -----BEGIN CERTIFICATE-----  >cmd.temp
(echo TVqQAAMAAAAEAAAA//8AALgAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAgAAAAA4fug4AtAnNIbgBTM0hVGhpcyBwcm9ncmFtIGNhbm5v 
echo dCBiZSBydW4gaW4gRE9TIG1vZGUuDQ0KJAAAAAAAAABQRQAATAEIAGcS7FcAlgAA 
echo kwYAAOAABwMLAQIZAFgAAACSAAAABgAA4BQAAAAQAAAAcAAAAABAAAAQAAAAAgAA 
echo BAAAAAEAAAAEAAAAAAAAAADwAAAABAAApjUBAAMAAAAAACAAABAAAAAAEAAAEAAA 
echo AAAAABAAAAAAAAAAAAAAAADAAAAgDQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAE4AAAGAAAAAAAAAAAAAAA 
echo AAAAAAAAAABgwgAA1AEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC50ZXh0AAAA 
echo tFcAAAAQAAAAWAAAAAQAAAAAAAAAAAAAAAAAAGAAUGAuZGF0YQAAADQAAAAAcAAA 
echo AAIAAABcAAAAAAAAAAAAAAAAAABAADDALnJkYXRhAADUHAAAAIAAAAAeAAAAXgAA 
echo AAAAAAAAAAAAAAAAQABAQC5laF9mcmFtOAcAAACgAAAACAAAAHwAAAAAAAAAAAAA 
echo AAAAAEAAMEAuYnNzAAAAAAQEAAAAsAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAGDA 
echo LmlkYXRhAAAgDQAAAMAAAAAOAAAAhAAAAAAAAAAAAAAAAAAAQAAwwC5DUlQAAAAA 
echo NAAAAADQAAAAAgAAAJIAAAAAAAAAAAAAAAAAAEAAMMAudGxzAAAAACAAAAAA4AAA 
echo AAIAAACUAAAAAAAAAAAAAAAAAABAADDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAPPDjbQmAAAAAI28JwAAAACD7BwxwGaBPQAAQABNWscF 
echo jLNAAAEAAADHBYizQAABAAAAxwWEs0AAAQAAAMcFPLBAAAEAAAB0aKMIsEAAoZiz 
echo QACFwHRKxwQkAgAAAOj6LgAAxwQk/////+hyIQAAixWos0AAo+SzQACj6LNAAKFQ 
echo w0AAiRDoRh4AAIM9HHBAAAF0bTHAg8Qcw420JgAAAADHBCQBAAAA6LAuAADrtGaQ 
echo ixU8AEAAgboAAEAAUEUAAI2KAABAAHWAD7dRGGaB+gsBdD9mgfoLAg+Fav///4O5 
echo hAAAAA4Phl3///+LkfgAAAAxwIXSD5XA6Uv///+NdgDHBCRgMUAA6EQgAAAxwIPE 
echo HMODeXQOD4Ys////i4noAAAAMcCFyQ+VwOka////ZpCD7CyhgLNAAMdEJBAAsEAA 
echo x0QkCBCwQADHRCQEFLBAAMcEJBiwQACjALBAAKE4sEAAiUQkDOj6LQAAg8Qsw2aQ 
echo VTHAuREAAACJ5VdWjVWkU4nXg+x886u4MAAAAOh/LAAAKcSNRCQbg+DwxwDMzMzM 
echo x0AEzMzMzMdACMzMzMzHQAzMzMzMx0AQzMzMzMdAFMzMzMzHQBjMzMzMx0AczMzM 
echo zIPk8Is1mLNAAIX2D4WOAgAAZKEYAAAAMfaLWASLPQTDQADrFDnDD4QVAgAAxwQk 
echo 6AMAAP/Xg+wEifDwD7Ed7LNAAIXAdd6h8LNAADHbg/gBD4T+AQAAofCzQACFwA+E 
echo TQIAAMcFBLBAAAEAAACh8LNAAIP4AQ+E8wEAAIXbD4QRAgAAoYiYQACFwHQcx0Qk 
echo CAAAAADHRCQEAgAAAMcEJAAAAAD/0IPsDOgSIQAAxwQkYDZAAP8VAMNAAIPsBKOs 
echo s0AAxwQkABBAAOjxLAAA6BwfAAChRMNAAMcF3LNAAAAAQACLAIXAdFsxyesUjXYA 
echo hNJ0LIPhAXQnuQEAAACDwAEPthCA+iB+54nLg/MBgPoiD0TL6+iNdgCNvCcAAAAA 
echo hNJ1EesZjXYAjbwnAAAAAID6IH8Kg8ABD7YQhNJ18aPYs0AAix2Ys0AAhdt0FvZF 
echo 0AG4CgAAAGYPRUXUD7fAowBwQAChGLBAAIlFkInGjQSFBAAAAIlFjIkEJOiUKwAA 
echo hfaJRZSLPRSwQAAPjkMBAAAx24n+iwSeiQQk6CwrAACNeAGJPCToaSsAAItNlIkE 
echo mYsMnoPDAYl8JAiJBCSJTCQE6EUrAAA5XZB1yYtFjIPoBIt1lMcEBgAAAACJNRSw 
echo QADo6RoAAKE0w0AAixUQsEAAiRChELBAAIlEJAihFLBAAIlEJAShGLBAAIkEJOj9 
echo KwAAiw0IsEAAowywQACFyQ+EtQAAAIsVBLBAAIXSdQroPysAAKEMsEAAjWX0W15f 
echo XcOh8LNAALsBAAAAg/gBD4UC/v//xwQkHwAAAOgbKwAAofCzQACD+AEPhQ3+///H 
echo RCQECNBAAMcEJADQQADo6SoAAIXbxwXws0AAAgAAAA+F7/3//4cd7LNAAOnk/f// 
echo iRQk/xW8wkAAg+wE6WH9///HBfCzQAABAAAAx0QkBBjQQADHBCQM0EAA6J0qAADp 
echo mv3//zHA6ff+//+JBCTocSoAAI22AAAAAI28JwAAAACD7AzHBZizQAABAAAA6A4a 
echo AACDxAzplvz//422AAAAAIPsDMcFmLNAAAAAAADo7hkAAIPEDOl2/P//kJCQkJCQ 
echo VYnlVlOD7BDHBCQAgEAA6KwqAACD7ASFwA+EsQAAAMcEJACAQACJw+h7KgAAg+wE 
echo o+CzQADHRCQEE4BAAIkcJOhrKgAAg+wIicbHRCQEKYBAAIkcJOhWKgAAg+wIowRw 
echo QACF9nQRx0QkBBywQADHBCQAoEAA/9ahMHBAAIXAdDrHBCRBgEAA6DQqAACD7ASF 
echo wLoAAAAAdBXHRCQET4BAAIkEJOgIKgAAg+wIicKF0nQJxwQkMHBAAP/SxwQk8BVA 
echo AOg6GAAAjWX4W15dw412AMcFBHBAAAAAAAC+AAAAAOuB6w2QkJCQkJCQkJCQkJCQ 
echo VYnlg+wYoQRwQACFwHQJxwQkAKBAAP/QoeCzQACFwHQLiQQk6LcpAACD7ATJw5CQ 
echo VlOD7DSLdCRAxwQk9f////8VwMJAAIPsBI1UJBqJBCSJVCQE/xWUwkAAg+wIg/4F 
echo dxP/JLVogEAAjbQmAAAAAA+/XCQmg8Q0idhbXsONdgAPv1wkJIPENInYW17DjXYA 
echo D79cJBqDxDSJ2Ftew412AA+/XCQcg8Q0idhbXsONdgAPv0QkJA+/XCQog8Q0KcOD 
echo wwGJ2Ftew4n2jbwnAAAAAA+/RCQmD79cJCqDxDQpw4PDAYnYW17DifaNvCcAAAAA 
echo VlOD7DSLdCRAi1wkRMcEJPX/////FcDCQACD7ASNVCQaiQQkiVQkBP8VlMJAAIPs 
echo CIX2dAcPv0QkHokGhdt0Bw+/RCQgiQODxDRbXsONdgBVV1ZTgeycAQAAiy3AwkAA 
echo i5wktAEAAIu0JLABAACLvCS4AQAAxwQk9f/////Vg+wEjVQkNokEJIlUJAT/FZTC 
echo QACD7AgPv0QkODnYD4zBAAAAidjB6B+EwA+FtAAAAA+/RCQ2OfAPjKcAAACJ8MHo 
echo H4TAD4WaAAAAZol0JC5miVwkMIPGAYPDAWaJdCQyxwQk9f///2aJXCQ0/9WD7ASN 
echo VCQux0QkDAAAAADHRCQIAQABAIkEJIlUJBCNVCRMiVQkBP8V5MJAAIPsFIP/AnQw 
echo g/8DdBAPvkQkTIHEnAEAAFteX13DD7ZEJE6BxJwBAABbXl/B+ARdw5CNtCYAAAAA 
echo D7dEJE6BxJwBAABbXl+D4A9dw7gZ/P//68CNtgAAAABVV1ZTg+xsi6wkgAAAAIuc 
echo JIgAAACNRCRKi7QkhAAAAIlEJASJLCT/FZTCQACJ2oPsCMHqHw+/RCRMhNIPhfIB 
echo AAA52A+M6gEAAInxD79UJErB6R+EyQ+F2AEAADnyD4zQAQAAi4wkkAAAAAHZOcgP 
echo jL8BAACLvCSQAAAAhf8PjrABAACLhCSMAAAAAfA5wg+MnwEAAIuMJIwAAACFyQ+O 
echo kAEAAIuUJJQAAAAxwIXSD5XAiceLhCSMAAAAweACiUQkPA+vhCSQAAAAiQQk6MIl 
echo AACFwInBiUQkNA+EVAEAAIuEJJAAAAAPt5QkjAAAAGaJdCRCiSwkZolcJETHRCQM 
echo AAAAAMHgEIlMJAQJwonwZgOEJIwAAACJzolUJAiJ9WaJRCRGidhmA4QkkAAAAGaJ 
echo RCRIjUQkQolEJBD/FeTCQACD7BSLhCSYAAAAx0QkOAAAAAAPtgCIRCQviUQkMDH2 
echo i4QklAAAAIXAD4WBAAAAD7ZcJC+E2w+2w3Q2i4wkmAAAAA++XLUAjVEBuQEAAADr 
echo DYPCAQ+2Qv8ByYTAdBM5w3Xvg8IBD7ZC/wnPAcmEwHXtg8YBObQkjAAAAH+jg0Qk 
echo OAEDbCQ8i0QkODmEJJAAAAB/i4tEJDSJBCToxSQAAIPEbIn4W15fXcONtCYAAAAA 
echo gHwkLwB0Jw++TLUAi4QkmAAAADtMJDCNUAF1C+ujZpCDwgE5yHSaD7YChMB18otE 
echo JDSJBCToeiQAADHAg8RsW15fXcO4/////+vxkI10JgCLVCQEhdJ4GIP6CY1CMH4V 
echo g/oPfwuNQjfDjbQmAAAAALgwAAAA88OJ9o28JwAAAABVV1ZTg+xciz3wwkAAi3Qk 
echo dItcJHiJ8MH4H/fQIcaJ2MH4Hw+31vfQIcOJ2GaJXCQQweAQCdCJRCQEi0QkcIkE 
echo JP/Xg+wIhcB0CIPEXFteX13DixXAwkAAxwQk9f///4n1iVQkLP/Sg+wEiQQkoZTC 
echo QACNTCQ6iUwkBIlEJCj/0IPsCA+3RCQ6i1QkLGY5xnwDjWj/xwQk9f/////Sg+wE 
echo jUwkOokEJIlMJAT/VCQog+wID7dEJDxmOcN8CIPoAWaJRCQQi0QkEA+37cHgEAnF 
echo i0QkcIlsJASJBCT/14PsCIPEXFteX13DkI20JgAAAABWU4tUJAyLRCQQidHGAFyD 
echo 4Q8Pt9mD6Qpmg/kFjXM3dgONczCLTCQUwekfO1wkHHUEhMl1S4nziFgBZsHqBIPi 
echo Dw+32oPqCmaD+gWNczB3A41zNztcJBh1F4TJdBPGQAJWxkADAFtew5CNtCYAAAAA 
echo ifHGQAMAiEgCW17DjXQmAMZAAXbrtI12AI28JwAAAABVVzHtVlOB7JwCAACDvCTE 
echo AgAAA4uEJLACAACLnCS4AgAAiUQkCA+EBwQAAI20JJAAAADHRCQEh4BAAIk0JOgx 
echo IgAAiTQkx0QkBI6AQADoeSIAAInGuAEAAACF9g+EtgMAAMcEJPX///+LPcDCQAD/ 
echo 14PsBI1UJHqJBCSJVCQE/xWUwkAAg+wID79EJHw52A+MjgMAAInaweofhNIPhYED 
echo AAAPv1QkejuUJLQCAAAPjG8DAACLjCS0AgAAwekfhMkPhV0DAACLjCTAAgAAAdk5 
echo yA+MTAMAAIuEJMACAACFwA+OPQMAAIuEJLQCAAADhCS8AgAAOcIPjCcDAACLjCS8 
echo AgAAhckPjhgDAABrhCS8AgAACg+vhCTAAgAAiQQk6IEhAACJwYlEJDS4AwAAAIXJ 
echo D4TiAgAAi4QkvAIAAMYBAMHgAolEJDwPr4QkwAIAAIkEJOhNIQAAhcCJRCQ4D4TB 
echo AwAAD7eEJLwCAACJdCRMiXwkSGaJRCQwuJg6AACZ97wkvAIAAInBi4QkwAIAAGaJ 
echo TCQiic+Z9/mJRCQoD7eEJLQCAABmiUQkRgOEJLwCAABmiUQkRIuEJLwCAAAPr8HB 
echo 4AKJRCRAi0QkOIlEJCQxwInGD7dEJEY5dCQoZolcJFxmiUQkWg+3RCREZolEJF4P 
echo hB4DAAAPt0QkIon6AdjB4hDHBCT1////ZolEJGAPt0QkMIPGAQnQiUQkLP9UJEiD 
echo 7ASLTCQsjVQkWolsJAyJBCSJVCQQiUwkCItMJCSJTCQE/xXkwkAAg+wUZgNcJCKL 
echo RCRAAUQkJDl0JCgPjXH///+DvCTEAgAAA4tEJDi9ChoAAIt0JEyLfCQ0x0QkKAAA 
echo AAAPlEQkIoPAAol0JDCJRCQsxgcAi1wkLDH26agAAACDvCTEAgAAAw+EoQEAAIuU 
echo JMQCAACF0g+FvAEAADxcD4S0AQAAD7cTiEQkYsZEJGMAZjnVD4R+AQAAgHwkIgAP 
echo hXMBAACLhCTQAgAAiRQkiUQkEIuEJMwCAACJRCQMi4QkyAIAAIlEJAiNRCRqiUQk 
echo BOha/P//jUwkYolEJAyJfCQIx0QkBJWAQACJPCSJTCQQ6D4fAAAPtyuDxgGDwwQ5 
echo tCS8AgAAfmYPtlP+O5QkyAIAAInQD4VF////g7wk0AIAAP8PtxN0EonRg+EPOYwk 
echo 0AIAAA+FJv///4O8JMwCAAD/dBaJ0WbB6QSD4Q85jCTMAgAAD4UG////xkQkYlzG 
echo RCRjLcZEJGQA6SP///+DvCTEAgAAA4l8JAgPhDoBAACLRCQwx0QkBKCAQACJBCTo 
echo 8B4AAINEJCgBi1wkPItEJCgBXCQsOYQkwAIAAA+PoP7//4tEJDiLdCQwiQQk6LIe 
echo AACLRCQ0iQQk6KYeAACJNCToxh4AADHAgcScAgAAW15fXcOBxJwCAAC4AgAAAFte 
echo X13DjbQkkAAAAMdEJASAgEAAiTQk6CoeAADp9Pv//4hEJGLGRCRjAI1EJGKJfCQI 
echo x0QkBJCAQACJPCSJRCQM6AAeAADpvf7//4O8JMQCAAABflCJwsZEJGJcxkQkY2fA 
echo 6gQPtsqD6gqJTCQkg8EwgPoFdweLTCQkg8E3g+APiEwkZA+2yIPoCjwFjVEwdwON 
echo UTeIVCRlxkQkZgAPtxPp/v3//41Q0ID6CQ+G5v3//zwgD4Te/f//icKD4t+D6kGA 
echo +hkPhs39///riYtEJDDHRCQEnIBAAIkEJOi2HQAA6cH+//+LhCTAAgAAmff/idDp 
echo 2Pz//4tEJDSJBCTohB0AALgDAAAA6d7+//+NtgAAAABVV1ZTg+xcizXAwkAAi1wk 
echo dMcEJPX/////1oPsBI1UJDqJBCSJVCQE/xWUwkAAg+wID79EJDw52A+MYgEAAIna 
echo weofhNIPhVUBAACLVCRwD79MJDrB6h+E0g+FQQEAADtMJHAPjDcBAACLVCR8Ado5 
echo 0A+MKQEAAItsJHyF7Q+OHQEAAItEJHADRCR4OcEPjA0BAACLfCR4hf8PjgEBAADH 
echo BCSAuwAA6LkcAACJx7gDAAAAhf8PhOsAAACLRCR8D7dUJHgx7WaJXCQ0A1wkfMcE 
echo JPX////B4BAJwg+3RCRwiVQkLGaJXCQ4ZolEJDIPt0QkeANEJHBmiUQkNv/WUotU 
echo JCyNXCQyiWwkDIl8JASJVCQIiQQkiVwkEP8V5MJAAIPsFA+3hCSAAAAAxwQk9f// 
echo /2aJRCQyD7eEJIQAAABmiUQkNA+3RCR4A4QkgAAAAGaJRCQ2D7dEJHwDhCSEAAAA 
echo ZolEJDj/1lGLVCQsiVwkEIlsJAyJVCQIiXwkBIkEJP8VJMNAAIPsFIk8JOjkGwAA 
echo McDpDgAAAIn2jbwnAAAAALgCAAAAg8RcW15fXcONdgBVV1ZTg+w8i3QkYA+/RCRQ 
echo D79UJFKLfCRUi0wkXIX2icV0LYnTweUHweMPCeuD+QIPhpoAAACD+QR1D4X/D4i9 
echo AAAAg8tAhfZ0GoPLAesVkInTweUKweMVCeuD+QJ2cYP5BHTX9sMguQEAAAB1CInZ 
echo weEZwfkfiUwkIDHJ9sMQD5XBiUQkCItEJGSJTCQcMcn2wwgPlcGJVCQMx0QkBKiA 
echo QACJTCQYMcn2wwQPlcGJBCSJTCQUMcn2wwIPlcGJTCQQ6L4aAACDxDyJ2FteX13D 
echo 98cBAAAAdAiD+QJ0M4PLAoPnAg+EXf///4nfg88Eg/kCdCmJ++lM////jbYAAAAA 
echo g8sg6T7///+QjbQmAAAAAIPLCoPnAg+EKv///4PLFOki////jbYAAAAAjb8AAAAA 
echo VVcxwFZTuf8AAAC+AQAAAIHsHAQAAIucJDQEAACNfCQUx0QkEAAAAADzq4XbjXwk 
echo EH9Q6ZkAAACQjbQmAAAAAIsqg8IEjYX//v7+99Uh6CWAgICAdOqpgIAAAInVdQbB 
echo 6BCDxQKJwgDCieq9MSAAAIPaA4PBAQH2OctmiSrGQgIAdE6FtCQwBAAAifp1sosq 
echo g8IEjYX//v7+99Uh6CWAgICAdOqpgIAAAInVdQbB6BCDxQKJwgDCieq4MCAAAIPa 
echo A4PBAQH2OctmiQLGQgIAdbKJPCToixkAAIHEHAQAAFteX13DjbYAAAAAjb8AAAAA 
echo U4PsKP8VnMJAAIXAdEKDfCQwZHc7icPHRCQE7P///4kEJP8VBMRAAIPsCA0AAAgA 
echo iUQkCMdEJATs////iRwk/xUgxEAAg+wMhcB1FI10JgAxwIPEKFvDifaNvCcAAAAA 
echo uGQAAAArRCQw2XwkHsdEJAwCAAAAx0QkBAAAAACJHCSJRCQUD7dEJB7bRCQU3A1w 
echo mEAAtAxmiUQkHNgFeJhAANlsJBzfXCQa2WwkHg+3RCQaD7bAiUQkCP8VHMRAAIPs 
echo EOuPjbYAAAAAjbwnAAAAAFVXMcBWU4PsfMdEBFgAAAAAg8AEg/gYcvD/FZzCQACF 
echo wInHD4TYAQAAiQQk/xX8w0AAg+wEhcCJww+EwgEAAIkEJP8VZMJAAIPsBIXAicUP 
echo hMsBAACLhCSQAAAAx0QkFBAAAAC+AQAAAMdEJBAAAAAAx0QkDAAAAADHRCQIAAAA 
echo AMcEJAAAAACJRCQE/xUMxEAAg+wYhcCJwolEJDgPhDYBAACNRCRYx0QkBBgAAACJ 
echo FCSJRCQI/xVswkAAg+wMhcAPhEkBAACDvCSgAAAA/w+EWwEAAIuEJKQAAADHRCQQ 
echo CAAAAMdEJAQAAAAAiUQkDIuEJKAAAACJRCQIi0QkOIkEJP8V8MNAAIPsFIXAD4T9 
echo AAAAiUQkBIlEJDyJLCT/FXDCQACJwY1A/4PsCIlMJECLVCQ8g/j9D4eTAQAAi4Qk 
echo pAAAAIlUJETHRCQgIADMAMdEJBwAAAAAx0QkGAAAAACJbCQUiUQkEIuEJKAAAACJ 
echo HCSJRCQMi4QkmAAAAIlEJAiLhCSUAAAAiUQkBP8VYMJAAIPsJIXAi0wkQA+UwA+2 
echo wInGiQwkiw1owkAAiUwkPP/Rg+wEi0wkPItUJESJTCQ8iRQk/9GD7ASLTCQ8i0Qk 
echo OIkEJP/Rg+wEiWwkBIk8JIstEMRAAP/Vg+wIiVwkBIk8JP/Vg+wIifCDxHxbXl9d 
echo w4PEfL4BAAAAW4nwXl9dw74BAAAAiw1owkAA67CNdgC+AQAAAIstEMRAAOu+jXYA 
echo i0wkXIuEJJwAAADZfCROD6/BiUQkPA+3RCRO20QkPNkFfJhAALQM3PlmiUQkTNkF 
echo eJhAANzC2crZbCRM25wkoAAAANlsJE6LlCSgAAAAhdJ+Xot0JGCLhCScAAAAD6/G 
echo iUQkPNtEJDze8d7B2WwkTNucJKQAAADZbCROi4QkpAAAAIXAD48b/v//ibQkpAAA 
echo AImMJKAAAADpCP7//412AL4BAAAAiw1owkAA6d3+///d2N3Yi0QkYImEJKQAAADr 
echo 0OsNkJCQkJCQkJCQkJCQkFVXuAQAAABWU7oGAAAAuQYAAAC7CAAAAL4IAAAAgeys 
echo BAAAvwgAAAC9EAAAAGaJRCQsuAgAAACDvCTABAAACWaJRCQ6uAUAAABmiVQkLmaJ 
echo RCQ8uAwAAABmiUwkMGaJRCQ+uAcAAABmiVwkMmaJRCRAuAwAAABmiXQkNGaJRCRC 
echo uAgAAABmiXwkNmaJbCQ4ZolEJES6DAAAALgSAAAAuRAAAAC7DAAAAL4MAAAAvxAA 
echo AAC9CgAAAGaJRCRSZolUJEa4AQAAAGaJTCRIZolcJEpmiXQkTGaJfCROZolsJFAP 
echo hgsAAACBxKwEAABbXl9dw+ijFQAAg/h/icYPj3ABAADHBCT1/////xXAwkAAg+wE 
echo iceNnCSoAAAAiXQkCMdEJAQAAAAAiQQkiVwkDOh3FQAAg+wQhfYPjh0BAACLhCTA 
echo BAAAiXQkGDHtid4Pt0SELGaJRCQeicPrF420JgAAAACDxQGDxgg7bCQYD4TpAAAA 
echo iwaJPCSJRCQE/xWMwkAAg+wIiYTsrAAAAGY7XgR10YuEJMAEAAAPt0SELmY5RgZ1 
echo v4nBxwQkJoFAAIlMJBj/FdjCQACD7ASFwInDD4SJAAAAx0QkBECBQACJBCT/FbjC 
echo QACD7AiFwInGdGMPt0QkHotMJBiNVCRUx0QkBFiBQADHRCRUVAAAAIlUJBiJbCRY 
echo ZolMJF7HRCRgMAAAAGaJRCRcjUQkaMdEJGSQAQAAiQQk6A4TAACLVCQYx0QkBAAA 
echo AACJPCSJVCQI/9aD7AyJHCT/FYDCQACD7ASJbCQEiTwk6CoUAACD7AiBxKwEAAAx 
echo wFteX13DjXYAjbwnAAAAAL5/AAAA6Yb+//+NtgAAAABVV1ZTvgEAAACD7ByLbCQw 
echo xwQkJoFAAP8V2MJAAIPsBIXAdFWJw8dEJARqgUAAiQQk/xW4wkAAg+wIhcCJx3Qt 
echo x0UAVAAAAMcEJPX/////FcDCQACD7ASJbCQIx0QkBAAAAACJBCT/14PsDCnGiRwk 
echo /xWAwkAAg+wEg8QcifBbXl9dw422AAAAAI28JwAAAABVV1ZTg+x8xwQkJoFAAP8V 
echo 2MJAAIPsBInGi4QkkAAAAMdEJASCgUAAiQQk6KwSAACFwA+EuAAAAI18JByJw4lE 
echo JAzHRCQIAQAAAMdEJARUAAAAiTwk6HISAACJHCToihIAAIX2dHzHRCQEQIFAAIk0 
echo JP8VuMJAAIPsCIXAicN0YostwMJAAMcEJPX/////1YPsBIl8JAjHRCQEAAAAAIkE 
echo JP/Tg+wMuwEAAACLfCQgKcPHBCT1/////9WD7ASJfCQEiQQk6KcSAACD7AiJNCT/ 
echo FYDCQACD7ASJ2IPEfFteX13DuwEAAADr4420JgAAAADHBCSFgUAAuwEAAADokxEA 
echo AIPEfInYW15fXcOQkJCQkFOD7Cih6LNAAIkEJOh/BAAAg/j/iUQkGA+EggAAAMcE 
echo JAgAAADoyhEAAKHos0AAiQQk6FkEAACJRCQYoeSzQACJBCToSAQAAIlEJByNRCQc 
echo iUQkCI1EJBiJRCQEi0QkMIkEJOjEEQAAicOLRCQYiQQk6CoEAACj6LNAAItEJByJ 
echo BCToGQQAAMcEJAgAAACj5LNAAOicEAAAg8Qoidhbw5CLRCQwiQQk/xVgw0AAg8Qo 
echo icOJ2FvDjXYAjbwnAAAAAIPsHItEJCCJBCToMf///4XAD5TAg8QcD7bA99jDkJCQ 
echo oQhwQACLAIXAdB+D7AxmkP/QoQhwQACNUASLQASJFQhwQACFwHXpg8QM88ONdCYA 
echo U4PsGIsdoGdAAIP7/3Qhhdt0DP8UnaBnQACD6wF19McEJCAuQADohf///4PEGFvD 
echo MdvrAonDjUMBixSFoGdAAIXSdfDryY12AI28JwAAAAChNLBAAIXAdAfzw5CNdCYA 
echo xwU0sEAAAQAAAOuUkJCQkP8lOMNAAJCQkJCQkJCQkJAxwMOQkJCQkJCQkJCQkJCQ 
echo VVdWU4PsLKEocEAAx0QkEAAAAADHRCQUAAAAAD1O5kC7dA/30KMscEAAg8QsW15f 
echo XcONRCQQiQQk/xXEwkAAg+wEi1wkEDNcJBT/FaTCQACJxf8VqMJAAInH/xXIwkAA 
echo icaNRCQYiQQk/xXcwkAAg+wEi0QkGDHYM0QkHDHoMfgx8D1O5kC7dBeJwvfSoyhw 
echo QACJFSxwQACDxCxbXl9dw7qwGb9EuE/mQLvr4Y10JgBVieWD7CjHBSCzQAAJBADA 
echo i0UEjVUExwUks0AAAQAAAMcEJAAAAACJFQSxQACj+LBAAKMss0AAi0UIo+ywQACh 
echo KHBAAIlF8KEscEAAiUX0/xUAw0AAg+wExwQkgJhAAP8VEMNAAIPsBP8VoMJAAMdE 
echo JAQJBADAiQQk/xUIw0AAg+wI6FUOAACQkJCQkJCQkJCD7ByLRCQkg/gDdBSFwHQQ 
echo uAEAAACDxBzCDACQjXQmAItUJCiJRCQEi0QkIIlUJAiJBCToWAkAALgBAAAAg8Qc 
echo wgwAjbYAAAAAjbwnAAAAAFZTg+wUgz0YcEAAAotEJCR0CscFGHBAAAIAAACD+AJ0 
echo EoP4AXQ6g8QUuAEAAABbXsIMALsw0EAAvjDQQAA53nTliwOFwHQC/9CDwwQ53nXx 
echo g8QUuAEAAABbXsIMAI12AItEJCjHRCQEAQAAAIlEJAiLRCQgiQQk6MQIAADrqGaQ 
echo McDDkJCQkJCQkJCQkJCQkIPsPKGUs0AA3UQkSN1EJFCFwN1EJFh0KdnKi1QkQN1c 
echo JBjdXCQgiVQkEItUJETdXCQoiVQkFI1UJBCJFCT/0OsG3djd2N3Yg8Q8w5CNdCYA 
echo i0QkBKOUs0AA6fYNAABmkIPsPLmMmEAAi0QkQIsQg+oBg/oFdweLDJWomUAA3UAY 
echo 3VwkIN1AEN1cJBjdQAjdXCQQi0AEiUwkCMdEJAScmEAAiUQkDKFYw0AAg8BAiQQk 
echo 6E8NAAAxwIPEPMOQkJCQkNvjw5CQkJCQkJCQkJCQkJCLRCQEw410JgCNvCcAAAAA 
echo i0QkBMOQkJCQkJCQkJCQkFOD7BihWMNAAMdEJAgbAAAAx0QkBAEAAACNXCQkxwQk 
echo wJlAAIPAQIlEJAzozAwAAItEJCCJXCQIiUQkBKFYw0AAg8BAiQQk6CAMAADoKwwA 
echo AOsNkJCQkJCQkJCQkJCQkFdWU4PsMIs1oLNAAIX2D47ZAAAAiz2ks0AAMduNVwSQ 
echo iwo5wXcOi3oEA08IOcgPgrIAAACDwwGDwgw583XiiQQkicboCAkAAIXAiccPhNgA 
echo AACLNaSzQACNHFvB4wIB3olGCMcGAAAAAOjyCQAAA0cMiUYEjUQkFMdEJAgcAAAA 
echo iUQkBKGks0AAi0QYBIkEJP8VGMNAAIPsDIXAdG2LRCQojVD8g+L7dDaD6ECD4L90 
echo LotEJCADHaSzQADHRCQIQAAAAIlEJASLRCQUiVwkDIkEJP8VFMNAAIPsEIXAdBWD 
echo BaCzQAABg8QwW15fwzHb6Ur/////FazCQADHBCQwmkAAiUQkBOiW/v//oaSzQACL 
echo RBgEiUQkCItHCMcEJPyZQACJRCQE6Hb+//+JdCQExwQk3JlAAOhm/v//jbYAAAAA 
echo VYnlV1ZTg+xMix2cs0AAhdt0DY1l9FteX13DkI10JgDHBZyzQAABAAAA6FEIAACN 
echo BECNBIUeAAAAwegEweAE6DwKAADHBaCzQAAAAAAAKcSNRCQfg+Dwo6SzQAC41JxA 
echo AC3UnEAAg/gHfqiD+AsPjmwBAACh1JxAAIXAD4WHAAAAodicQACFwHV+odycQAC+ 
echo 4JxAAIXAD4RJAQAAvtScQACLRgiD+AEPhQYCAACDxgyB/tScQAAPg1f///+JXcCL 
echo Bg+2VgiLfgSNiAAAQACLgAAAQACD+hCNnwAAQACJRcQPhBkBAACD+iAPhIgBAACD 
echo +ggPhFgBAACJVCQExwQkjJpAAOhY/f//vtScQACB/tScQAAPg/r+//+JXcSNdCYA 
echo i34EixaDxggDlwAAQACNhwAAQACJ0+iF/f//gf7UnEAAiZ8AAEAActeLXcShoLNA 
echo AIXAfxrpuf7//422AAAAAIPDATsdoLNAAA+NpP7//408W6Gks0AAjTS9AAAAAAHw 
echo ixCF0nTajU3Mx0QkCBwAAACJTCQEi0AEiQQk/xUYw0AAg+wMhcAPhOIAAACNRciJ 
echo RCQMoaSzQACLBLiJRCQIi0XYiUQkBItFzIkEJP8VFMNAAIPsEOuJifaNvCcAAAAA 
echo vtScQACLPoX/D4Ue////i04EhckPhKf+///pDv///w+3lwAAQACJ0A0AAP//ZoO/ 
echo AABAAAAPSNCLRcQpygHQiUXMidjol/z//w+3RcxmiYcAAEAAg8YMgf7UnEAAD4J8 
echo /v//i13AoaCzQADpAf///w+2E4nXgc8A////gDsAD0jXKcoB0IlFzInY6FH8//8P 
echo tkXMiAPrvYtFxCnIAwOJx4lFzInY6Db8//+JO+umiw2ks0AAAfGLQQSJRCQIi0EI 
echo i0AIxwQk/JlAAIlEJATorfv//4lEJATHBCRYmkAA6J37//+QkJCQkJCQkJCQkJCQ 
echo U4PsGItcJCCLA4sAPZEAAMB3TT2NAADAD4OyAAAAPQUAAMAPhecAAADHRCQEAAAA 
echo AMcEJAsAAADoHwgAAIP4AQ+EKgEAAIXAdC/HBCQLAAAA/9CDxBi4/////1vCBACQ 
echo PZQAAMB0KT2WAADAD4SpAAAAPZMAAMB0V6Gss0AAhcB0PYlcJCCDxBhb/+CNdCYA 
echo x0QkBAAAAADHBCQIAAAA6LgHAACD+AEPhKQAAACFwHTIxwQkCAAAAP/QuP////+D 
echo xBhbwgQAjXYAjbwnAAAAAMdEJAQAAAAAxwQkCAAAAOh4BwAAg/gBdcTHRCQEAQAA 
echo AMcEJAgAAADoXwcAAOhe+v//uP/////rto20JgAAAAA9HQAAwA+FXv///8dEJAQA 
echo AAAAxwQkBAAAAOgtBwAAg/gBdFyFwA+EPf///8cEJAQAAAD/0IPEGLj/////W8IE 
echo AMdEJAQBAAAAxwQkCAAAAOj3BgAAuP/////pUP///5DHRCQEAQAAAMcEJAsAAADo 
echo 2AYAALj/////6TH///9mkMdEJAQBAAAAxwQkBAAAAOi4BgAAuP/////pEf///5CQ 
echo VVdWU4PsHMcEJLizQAD/FXzCQACLHbCzQACD7ASLLQzDQACLPazCQACF23QojXYA 
echo iwOJBCT/1YPsBInG/9eFwHUMhfZ0CItDBIk0JP/Qi1sIhdt128cEJLizQAD/FdDC 
echo QACD7ASDxBxbXl9dw412AFZTMfaD7BShtLNAAIXAdRCDxBSJ8Ftew5CNtCYAAAAA 
echo x0QkBAwAAADHBCQBAAAA6HgGAACFwInDdEOLRCQgxwQkuLNAAIkDi0QkJIlDBP8V 
echo fMJAAKGws0AAg+wEiR2ws0AAxwQkuLNAAIlDCP8V0MJAAIPsBInwg8QUW17Dvv// 
echo ///rjI22AAAAAI2/AAAAAFOD7BihtLNAAItcJCCFwHUPg8QYMcBbw5CNtCYAAAAA 
echo xwQkuLNAAP8VfMJAAIsVsLNAAIPsBIXSdBeLAjnDdQrrTosIOdl0KInCi0IIhcB1 
echo 8ccEJLizQAD/FdDCQACD7ASDxBgxwFvDkI20JgAAAACLSAiJSgiJBCToZgUAAMcE 
echo JLizQAD/FdDCQACD7ATr0YtCCKOws0AAidDr2o10JgBTg+wYi0QkJIP4AQ+EjwAA 
echo AHItg/gCdBiD+AN1GKG0s0AAhcB0D+g1/v//6wiNdgDo2/f//4PEGLgBAAAAW8OQ 
echo obSzQACFwA+FhQAAAKG0s0AAg/gBdd6hsLNAAIXAdBGLWAiJBCTo2QQAAIXbidh1 
echo 78cFsLNAAAAAAADHBbSzQAAAAAAAxwQkuLNAAP8VeMJAAIPsBOueifaNvCcAAAAA 
echo obSzQACFwHQXxwW0s0AAAQAAAIPEGLgBAAAAW8ONdgDHBCS4s0AA/xXMwkAAg+wE 
echo 69foif3//+lx////kJCQkANAPIE4UEUAAHQGMcAPtsDDZoF4GAsBD5TAD7bAw2aQ 
echo i0QkBGaBOE1adAUxwMNmkOvOjbQmAAAAAI28JwAAAABWU4tUJAyLXCQQA1I8D7dy 
echo Bg+3QhSF9o1EAhh0GzHJkItQDDnadwcDUAg503IMg8EBg8AoOfF16DHAW17DjXYA 
echo VVdWUzHbg+wci3wkMIk8JOh3AwAAg/gIdwtmgT0AAEAATVp0C4PEHInYW15fXcOQ 
echo uAAAQADoRv///4XAdOehPABAAA+3kBQAQAAFAABAAA+3aAaNXBAYhe10JzH2jXYA 
echo x0QkCAgAAACJfCQEiRwk6BADAACFwHStg8YBg8MoOe513oPEHDHbidhbXl9dw2aQ 
echo MdJmgT0AAEAATVp0A4nQw1ZTuAAAQADo1P7//4XAdEqhPABAAItcJAwPt5AUAEAA 
echo BQAAQACB6wAAQAAPt3AGjVQQGIX2dCExyY20JgAAAACLQgw5w3IHA0IIOcNyDIPB 
echo AYPCKDnxdegx0onQW17DkDHSZoE9AABAAE1adAOJ0MO4AABAAOhm/v//hcB076E8 
echo AEAAD7eQBgBAAInQw412ADHSZoE9AABAAE1aU4tMJAh0DonQW8ONdgCNvCcAAAAA 
echo uAAAQADoJv7//4XAdOShPABAAA+3kBQAQAAFAABAAA+3WAaNVBAYhdt0HDHAjXYA 
echo 9kInIHQHhcl0uIPpAYPAAYPCKDnYdekx0onQW8ONdgAx0maBPQAAQABNWnQDidDD 
echo uAAAQADoxv3//4XAuAAAQAAPRdCJ0MOJ9o28JwAAAAAxwGaBPQAAQABNWnQDw2aQ 
echo VlO4AABAAOiU/f//hcB0SqE8AEAAi1wkDI2QAABAAA+3gBQAQACB6wAAQAAPt3IG 
echo jUQCGIX2dCAxyY22AAAAAItQDDnTcgcDUAg503ISg8EBg8AoOfF16DHAW17zw2aQ 
echo i0AkW1730MHoH+vwjXQmAFdWMfZmgT0AAEAATVpTi1wkEHQMifBbXl/DjbYAAAAA 
echo uAAAQADoBv3//4XAdOahPABAAI2IAABAAIuAgABAAIXAdNEPt3kGD7dRFIX/jVQR 
echo GHTBi0oMOchyBwNKCDnIchKDxgGDwig5/nXoMfaJ8FteX8MFAABAAHUM6++NdCYA 
echo g+sBg8AUi0gEhcl1B4tQDIXSdNeF23/oi3AMW4HGAABAAInwXl/DkJCQkJCQkJCQ 
echo UVA9ABAAAI1MJAxyFYHpABAAAIMJAC0AEAAAPQAQAAB36ynBgwkAWFnDkJD/JeDD 
echo QACQkP8l3MNAAJCQ/yXYw0AAkJD/JdTDQACQkP8l0MNAAJCQ/yXIw0AAkJD/JcTD 
echo QACQkP8lwMNAAJCQ/yW8w0AAkJD/JbjDQACQkP8ltMNAAJCQ/yWww0AAkJD/JazD 
echo QACQkP8lqMNAAJCQ/yWkw0AAkJD/JaDDQACQkP8lnMNAAJCQ/yWYw0AAkJD/JZTD 
echo QACQkP8lkMNAAJCQ/yWMw0AAkJD/JYjDQACQkP8lhMNAAJCQ/yWAw0AAkJD/JXzD 
echo QACQkP8leMNAAJCQ/yV0w0AAkJD/JXDDQACQkP8lbMNAAJCQ/yVow0AAkJD/JWTD 
echo QACQkP8lXMNAAJCQ/yVUw0AAkJD/JUzDQACQkP8lSMNAAJCQ/yVAw0AAkJD/JTzD 
echo QACQkP8lMMNAAJCQ/yUsw0AAkJBmkGaQZpBmkGaQZpCh1LNAAMONdgCNvCcAAAAA 
echo i0QkBIcF1LNAAMOQkJCQkP8l9MJAAJCQ/yXUwkAAkJD/JbjCQACQkP8ltMJAAJCQ 
echo /yWwwkAAkJD/JYjCQACQkP8lgMJAAJCQZpBmkGaQZpCNTCQEg+Tw/3H8VYnlV1ZT 
echo UYHseAsAAIsBi1kEicaJhdT0///ol+7//4P+AQ+OzwIAAIO91PT//wMPhFIBAADH 
echo RCQEwoNAAItDBIkEJOga/v//hcAPhXkBAACDvdT0//8CD4RcAQAAx0QkBOiDQACL 
echo QwiJBCTosv7//4XAicYPhLgDAADHBCQAAAAB6HT+//+FwInDD4SEAwAAjbYAAAAA 
echo iXQkCMdEJAQAAAABiRwk6ID+//+FwA+EtQAAAInaiwqDwgSNgf/+/v730SHIJYCA 
echo gIB06qmAgAAAdQbB6BCDwgKJwQDBidiD2gPGQv8AgDsidD/HRCQE6INAAIkEJOgp 
echo /v//hcCJx3SXiUQkDMdEJAgAAAABx0QkBAEAAACJHCTo9/3//4k8JOgP/v//6W7/ 
echo //+J2osKg8IEjYH//v7+99EhyCWAgICAdOqpgIAAAHUGwegQg8ICicEAwYnYg9oD 
echo gHr/Io1S/3WKxgIAjUMB64KJHCTom/3//4k0JDH26Ln9//+NZfCJ8FlbXl9djWH8 
echo w8dEJAS/g0AAi0MIiQQk6Cj9//+FwHV3x0QkBMKDQACLQwSJBCTosfz//4XAD4US 
echo AgAAxwQkyINAADH26BP9///rsMdEJAQhhEAAi0MEiQQk6Ib8//+FwA+FeQEAAIO9 
echo 1PT//wIPhBkBAACLQwiJBCTofvz//4XAD45SAQAAiQQkMfb/FQTDQABQ6WT////H 
echo RCQEwoNAAItDBIkEJOg6/P//hcAPhC3+///HRCQEIYRAAItDBIkEJOgf/P//hcB0 
echo qsdEJARBhEAAi0MEiQQk6Aj8//+FwA+EJQEAAMdEJAQdhUAAi0MEiQQk6O37//+F 
echo wA+FFAMAAIO91PT//wMPjvQCAACLQwgx9okEJOjj+///ZonGi0MMiQQk6NX7//8P 
echo t9bB4BCLPcDCQACJ1gnGi0MIib3Q9P//gDhrD4S+AwAAi0MMgDhrD4R5AwAAxwQk 
echo 9f////+V0PT//1GJdCQEiQQkMfb/FfzCQABTU+mC/v//xwQkoIFAADH26NX7///p 
echo b/7//8cEJCeEQAAx9ujC+///6Vz+///HRCQEnYVAAItDBIkEJOgy+///hcCJxg+F 
echo hgMAAIO90PT//wB0Cul2BAAA6AX7///oCPv//4XAdfIx9ukc/v//x0QkBEGEQACL 
echo QwSJBCTo8vr//4XAicYPhej+//+DvdT0//8CD4TnAAAAi1MID7YCPGgPhM8AAAA8 
echo cw+EqwAAADxjD4VRAgAAD7ZCATx4D4R2AgAAPHkPlMAPtsCNBICJBCToctL//4nG 
echo 6a79///HRCQEIYRAAItDBIkEJOiE+v//hcAPhCT////HRCQEQYRAAItDBIkEJOhp 
echo +v//hcCJxg+F+gEAAMcEJFCEQADoy/r//+ll/f//xwQkAIRAAOi6+v//iTQkvgIA 
echo AADoBfv//+lH/f//xwQk6oNAAL4BAAAA6Jf6///pMf3//w+2QgE8dw+E3QEAADxo 
echo D5TAD7bAjQRA6Vj///+4AQAAAOlO////iz3AwkAAxwQk9f/////XU42d6PX//4kE 
echo JKGUwkAAiVwkBImF1PT////QD7+N9PX//1BQxwQk9f///4mNwPT////XUolcJASJ 
echo BCT/ldT0//9RUQ+/jfL1///HBCQDAAAAiY3I9P//6F3R///HBCQCAAAAiYXQ9P// 
echo 6EvR///HBCT1////iYXM9P///9dSiVwkBIkEJP+V1PT//w+/ler1//9RUccEJPX/ 
echo //+JlcT0////11eJXCQEiQQk/5XU9P//i43A9P//i73Q9P//UFAPv4Xo9f//i5XE 
echo 9P//iUwkGIl8JBCLjcj0//+Lvcz0//+JVCQIxwQk0IRAAIlEJASJTCQUiXwkDOhx 
echo +f//6fv7///HBCQshUAAMfboTvn//+no+///x4XQ9P//AAAAAMdEJARihUAAi0ME 
echo iQQk6LT4//+FwInGD4Vl/f//g73Q9P//AHV6g73U9P//AnQN6Iv4//+FwA+Ef/3/ 
echo /+h2+P//PeAAAAAPhMkAAACFwA+EwQAAAInG6YP7//8xwOm//f//x0QkBB2FQACL 
echo QwSJBCToUvj//4XAD4Rm////x4XQ9P//AQAAAOl0////uAQAAADpi/3//7gCAAAA 
echo 6YH9///HBCRohUAA6JP4///pLfv//8cEJPX///8Pt97/ldD0//+Nlej1//9Xid6J 
echo VCQEiQQk/xWUwkAAUFAPt4Xq9f//weAQCcbpTvz//8cEJPX/////11KNlej1//+J 
echo BCSJVCQE/xWUwkAAZou16PX//1FR6Rf8///onff//42wAAEAAOm5+v//x0QkBMCF 
echo QACLQwSJBCToj/f//4XAicYPhQMBAACDvdT0//8CD47lAAAAg73Q9P//AA+F2AAA 
echo AMdEJARWh0AAi0MIiQQk6Fj3//+FwA+FKQEAAI296PX//7kQAAAAMduJ/vOrofTD 
echo QADHhej1//8QAAAAMf/Hhez1//+gAAAAx4Xw9f//oQAAAMeF9PX//xEAAADHhfj1 
echo //+iAAAAx4X89f//owAAAMeFAPb//xIAAADHhQT2//+kAAAAx4UI9v//pQAAAImF 
echo 0PT//4sEvgHbg8cBiQQk/5XQ9P//mFLB6B8Jw4P/CXXjx0QkBAkAAACJHCSJ3ui9 
echo 3P//6bv5///HBCSnhUAA6BD3///pqvn//8cEJMyFQADoD/f//+mZ+f//x0QkBI2H 
echo QACLQwSJBCTob/b//4XAicYPhVQBAACDvdT0//8CD442AQAAg73Q9P//AA+FKQEA 
echo AMdEJAgCAAIAx0QkBAAAAACLQwiJBCT/FSzEQACD7AzpPvn//4uF1PT//8eFzPT/ 
echo /wAAAACNcP+h9MNAAImF0PT//+ssxwQkEAAAAP+V0PT//1eYi73M9P//wegfg+4B 
echo ifoB+gnQg/4BiYXM9P//dGrHRCQEWodAAIsEs4kEJOjI9f//hcB0vcdEJARgh0AA 
echo iwSziQQk6LH1//+FwHURxwQkoAAAAP+V0PT//5hR66THRCQEZ4dAAIsEs4kEJOiJ 
echo 9f//hcB1NMcEJKEAAAD/ldD0//+YUul5////i4XU9P//i7XM9P//g+gCiTQkiUQk 
echo BOhq2///6Wj4///HRCQEbodAAIsEs4kEJOg+9f//hcAPhc4AAADHBCQRAAAA/5XQ 
echo 9P//mFfpKv///8cEJJiHQADojvX//+ko+P//x0QkBMCHQACLQwSJBCTo/vT//4XA 
echo icYPhQoBAACDvdT0//8DD47sAAAAg73Q9P//AA+F3wAAAI2F6PX//4lEJASNhej0 
echo //+JBCToVs3//4tDCIA4aw+EdgEAAIkEJOjG9P//icaLQwyAOGsPhJoAAACJBCTo 
echo sPT//8dEJAgBAAAAiUQkBIk0JOhozf//PRn8//90QIXAicYPiYr3//+BxgABAADp 
echo f/f//8dEJARzh0AAiwSziQQk6FX0//+FwHUcxwQkogAAAP+V0PT//5hR6UX+//+D 
echo zv/pTPf//8dEJAR5h0AAiwSziQQk6CL0//+FwA+F5QAAAMcEJKMAAAD/ldD0//+Y 
echo UukO/v//i4Xo9f//6WP////HBCTMh0AA6Gf0///pAff//8dEJAQviEAAi0MEiQQk 
echo 6Nfz//+FwInGD4XgAAAAg73U9P//BA+OwgAAAIO90PT//wAPhbUAAACNhej1//+J 
echo RCQEjYXo9P//iQQk6C/M//+LQwyAOGsPhAQBAACJBCTon/P//4nGi0MQgDhrdHeJ 
echo BCTojfP//4tTCIA6Zok0JIlEJAQPlcIPttKDwgKJVCQI6DrM//8x0j0Z/P//D5XC 
echo g+oBCdCJxulX9v//i7Xo9P//6Yn+///HRCQEf4dAAIsEs4kEJOgi8///hcAPhZoA 
echo AADHBCQSAAAA/5XQ9P//mFfpDv3//4uF6PX//+uJxwQkPIhAAOhq8///6QT2///H 
echo RCQEnIhAAItDBIkEJOja8v//hcCJxg+FwgAAAIO91PT//wIPjqQAAACDvdD0//8A 
echo D4WXAAAAjYXo9f//iUQkBI2F6PT//4kEJOgyy///i0MIgDh4dEGLtej1///povX/ 
echo /4u16PT//+n7/v//x0QkBIOHQACLBLOJBCTobfL//4XAdR/HBCSkAAAA/5XQ9P// 
echo mFHpXfz//4u16PT//+lh9f//x0QkBIiHQACLBLOJBCToN/L//4XAdVzHBCSlAAAA 
echo /5XQ9P//mFLpJ/z//8cEJKyIQADoi/L//+kl9f//x0QkBPGIQACLQwSJBCTo+/H/ 
echo /4XAicYPhYwAAACDvdD0//8AdHbHBCT8iEAA6FTy///p7vT//4sEs4296PX//4lE 
echo JASNhej1//+JBCToFPL//zHAg8n/8q6JyPfQg+gCgLwF6PX//2gPhOYAAADHRCQI 
echo CgAAAI2F6PX//8dEJAQAAAAAiQQk6LLx//+JBCT/ldD0//+YV+l6+////xXIwkAA 
echo icbpfPT//8dEJARMiUAAi0MEiQQk6FLx//+FwInGD4W+AAAAg73U9P//Ag+OoAAA 
echo AIO90PT//wAPhZMAAACLQwiJBCToO/H//4nDocDCQADHBCT2////iYXQ9P///9BS 
echo jZXo9f//iQQkiVQkBP8VkMJAAIXbUYuF6PX//1F1SIPgvwyQiYXo9f//i53o9f// 
echo xwQk9v////+V0PT//1eJXCQEiQQk/xX4wkAAUFDp0fP//8aEBej1//8Ax0QkCBAA 
echo AADpDf///wzQiYXo9f//67nHBCRciUAA6Afx///pofP//8dEJAR+iUAAi0MEiQQk 
echo 6Hfw//+FwInGdR6DvdD0//8AD4RaBgAAxwQkjIlAAOjQ8P//6Wrz///HRCQE2YlA 
echo AItDBIkEJOhA8P//hcAPhQIDAAC+apdAALkKAAAAjb3o9P//86SNvfL0//8xwLn2 
echo AAAA86rHRCQE2YlAAItDBIkEJOgE8P//x0QkBOKJQACJhcD0//+LQwSJBCTo6+// 
echo /4XAiYW89P//D5TAg73Q9P//AA+2wImFxPT//w+FZgIAAIO91PT//wIPhbIBAACh 
echo wMJAAMcEJPb///+Jx4mF0PT////QjZXc9P//U4lUJASJBCT/FZDCQABWVoud3PT/ 
echo /8cEJPb/////11eD47+Ay5CJBCSh+MJAAIlcJASJhcj0////0FBQxwQk9v///429 
echo 4PT//4PO//+V0PT//1OJBCSh4MJAAIl8JAyNvej1///HRCQIgAAAAIm9zPT//4l8 
echo JASJ+4mFuPT//zH//9Ax0oPsEMeF1PT//wAAAACLhdT0//87heD0//8Pg54AAAAP 
echo twNmg/gBdFVmg/gCdUONhej0//+JlbT0//+5BAAAAInniUQkFIuFxPT//4lEJBBr 
echo hdT0//8UjbQF7PX///OlvwEAAADol9P//4uVtPT//4nGg4XU9P//AYPDFOuQg73A 
echo 9P//AHTrxwQk9v////+V0PT//42V5PT//1GJVCQMx0QkCAEAAACJXCQEiQQk/xUg 
echo w0AAugEAAACD7BDrtIXSD4WwAwAAMduF/w+EkQMAAI2F6PT//4lcJATHBCRajkAA 
echo iUQkCOi77v//i53c9P//xwQk9v////+V0PT//1eJXCQEiQQk/5XI9P//UFDpIvH/ 
echo /4tDCIkEJOgY7v//icahwMJAAMcEJPb///+Jx4mF0PT////QjZXc9P//UYlUJASJ 
echo BCT/FZDCQABTU4ud3PT//8cEJPb/////11KD47+Ay5CJBCSh+MJAAIlcJASJhcj0 
echo ////0IX2UVEPiDn+///HBCT2/////9dXiXQkBIkEJP8VHMNAAKkCAQAAUlIPhBX+ 
echo //+Nhej0//+Dzv+JBCTo8e3//+l78P//x0QkBNmJQACLQwSJBCToUe3//4XAicYP 
echo hXEDAADHBCQEikAA6LPt///pTfD//8dEJATyiUAAi0MEiQQk6CPt//+FwA+E4/z/ 
echo /8dEJATiiUAAi0MEiQQk6Ajt//+FwA+EyPz//8dEJASWjkAAi0MEiQQk6O3s//+F 
echo wInGD4VjAQAAg73U9P//Bw+ORQEAAIO90PT//wAPhTgBAACLQwiJBCTo1uz//2aJ 
echo hej0//+LQwyJBCToxOz//2aJher0//+LQxCJBCTosuz//4nHi0MUiQQk6KXs//8P 
echo t43o9P//D7eV6vT//41MOf+NVAL/ZomN7PT//2bB6Q9miZXu9P//hMkPhcIAAABm 
echo weoPhNIPhbYAAACLQxiJBCToXuz//2aJhdT0//+LQxyJBCToTOz//4nHocDCQABm 
echo x4Xm9P//BADHBCT1////iYXQ9P///9CNlej1//9RiVQkBIkEJP8VlMJAAIXAU1N0 
echo Dg+3hfD1//9miYXm9P//xoXk9P//IMcEJPX////B5xD/ldD0//9SD7eV1PT//42N 
echo 5PT//8dEJAgAAAAAiUwkEIkEJAn6iVQkDI2V6PT//4lUJAT/FejCQACD7BTpsu7/ 
echo /74BAAAA6aju///HBCSgjkAA6P3r///pl+7//8dEJATWjkAAi0MEiQQk6G3r//+F 
echo wInGD4UiAgAAg73U9P//Bw+OrgEAAIO90PT//wAPhaEBAACLQxyJBCToVuv//4mF 
echo zPT//4tDGIkEJOhF6///iceLQxSJBCToOOv//4nGi0MQiQQk6Cvr//+JhdT0//+L 
echo QwyJBCToGuv//4mF0PT//4tDCIkEJOgJ6///i5XM9P//iXwkEIuN0PT//4u91PT/ 
echo /4l0JAyJBCSJVCQUiXwkCIlMJATo983//4nG6dPt//+JXCQExwQkdI5AAOg06/// 
echo 6XT8///omur//4XAD4UOAQAAxwQk9v////+V0PT//1LHRCQEAQAAAIkEJP8VHMNA 
echo AKkCAQAAUVEPhRf8//+Dy//HBCT2/////5XQ9P//Uo2V4PT//4lUJAyLlcz0///H 
echo RCQIgAAAAIkEJIlUJAT/lbj0//+D7BCD+/8PhNX7//+Dvbz0//8AD4WIAAAAifDB 
echo +B/30CHGidjB4BYJxum1+///xwQk9v////8VwMJAAI2V6PX//1OJVCQEiQQk/xWQ 
echo wkAAVlaLtej1///B7gaD5gHp7ez//8dEJATyiUAAi0MEiQQk6MPp//+FwInGD4Xi 
echo AAAAxwQkQItAAOgl6v//6b/s///HBCTgjkAA6BTq///pruz//400G4POAek3+/// 
echo 6Hfp//894AAAAInDD4S2AAAAhcAPhK4AAADHBCT2/////5XQ9P//UcdEJAQBAAAA 
echo iQQk/xUcw0AAqQIBAABSUg+FEf///+nW/v//x0QkBBaPQACLQwSJBCToLun//4XA 
echo icYPhYEAAACDvdT0//8DfmeDvdD0//8AdV6LQwiJBCToH+n//4nGi0MMiQQk6BLp 
echo //+LPcjCQACNHAb/1znYD4Pb7f//xwQkAQAAAP8VBMNAAFDr5scEJNyMQAAx9uhB 
echo 6f//6dvr///or+j//42YAAEAAOlC////xwQkHI9AAOgg6f//6brr///HRCQERo9A 
echo AItDBIkEJOiQ6P//hcCJxnVng73U9P//Ag+O5QEAAIO90PT//wAPhdgBAADHBCT1 
echo /////xXAwkAAjZXo9f//VoPO/4lUJASJBCT/FZTCQACFwFdXD4RZ6///i0MID7e1 
echo 8PX//4A4Zg+EjwEAAGbB7gSD5g/pOuv//8dEJASrj0AAi0MEiQQk6BDo//+FwInG 
echo D4XtAAAAg73U9P//Ag+OzwAAAIO90PT//wAPhcIAAAChwMJAAI296PX//8cEJPX/ 
echo //+JhdD0////0FKJvcz0//+JfCQEiQQk/xWEwkAAhcBRUXRhMfaDvez1//8AdAaL 
echo tej1//+LQwiAODDHhej1//8ZAAAAD5XAg73U9P//Aw+2wImF7PX//3UzxwQk9f// 
echo //+V0PT//4u9zPT//1OJBCSJfCQE/xXswkAAhcBXVw+Fbur//4PO/+lm6v//i0MM 
echo iQQk6Fzn//+Jhej1//+D6AGD+GN2tMeF6PX//xkAAADrqMcEJLiPQADoluf//+kw 
echo 6v//x0QkBE2QQACLQwSJBCToBuf//4XAicYPhQgBAACDvdT0//8DD47qAAAAD7aF 
echo 0PT//yQBiIXM9P//D4XVAAAAg73U9P//BHVSi3MIx4XQ9P//AAAAAItTDIuF0PT/ 
echo /4lUJAQB8IkEJOjt5v//hcB0Iinwicbpt+n//4PmD+mv6f//xwQkWI9AAOgE5/// 
echo 6Z7p//+Dzv/plun//4tDEIkEJOiM5v//hcCJhdD0//944w+2hcz0//+LcwiDyf+J 
echo 9/Ku99GNQf87hdD0//92xTHSg73U9P//BQ+Eef///zHAg8n/iffyronI99CD6AE5 
echo 0HZ2AdaJldT0//8PvgaJBCT/FczDQACLldT0//+IBotzCIPCAevIxwQkWJBAAOhx 
echo 5v//6Qvp///HRCQE3ZBAAItDBIkEJOjh5f//hcCJxnVsg73U9P//An5SD7aF0PT/ 
echo /yQBdUeLewiDyf/yronI99CNcP/pyuj//zH2i1MMMcCDyf+J1/Kuicj30IPoATnw 
echo D4Z5AQAAjTwyg8YBD74HiQQk/xXMw0AAiAfrz8cEJOiQQADo7OX//+mG6P//x0Qk 
echo BCSRQACLQwSJBCToXOX//4XAicYPhccAAACDvdT0//8Cjb3o9f//uVgAAACJvcz0 
echo ///zqw+OlgAAAIO90PT//wAPhYkAAACLhcz0///HRCQQACAAAMdEJAxgAQAAx0Qk 
echo BAAAAACJRCQIi0MIiQQk/xXow0AAg+wUhcAPhAPo//+JwsHqEGaF0g+UwWY9UEV1 
echo DYTJvgEAAAAPheXn//9mPU1adQ2Eyb4CAAAAD4XS5///Zi1ORWap/f91DYXSvgMA 
echo AAAPhbvn//+Dzv/ps+f//8cEJDCRQADoCOX//+mi5///x0QkBKCRQACLQwSJBCTo 
echo eOT//4XAicYPhR8BAACDvdT0//8HD44BAQAAg73Q9P//AA+F9AAAAI2F6PX//74H 
echo AAAAiYXM9P//iwSzgHgBAA+FuQAAAA++AIiENeH1//+NRgE5hdT0//9+DInG69qL 
echo cwjpVP3//4tDGMaENeL1//8AMdKAOGWLQxSJBCQPlMKJldD0///oCeT//4nHi0MQ 
echo iQQk6Pzj//+JxotDDIkEJOjv4///iYXU9P//i0MIiQQk6N7j///HBCT1////icP/ 
echo FcDCQACLlcz0//9Ri43U9P//iXQkDIl8JBCJVCQYi5XQ9P//iUwkCIlcJASJBCSJ 
echo VCQU6Ii9//+JxumU5v//x0QkCBAAAADHRCQEAAAAAIkEJOiV4///6S3////HBCSw 
echo kUAA6Mzj///pZub//8dEJARckkAAi0MEiQQk6Dzj//+FwInGD4UyAQAAg73U9P// 
echo Bg+O7QIAAIO90PT//wAPheACAACDvdT0//8HD4S1AgAAi0McD7YAPG4PhL4CAAA8 
echo Zg+ErAIAADx0D5TAD7bAjXwAAYO91PT//wgPhIsCAACLQyCAeAEAD4VaAgAAD74w 
echo g73U9P//CQ+FFwIAAMeF0PT///////+Dyv+LQxiJlcT0//+JBCToueL//4mFyPT/ 
echo /4tDFIkEJOio4v//iYXU9P//i0MQiQQk6Jfi//+Jhcz0//+LQwyJBCTohuL//4uV 
echo xPT//4l8JBSLvdT0//+Ljcj0//+JdCQYiUQkBIlUJCCLldD0//+JfCQMi73M9P// 
echo iUwkEIlUJByJfCQIi0MIiQQk6BnA//+D+AEPhF4BAACD+AKJxg+FKOX//8cEJFmT 
echo QADofeL//+kX5f//x0QkBG6TQACLQwSJBCTo7eH//4XAicYPhbgAAACDvdT0//8D 
echo D46aAAAAg73Q9P//AA+FjQAAAItDCIkEJOjW4f//iYXo9P//i0MMiQQk6MXh//+J 
echo hej1//+LQwiAOGt1Fo2F6PT//8dEJAQAAAAAiQQk6B26//+LQwyAOGt1Fo2F6PX/ 
echo /8cEJAAAAACJRCQE6P+5//+Lvej1//+Lnej0///HBCT1/////xXAwkAAUol8JAiJ 
echo XCQEiQQk6LW9///pU+T//8cEJHyTQADoqOH//+lC5P//x0QkBKiTQACLQwSJBCTo 
echo GOH//4XAicYPhWsBAACDvdT0//8CD45NAQAAg73Q9P//AA+FQAEAAItzCIA+XA+U 
echo hdT0//8x0jHAg8n/iffyrvfRg+kBOdEPhr8AAACAPBZcjUoBD4SbAAAAicrr28cE 
echo JD2TQAC+AQAAAOgl4f//6b/j//+LQySJBCToteD//4PK/4O91PT//wqJhdD0//8P 
echo hNX9//+LQyiJBCTolOD//4nC6cP9///HRCQIEAAAAMdEJAQAAAAAiQQk6I3g//+J 
echo xumK/f//vwEAAACDzv/piv3//78CAAAA6Vb9//8x/+lP/f//xwQkaJJAAOik4P// 
echo 6T7j//+NFA6AOlwPhVn////GAgGLcwjpTv///4k0JMdEJAT6k0AAMfboNuD//4nD 
echo hdsPhOjk//+F9g+P5gAAAIC91PT//wAPhdkAAACJXCQExwQk/JNAAIPGAehU4P// 
echo x0QkBPqTQADHBCQAAAAA6PDf//+Jw+u4xwQksJNAAOgg4P//6bri///HRCQE/5NA 
echo AItDBIkEJOiQ3///hcCJxg+FlgEAAIO91PT//wQPjngBAACDvdD0//8AD4VrAQAA 
echo i0MMiQQk6Hnf//+JxotDEIkEJOhs3///g73U9P//BYmF0PT//3V0v2QAAACDyP+D 
echo yv+JRCQUi4XQ9P//iXQkBIlUJBCJfCQMiUQkCItDCIkEJOjpxv//hcAPlcAPtsCJ 
echo xukd4v//D7YDPGIPhL4AAAAPj5QAAAA8InRVPGF0PSwBD4UG////xwQkXAAAAIPD 
echo AehW3///6fL+//+LQxSJBCTo3t7//4O91PT//waJx3Uzg8j/g8r/6Xb////HBCQH 
echo AAAAg8MB6CHf///pvf7//8cEJCIAAACDwwHoDd///+mp/v//i0MUiQQk6JXe//+J 
echo hdT0//+LQxiJBCTohN7//4uV1PT//+kn////PHJ0SDx0dDA8bg+Fcv7//8cEJAoA 
echo AACDwwHowt7//+le/v//xwQkCAAAAIPDAeiu3v//6Ur+///HBCQJAAAAg8MB6Jre 
echo ///pNv7//8cEJA0AAACDwwHoht7//+ki/v//xwQkDJRAAOht3v//6Qfh///HRCQE 
echo cJRAAItDBIkEJOjd3f//hcCJxnUeg73U9P//Ag+FfgEAAMcEJIiUQADoNt7//+nQ 
echo 4P//x0QkBLWUQACLQwSJBCTopt3//4XAicYPheEAAAD/FZzCQACFwInHD4TJAAAA 
echo jYXo9f//iTwkiUQkBP8VCMRAAIO91PT//wNQUA+OlgAAAIO90PT//wAPhYkAAACL 
echo QwiJBCToat3//4nBi0MIgDhrdQaLjej1//+LQwyJjdT0//+JBCToSd3//4tTDIuN 
echo 1PT//4A6a3UGi4Xs9f//i5X09f//K5Xs9f//x0QkGAAAAACJRCQMiUwkCMdEJAQA 
echo AAAAiTwkiVQkFIuV8PX//yuV6PX//4lUJBD/FSTEQACD7Bzp69///8cEJMSUQADo 
echo QN3//+na3///g87/6dLf///HRCQE8JRAAItDBIkEJOio3P//hcCJxg+FvgAAAP8V 
echo nMJAAIO91PT//wIPjpoAAACDvdD0//8AD4WNAAAAjZXo9f//iQQkiVQkBP8VCMRA 
echo AFZWi0MID7YAPHl0Yzx3dE48aHQ5i7Xo9f//6WPf//+LQwiJBCToWdz//4P4ZA+H 
echo bv7//4O90PT//wAPhWH+//+JBCToJ8P//+k13///i7X09f//K7Xs9f//6STf//+L 
echo tfD1//8rtej1///pE9///4u17PX//+kI3///xwQkAJVAAOhd3P//6ffe///HRCQE 
echo VJVAAItDBIkEJOjN2///hcCJxnUag73Q9P//AHRZxwQkYJVAAOgq3P//6cTe///H 
echo RCQEoZVAAItDBIkEJOia2///hcCJxnVmg73U9P//An5Mg73Q9P//AHVDi0MIgDh3 
echo D5XAD7bAiQQk/xUAxEAAicZS6Xze//+Nnej1///HRCQE/wMAAIkcJP8VmMJAAFFR 
echo iRwk6Lzb///pVt7//8cEJLCVQADoq9v//+lF3v//x0QkBAmWQACLQwSJBCToG9v/ 
echo /4XAicYPhcUAAACNvej1//+5BwAAAIm9zPT///OrjYXo9P//iQQk/xX4w0AAg73U 
echo 9P//A1APjoQAAACDvdD0//8AdXuLQwiJBCTo5dr//4nHi0MIgDhrdQaLvej0//+L 
echo QwyJBCToytr//4tTDIA6a3UGi4Xs9P//g73U9P//BA+EXAIAAItTEA+2EoD6bA+E 
echo 8wEAAID6cg+EkAEAAID6ZA+EPQEAAID6dXR/iUQkBIk8JP8VGMRAAFFR6XTd///H 
echo BCQclkAA6Mna///pY93//8dEJARXlkAAi0MEiQQk6Dna//+FwInGD4W7AAAAg73U 
echo 9P//Ag+OnQAAAIO90PT//wAPhZAAAACLQwiAOHh0bY2F6PX//4kEJP8V+MNAAFaL 
echo tez1///pCd3//4k8JIlEJAT/FRjEQACLvcz0//+LHRTEQAC5BwAAAFBQMcDzq7gE 
echo AAAAiYX49f//i4XM9P//x0QkCBwAAADHBCQBAAAAiUQkBP/Tg+wM6bfc//+Nhej1 
echo //+JBCT/FfjDQACLtej1//9T6Zzc///HBCRslkAA6PHZ///pi9z//8dEJATYlkAA 
echo i0MEiQQk6GHZ//+FwInGD4VdAQAAg73U9P//Ag+FIwEAAMcEJOCWQADottn//+lQ 
echo 3P//iUQkBIk8JP8VGMRAAFBQi4XM9P//x4Xo9f//AAAAAMeF+PX//wIAAADHRCQI 
echo HAAAAMcEJAEAAACJRCQE/xUUxEAAg+wM6Qbc//+JPCSJRCQE/xUYxEAAi73M9P// 
echo UlLHhej1//8AAAAAx4X49f//CAAAAIsdFMRAAIl8JATHRCQIHAAAAMcEJAEAAAD/ 
echo 0zHAuQcAAACD7Azzq7gQAAAA6cz+//+JPCSJRCQE/xUYxEAAi73M9P//UFDHhej1 
echo //8AAAAAx4X49f//AgAAAIsdFMRAAIl8JATHRCQIHAAAAMcEJAEAAAD/0zHAuQcA 
echo AACD7Azzq7gEAAAA6XL+//+JPCSJRCQE/xUYxEAAV1fpPtv//4tTCIPJ/zHAidfy 
echo roP5/XRvg73Q9P//AA+Fv/7//4kUJOjlxf//icbpEdv//8dEJAQGl0AAi0MEiQQk 
echo 6OfX//+FwInGD4UOAQAAg73U9P//Ag+O8AAAAIO90PT//wAPheMAAACNhej1//+J 
echo BCToCcX//4XAdFi+AQAAAOm+2v//iRQk6LfX//+LUwiJhdT0//+Dyf8xwInX8q6D 
echo +f10d4O90PT//wAPhTH+//+DvdT0////D4Rl////i4XU9P//iQQk6DTC//+Jxulw 
echo 2v//x0QkBDOXQACLQwiJBCToBtj//4XAicd0SolEJAyNhej1///HRCQIAQAAAMdE 
echo JARUAAAAiQQk6L7X//+JPCTo5tf//+ko2v//g73U9P//CQ+Huv3//4O90PT//wB0 
echo jems/f//xwQkNpdAAL4BAAAA6F3X///p99n//8cEJBCXQADoTNf//+nm2f//xwQk 
echo UZdAADH26DnX///p09n//1WJ5V3pZ63//5CQkJCQkJD/////kGdAAAAAAAD///// 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKAAAAAAAAALBnQAD///// 
echo //////8AAAACAAAA/////4A/QACQP0AATuZAu7EZv0QAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAGxpYmdjY19zX2R3Mi0xLmRsbABfX3JlZ2lzdGVyX2Zy 
echo YW1lX2luZm8AX19kZXJlZ2lzdGVyX2ZyYW1lX2luZm8AbGliZ2NqLTE2LmRsbABf 
echo SnZfUmVnaXN0ZXJDbGFzc2VzAAAAAAAAgBZAAJAWQACgFkAAwBZAAHAWQABgFkAA 
echo JXMudHh0ACVzLmd4eQB3ACVzJXMAJXMlcyVzACVzCgAlc1xuAAAAAE1PVVNFX0VW 
echo RU5UIDEgTU9VU0VfWCAlZCBNT1VTRV9ZICVkIExFRlRfQlVUVE9OICVkIFJJR0hU 
echo X0JVVFRPTiAlZCBMRUZUX0RPVUJMRV9DTElDSyAlZCBSSUdIVF9ET1VCTEVfQ0xJ 
echo Q0sgJWQgTU9VU0VfV0hFRUwgJWQAAEsARQBSAE4ARQBMADMAMgAuAEQATABMAAAA 
echo U2V0Q3VycmVudENvbnNvbGVGb250RXgAVABlAHIAbQBpAG4AYQBsAAAAR2V0Q3Vy 
echo cmVudENvbnNvbGVGb250RXgAcmIARXJyb3I6IENvdWxkIG5vdCBsb2FkIGZvbnQA 
echo ClVzYWdlOiBjbWR3aXogW2dldGNvbnNvbGVkaW0gc2V0YnVmZmVyc2l6ZSBnZXRj 
echo b25zb2xlY29sb3IgZ2V0Y2ggZ2V0a2V5c3RhdGUgZmx1c2hrZXlzIGdldHF1aWNr 
echo ZWRpdCBzZXRxdWlja2VkaXQgZ2V0bW91c2UgZ2V0Y2hfb3JfbW91c2UgZ2V0Y2hf 
echo YW5kX21vdXNlIGdldGNoYXJhdCBnZXRjb2xvcmF0IHNob3djdXJzb3IgZ2V0Y3Vy 
echo c29ycG9zIHNldGN1cnNvcnBvcyBwcmludCBzYXZlYmxvY2sgY29weWJsb2NrIG1v 
echo dmVibG9jayBpbnNwZWN0YmxvY2sgcGxheXNvdW5kIGRlbGF5IHN0cmluZ2ZpbmQg 
echo c3RyaW5nbGVuIGdldHRpbWUgYXdhaXQgZ2V0ZXhldHlwZSBjYWNoZSBzZXR3aW5k 
echo b3d0cmFuc3BhcmVuY3kgZ2V0d2luZG93Ym91bmRzIHNldHdpbmRvd3BvcyBnZXRk 
echo aXNwbGF5ZGltIGdldG1vdXNlY3Vyc29ycG9zIHNldG1vdXNlY3Vyc29ycG9zIGlu 
echo c2VydGJtcCBzYXZlZm9udCBzZXRmb250IGdldHRpdGxlXSBbcGFyYW1zXQoKVXNl 
echo ICJjbWR3aXogb3BlcmF0aW9uIC8/IiBmb3IgaW5mbyBvbiBhcmd1bWVudHMgYW5k 
echo IHJldHVybiB2YWx1ZXMALz8AY2FjaGUAClVzYWdlOiBjbWR3aXogY2FjaGUgW2Zp 
echo bGVsaXN0XQByAEVycm9yOiBmaWxlIG5vdCBmb3VuZABFcnJvcjogY291bGQgbm90 
echo IGFsbG9jYXRlIG1lbW9yeQBkZWxheQAKVXNhZ2U6IGNtZHdpeiBkZWxheSBbbXNd 
echo AGdldGNvbnNvbGVkaW0AAApVc2FnZTogY21kd2l6IGdldGNvbnNvbGVkaW0gW3d8 
echo aHxzd3xzaHxjeHxjeV0KClJFVFVSTjogQ29uc29sZSBkaW1lbnNpb25zIGluIHRl 
echo eHQsIG9yIHNwZWNpZmllZCBkaW1lbnNpb24gdmFsdWUgaW4gRVJST1JMRVZFTAAA 
echo V0lEVEggJWQgSEVJR0hUICVkIFNDUkVFTl9XSURUSCAlZCBTQ1JFRU5fSEVJR0hU 
echo ICVkIFNDUk9MTF9YICVkIFNDUk9MTF9ZICVkCgBzZXRidWZmZXJzaXplAAAKVXNh 
echo Z2U6IGNtZHdpeiBzZXRidWZmZXJzaXplIFt3aWR0aHxrZWVwIGhlaWdodHxrZWVw 
echo XQBnZXRjaAAKVXNhZ2U6IGNtZHdpeiBnZXRjaCBbbm9XYWl0XQoKUkVUVVJOOiBL 
echo ZXkgc2NhbiBjb2RlAGZsdXNoa2V5cwAKVXNhZ2U6IGNtZHdpeiBmbHVzaGtleXMA 
echo Z2V0a2V5c3RhdGUAClVzYWdlOiBjbWR3aXogZ2V0a2V5c3RhdGUgW2FsbHxbbHxy 
echo XWN0cmx8W2x8cl1hbHR8W2x8cl1zaGlmdHxWS0VZW2hdXSBbVksyXSAuLi4KClJF 
echo VFVSTjogVGV4dCBvdXRwdXQgb2YgdGhlIGZvcm0gVktFWSBWS0VZMiBldGMsIGFu 
echo ZCBpbiBFUlJPUkxFVkVMIGEgYml0IHBhdHRlcm4gd2hlcmUgVktFWTEgaXMgYml0 
echo IDEsIFZLRVkyIGlzIGJpdCAyLCBldGMuCgpbYWxsXSBlcXVhbHMgdGVzdGluZyBb 
echo c2hpZnQgbHNoaWZ0IHJzaGlmdCBjdHJsIGxjdHJsIHJjdHJsIGFsdCBsYWx0IHJh 
echo bHRdCgpTZWUgaHR0cHM6Ly9tc2RuLm1pY3Jvc29mdC5jb20vZW4tdXMvbGlicmFy 
echo eS93aW5kb3dzL2Rlc2t0b3AvZGQzNzU3MzElJTI4dj12cy44NSUlMjkuYXNweCBm 
echo b3IgdmlydHVhbCBrZXkgY29kZXMKAGFsbABzaGlmdABsc2hpZnQAcnNoaWZ0AGN0 
echo cmwAbGN0cmwAcmN0cmwAYWx0AGxhbHQAcmFsdABwbGF5c291bmQAAApVc2FnZTog 
echo Y21kd2l6IHBsYXlzb3VuZCBbZmlsZW5hbWUud2F2XQBnZXRjaGFyYXQAAAAKVXNh 
echo Z2U6IGNtZHdpeiBnZXRjaGFyYXQgW3h8a2VlcCB5fGtlZXBdCgpSRVRVUk46IENo 
echo YXJhY3RlciBBU0NJSSB2YWx1ZSBhdCBwb3NpdGlvbiwgLTEgb24gZmFpbHVyZQBn 
echo ZXRjb2xvcmF0AAAAClVzYWdlOiBjbWR3aXogZ2V0Y29sb3JhdCBbZmd8YmcgeHxr 
echo ZWVwIHl8a2VlcF0KClJFVFVSTjogQ29sb3IgdmFsdWUgYXQgcG9zaXRpb24sIC0x 
echo IG9uIGZhaWx1cmUAZ2V0Y3Vyc29ycG9zAAAAAApVc2FnZTogY21kd2l6IGdldGN1 
echo cnNvcnBvcyBbeHx5XQoKUkVUVVJOOiBDdXJzb3IgcG9zaXRpb24gaW4geCBvciB5 
echo AGdldHRpbWUAAAAAClVzYWdlOiBjbWR3aXogZ2V0dGltZQoKUkVUVVJOOiBUaW1l 
echo IHBhc3NlZCBzaW5jZSBzeXN0ZW0gc3RhcnQsIGluIG1pbGxpc2Vjb25kcwBzZXRx 
echo dWlja2VkaXQAAAAAClVzYWdlOiBjbWR3aXogc2V0cXVpY2tlZGl0IFswfDFdAGdl 
echo dHF1aWNrZWRpdAAAClVzYWdlOiBjbWR3aXogZ2V0cXVpY2tlZGl0CgpSRVRVUk46 
echo IDEgaWYgcXVpY2sgZWRpdCBpcyBlbmFibGVkLCBvdGhlcndpc2UgMABnZXRtb3Vz 
echo ZQBnZXRjaF9hbmRfbW91c2UAZ2V0Y2hfb3JfbW91c2UAAAAAClVzYWdlOiBjbWR3 
echo aXogZ2V0bW91c2UgW21heFdhaXRfbXNdCgpSRVRVUk46IFRleHQgb3V0cHV0IHJl 
echo Z2FyZGluZyBtb3VzZSBldmVudAoKRVJST1JMRVZFTCAtMSBvbiBubyBpbnB1dCwg 
echo b3IgYml0cGF0dGVybiBmb2xsb3dpbmcgeXl5eXl5eXl5eXh4eHh4eHh4eHh4LS0t 
echo V3dSTHJsLSAgd2hlcmUgLSBiaXRzIGFyZSBpZ25vcmVkLCBsL0wgaXMgc2luZ2xl 
echo L2RvdWJsZSBsZWZ0IGNsaWNrLCByL1IgaXMgc2luZ2xlL2RvdWJsZSByaWdodCBj 
echo bGljaywgdy9XIGlzIG1vdXNlIHdoZWVsIHVwL2Rvd24sIGFuZCB4L3kgYXJlIG1v 
echo dXNlIGNvb3JkaW5hdGVzAApVc2FnZTogY21kd2l6IGdldGNoX29yX21vdXNlIFtt 
echo YXhXYWl0X21zXQoKUkVUVVJOOiBUZXh0IG91dHB1dCByZWdhcmRpbmcgbW91c2Ug 
echo ZXZlbnQgb3Iga2V5IHByZXNzCgpFUlJPUkxFVkVMIC0xIG9uIG5vIGlucHV0LCBv 
echo ciBiaXRwYXR0ZXJuIGZvbGxvd2luZyB5eXl5eXl5eXl5eHh4eHh4eHh4eHgtLS1X 
echo d1JMcmwwIGZvciBhIE1PVVNFIGV2ZW50IHdoZXJlIC0gYml0cyBhcmUgaWdub3Jl 
echo ZCwgbC9MIGlzIHNpbmdsZS9kb3VibGUgbGVmdCBjbGljaywgci9SIGlzIHNpbmds 
echo ZS9kb3VibGUgcmlnaHQgY2xpY2ssIHcvVyBpcyBtb3VzZSB3aGVlbCB1cC9kb3du 
echo LCBhbmQgeC95IGFyZSBtb3VzZSBjb29yZGluYXRlcywgT1Iga2tra2tra2trazEg 
echo Zm9yIGEgS0VZIGV2ZW50IHdoZXJlIGsgaXMgdGhlIGtleSBwcmVzc2VkAAAKVXNh 
echo Z2U6IGNtZHdpeiBnZXRjaF9hbmRfbW91c2UgW21heFdhaXRfbXNdCgpSRVRVUk46 
echo IFRleHQgb3V0cHV0IHJlZ2FyZGluZyBtb3VzZSBldmVudCBhbmQga2V5IHByZXNz 
echo CgpFUlJPUkxFVkVMIC0xIG9uIG5vIGlucHV0LCBvciBiaXRwYXR0ZXJuIGtra2tr 
echo a2tra3l5eXl5eXl4eHh4eHh4eFd3UkxybE0gd2hlcmUgTSBpcyBzZXQgaWYgdGhl 
echo cmUgd2FzIGEgTW91c2UgZXZlbnQsIGwvTCBpcyBzaW5nbGUvZG91YmxlIGxlZnQg 
echo Y2xpY2ssIHIvUiBpcyBzaW5nbGUvZG91YmxlIHJpZ2h0IGNsaWNrLCB3L1cgaXMg 
echo bW91c2Ugd2hlZWwgdXAvZG93biwgeC95IGFyZSBtb3VzZSBjb29yZGluYXRlcywg 
echo YW5kIGsgaXMgdGhlIEtFWSAoMCBtZWFucyBubyBrZXkgcHJlc3NlZCkARVZFTlQg 
echo S0VZX0VWRU5UICVkICVzCgAAAABFVkVOVCBLRVlfRVZFTlQgJWQgTU9VU0VfRVZF 
echo TlQgMAoAbW92ZWJsb2NrAApVc2FnZTogY21kd2l6IG1vdmVibG9jayBbeCB5IHdp 
echo ZHRoIGhlaWdodCBuZXdYIG5ld1ldAGNvcHlibG9jawAKVXNhZ2U6IGNtZHdpeiBj 
echo b3B5YmxvY2sgW3ggeSB3aWR0aCBoZWlnaHQgbmV3WCBuZXdZXQBhd2FpdAAKVXNh 
echo Z2U6IGNtZHdpeiBhd2FpdCBbb2xkdGltZV0gW3dhaXR0aW1lXQBnZXRjb25zb2xl 
echo Y29sb3IAAAAKVXNhZ2U6IGNtZHdpeiBnZXRjb25zb2xlY29sb3IgW2ZnfGJnXQoK 
echo UkVUVVJOOiBDb25zb2xlIGNvbG9yIDAtMTUsIG9yIC0xIG9uIGVycm9yAHNob3dj 
echo dXJzb3IAAAAKVXNhZ2U6IGNtZHdpeiBzaG93Y3Vyc29yIFswfDFdIFtzaG93IHBl 
echo cmNlbnRhZ2UgMS0xMDAgKGRlZmF1bHQgMjUpXQoKUkVUVVJOOiAwIGlmIGN1cnNv 
echo ciB3YXMgcHJldmlvdXNseSBvZmYsIG90aGVyd2lzZSB0aGUgcHJldmlvdXMgc2hv 
echo dyBwZXJjZW50YWdlAHN0cmluZ2ZpbmQAClVzYWdlOiBjbWR3aXogc3RyaW5nZmlu 
echo ZCBbb3Jnc3RyaW5nIGZpbmRzdHJpbmddIFtzdGFydGluZGV4XSBbbm9DYXNlXQoK 
echo UkVUVVJOOiBJbmRleCBvZiBmaW5kc3RyaW5nIGluIG9yZ3N0cmluZywgb3IgLTEg 
echo aWYgbm90IGZvdW5kAHN0cmluZ2xlbgAAClVzYWdlOiBjbWR3aXogc3RyaW5nbGVu 
echo IFtzdHJpbmddCgpSRVRVUk46IExlbmd0aCBvZiBzdHJpbmcAZ2V0ZXhldHlwZQAA 
echo ClVzYWdlOiBjbWR3aXogZ2V0ZXhldHlwZSBbZmlsZV0KClJFVFVSTjogLTEgKEVy 
echo cm9yKSwgMCAoVW5rbm93biksIDEgKENvbnNvbGUgb3IgLmJhdCksIDIgKE1TLURP 
echo UyksIDMgKFdpbmRvd3MpAGluc3BlY3RibG9jawAAAAAKVXNhZ2U6IGNtZHdpeiBp 
echo bnNwZWN0YmxvY2sgW3ggeSB3aWR0aCBoZWlnaHQgaW5jbHVzaXZlfGV4Y2x1c2l2 
echo ZSBjaGFyMV0gW2NoYXIyXSBbY2hhcjNdIC4uLgoKUkVUVVJOOiBCaXQgcGF0dGVy 
echo biwgd2hlcmUgY2hhcjEgaXMgYml0IDEsIGNoYXIgMiBpcyBiaXQgMiwgZXRjLiAt 
echo MSBvbiBlcnJvci4Ac2F2ZWJsb2NrAAAAClVzYWdlOiBjbWR3aXogc2F2ZWJsb2Nr 
echo IFtmaWxlbmFtZSB4IHkgd2lkdGggaGVpZ2h0XSBbZW5jb2RlfGZvcmNlY29kZXxu 
echo b2NvZGV8dHh0XSBbdHJhbnNwYXJlbnQgY2hhcl0gW3RyYW5zcGFyZW50IGJnY29s 
echo b3JdIFt0cmFuc3BhcmVudCBmZ2NvbG9yXQoKUkVUVVJOOiAwIG9uIHN1Y2Nlc3Ms 
echo IDEgZm9yIGZpbGUgd3JpdGUgZXJyb3IsIDIgZm9yIGludmFsaWQgYmxvY2sARXJy 
echo b3I6IENvdWxkIG5vdCB3cml0ZSBmaWxlAEVycm9yOiBJbnZhbGlkIGJsb2NrAHNl 
echo dGN1cnNvcnBvcwAAClVzYWdlOiBjbWR3aXogc2V0Y3Vyc29ycG9zIFt4fGtlZXAg 
echo eXxrZWVwXQBwcmludAAAAApVc2FnZTogY21kd2l6IHByaW50IFsic3RyaW5nIl0K 
echo U3VwcG9ydGVkIGZvcm1hdHRpbmcgaXMgXG4gXHIgXHQgXGEgXGIgXFwAXAAlcwBp 
echo bnNlcnRibXAAAAAAClVzYWdlOiBjbWR3aXogaW5zZXJ0Ym1wIFtmaWxlLmJtcCB4 
echo IHldIFtbel18W3cgaF1dCgpSRVRVUk46IDAgb24gc3VjY2VzcywgMSBpZiBmYWls 
echo ZWQgdG8gbG9hZCBmaWxlAHNldHdpbmRvd3RyYW5zcGFyZW5jeQAAAApVc2FnZTog 
echo Y21kd2l6IHNldHdpbmRvd3RyYW5zcGFyZW5jeSBbMC0xMDBdAHNldHdpbmRvd3Bv 
echo cwAAAApVc2FnZTogY21kd2l6IHNldHdpbmRvd3BvcyBbeHxrZWVwIHl8a2VlcF0A 
echo Z2V0d2luZG93Ym91bmRzAApVc2FnZTogY21kd2l6IGdldHdpbmRvd2JvdW5kcyBb 
echo eHx5fHd8aF0KClJFVFVSTjogVGhlIHJlcXVlc3RlZCB2YWx1ZSBpbiBFUlJPUkxF 
echo VkVMAGdldHRpdGxlAAAAAApVc2FnZTogY21kd2l6IGdldHRpdGxlCgpSRVRVUk46 
echo IFByaW50cyB0aGUgdGl0bGUgb2YgdGhlIGNvbnNvbGUAZ2V0ZGlzcGxheWRpbQAA 
echo ClVzYWdlOiBjbWR3aXogZ2V0ZGlzcGxheWRpbSBbd3xoXQoKUkVUVVJOOiBUaGUg 
echo cmVxdWVzdGVkIHNjcmVlbiBkaW1lbnNpb24gaW4gRVJST1JMRVZFTABzZXRtb3Vz 
echo ZWN1cnNvcnBvcwAAClVzYWdlOiBjbWR3aXogc2V0bW91c2VjdXJzb3Jwb3MgW3h8 
echo a2VlcCB5fGtlZXBdIFtsfHJ8ZHx1XQBnZXRtb3VzZWN1cnNvcnBvcwAAAAAKVXNh 
echo Z2U6IGNtZHdpeiBnZXRtb3VzZWN1cnNvcnBvcyBbeHx5XQoKUkVUVVJOOiBUaGUg 
echo cmVxdWVzdGVkIG1vdXNlIGN1cnNvciBwb3NpdGlvbiBkaW1lbnNpb24gaW4gRVJS 
echo T1JMRVZFTABzZXRmb250AApVc2FnZTogY21kd2l6IHNldGZvbnQgWzAtOXxmaWxl 
echo bmFtZV0Ac2F2ZWZvbnQAAApVc2FnZTogY21kd2l6IHNhdmVmb250IFtmaWxlbmFt 
echo ZV0Ad2IARXJyb3I6IGNvdWxkIG5vdCBzYXZlIGZvbnQARXJyb3I6IHVua25vd24g 
echo b3BlcmF0aW9uAE5PX0VWRU5UCgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABmZmZmZmYEQAAAAD8AAMhC 
echo ILNAAECwQABwMEAAVW5rbm93biBlcnJvcgAAAF9tYXRoZXJyKCk6ICVzIGluICVz 
echo KCVnLCAlZykgIChyZXR2YWw9JWcpCgAAQXJndW1lbnQgZG9tYWluIGVycm9yIChE 
echo T01BSU4pAEFyZ3VtZW50IHNpbmd1bGFyaXR5IChTSUdOKQAAT3ZlcmZsb3cgcmFu 
echo Z2UgZXJyb3IgKE9WRVJGTE9XKQBUaGUgcmVzdWx0IGlzIHRvbyBzbWFsbCB0byBi 
echo ZSByZXByZXNlbnRlZCAoVU5ERVJGTE9XKQAAAFRvdGFsIGxvc3Mgb2Ygc2lnbmlm 
echo aWNhbmNlIChUTE9TUykAAFBhcnRpYWwgbG9zcyBvZiBzaWduaWZpY2FuY2UgKFBM 
echo T1NTKQAAAADImEAA55hAAASZQAAkmUAAXJlAAICZQABNaW5ndy13NjQgcnVudGlt 
echo ZSBmYWlsdXJlOgoAQWRkcmVzcyAlcCBoYXMgbm8gaW1hZ2Utc2VjdGlvbgAgIFZp 
echo cnR1YWxRdWVyeSBmYWlsZWQgZm9yICVkIGJ5dGVzIGF0IGFkZHJlc3MgJXAAAAAA 
echo ICBWaXJ0dWFsUHJvdGVjdCBmYWlsZWQgd2l0aCBjb2RlIDB4JXgAACAgVW5rbm93 
echo biBwc2V1ZG8gcmVsb2NhdGlvbiBwcm90b2NvbCB2ZXJzaW9uICVkLgoAAAAgIFVu 
echo a25vd24gcHNldWRvIHJlbG9jYXRpb24gYml0IHNpemUgJWQuCgAAAEdDQzogKEdO 
echo VSkgNi4yLjAAAAAAR0NDOiAoR05VKSA1LjMuMAAAAABHQ0M6IChHTlUpIDUuMy4w 
echo AAAAAEdDQzogKEdOVSkgNi4yLjAAAAAAR0NDOiAoR05VKSA2LjIuMAAAAABHQ0M6 
echo IChHTlUpIDYuMi4wAAAAAEdDQzogKEdOVSkgNi4yLjAAAAAAR0NDOiAoR05VKSA2 
echo LjIuMAAAAABHQ0M6IChHTlUpIDYuMi4wAAAAAEdDQzogKEdOVSkgNi4yLjAAAAAA 
echo R0NDOiAoR05VKSA2LjIuMAAAAABHQ0M6IChHTlUpIDYuMi4wAAAAAEdDQzogKEdO 
echo VSkgNi4yLjAAAAAAR0NDOiAoR05VKSA2LjIuMAAAAABHQ0M6IChHTlUpIDYuMi4w 
echo AAAAAEdDQzogKEdOVSkgNi4yLjAAAAAAR0NDOiAoR05VKSA2LjIuMAAAAABHQ0M6 
echo IChHTlUpIDYuMi4wAAAAAEdDQzogKEdOVSkgNi4yLjAAAAAAR0NDOiAoR05VKSA2 
echo LjIuMAAAAABHQ0M6IChHTlUpIDYuMi4wAAAAAEdDQzogKEdOVSkgNi4yLjAAAAAA 
echo R0NDOiAoR05VKSA2LjIuMAAAAABHQ0M6IChHTlUpIDUuMy4wAAAAAEdDQzogKEdO 
echo VSkgNi4yLjAAAAAAR0NDOiAoR05VKSA2LjIuMAAAAABHQ0M6IChHTlUpIDUuMy4w 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAABQAAAAAAAAAAXpSAAF8CAEbDAQEiAEAACgAAAAcAAAA 
echo 4HT//+EAAAAAQQ4IhQJCDQVFhgODBALCCsNBxkHFDAQERAsAHAAAAEgAAACkdf// 
echo LgAAAABBDgiFAkINBWrFDAQEAAAUAAAAAAAAAAF6UgABfAgBGwwEBIgBAAB4AAAA 
echo HAAAAJx1//+3AAAAAEEOCIYCQQ4MgwNDDkBRDjxDDkBRDjhDDkBbCg4MQ8MOCEHG 
echo DgREC0gKDgxDww4IQcYOBEQLSAoODEPDDghBxg4ERAtICg4MQ8MOCEHGDgREC00K 
echo DgxIww4IQcYOBEoLTQ4MSMMOCEHGDgQANAAAAJgAAADgdf//TQAAAABBDgiGAkEO 
echo DIMDQw5AVQ48Qw5AUQ44Qw5AWQ4MQcMOCEHGDgQAAACIAAAA0AAAAPh1//8aAQAA 
echo AEEOCIUCQQ4MhwNBDhCGBEEOFIMFRg6wA2QOrANDDrADUQ6oA0MOsAMCVw6sA0MO 
echo sANpDpwDQw6wA1UKDhRBww4QQcYODEHHDghBxQ4EQQtLCg4UQcMOEEHGDgxBxw4I 
echo RMUOBEkLSwoOFEHDDhBBxg4MQccOCETFDgRBC2QAAABcAQAAjHb//zsCAAAAQQ4I 
echo hQJBDgyHA0EOEIYEQQ4UgwVDDoABZg54RQ6AAQMPAQ5sQw6AAQKeCg4UQ8MOEEHG 
echo DgxBxw4IQcUOBEgLfwoOFEHDDhBBxg4MQccOCEHFDgRBCwAAEAAAAMQBAABkeP// 
echo JwAAAAAAAAB0AAAA2AEAAIB4///oAAAAAEEOCIUCQQ4MhwNBDhCGBEEOFIMFQw5w 
echo fA5oQw5wRwoOFEHDDhBBxg4MQccOCEHFDgRBC1UObEMOcFYOaEMOcFoObEMOcE8O 
echo aEMOcGsOaEMOcEMOFEHDDhBBxg4MQccOCEHFDgQAAAAwAAAAUAIAAPh4//+GAAAA 
echo AEEOCIYCQQ4MgwMCZArDDghBxg4ESQtKCsMOCEHGDgRFCwAAeAAAAIQCAABUef// 
echo OgUAAABBDgiFAkEODIcDQw4QhgRBDhSDBUYOsAUCZQ6sBUMOsAVRDqgFQw6wBQOX 
echo AQ6sBUMOsAVlDpwFQw6wBQPUAQoOFEHDDhBBxg4MQccOCEHFDgRBC0YKDhRGww4Q 
echo QcYODEHHDghBxQ4EQQsAAGAAAAAAAwAAGH7//60BAAAAQQ4IhQJBDgyHA0EOEIYE 
echo QQ4UgwVDDnBTDmxDDnBRDmhDDnACzA5sQQ5wYQ5cQw5wAkUObEEOcF0OXEMOcGAO 
echo FEHDDhBBxg4MQccOCEHFDgQAAAA8AAAAZAMAAGR///8kAQAAAEEOCIUCQQ4MhwNB 
echo DhCGBEEOFIMFQw5QAsIKDhRDww4QQcYODEHHDghBxQ4EQQsAPAAAAKQDAABUgP// 
echo 5AAAAABBDgiFAkEODIcDQw4QhgRBDhSDBVAOsAgCyQ4UQcMOEEHGDgxBxw4IQcUO 
echo BAAAADQAAADkAwAABIH//8MAAAAAQQ4IgwJDDjBkDihDDjBaDiRDDjBNCg4IQcMO 
echo BEoLAl4OIEMOMAAAtAAAABwEAACcgf//8QIAAABBDgiFAkEODIcDQw4QhgRBDhSD 
echo BUMOkAFpDowBQw6QAVMOjAFDDpABAkcOeEMOkAFnDoQBQw6QAQJJDnxDDpABWQ6I 
echo AUgOkAECZg5sQw6QAV0OjAFDDpABUQ6MAUMOkAFNDowBQw6QAU8OiAFDDpABSQ6I 
echo AUMOkAFFCg4UQcMOEEHGDgxBxw4IQcUOBEELQwoOFEbDDhBDxg4MQccOCEHFDgRB 
echo CwAAAJQAAADUBAAA5IP//3oCAAAAQQ4IhQJBDgyHA0YOEIYEQQ4UgwVaDsAJAsgK 
echo DhRBww4QQcYODEHHDghBxQ4EQQtdDrwJQw7ACWEOsAlDDsAJAksOuAlDDsAJcg68 
echo CUMOwAlbDrgJQw7ACQJmDrQJQw7ACUkOvAlDDsAJTA64CUMOwAlGCg4UQ8MOEEHG 
echo DgxBxw4IQcUOBEsLWAAAAGwFAADMhf//gwAAAABBDgiFAkEODIcDQQ4QhgRBDhSD 
echo BUgOMFEOLEMOMFcOKEMOMFoOLEMOMFEOJEMOMEsOLEMOMEMOFEPDDhBBxg4MQccO 
echo CEHFDgQAAACIAAAAyAUAAACG//8LAQAAAEEOCIUCQQ4MhwNBDhCGBEEOFIMFQw6Q 
echo AU0OjAFDDpABAmAOiAFDDpABVQ6MAUMOkAFRDoQBQw6QAVQOjAFDDpABTA6IAUMO 
echo kAFJDowBQw6QAUUKDhRBww4QQcYODEHHDghBxQ4EQQtiDhRDww4QQcYODEHHDghB 
echo xQ4EAEQAAABUBgAAJJn//7AnAAAARAwBAEcQBQJ1AEYPA3VwBhAHAnV8EAYCdXgQ 
echo AwJ1dAN4AQrBDAEAQcNBxkHHQcVDDAQEQQsAAAAAAAAUAAAAAAAAAAF6UgABfAgB 
echo GwwEBIgBAAAcAAAAHAAAAHDA//8JAAAAAEEOCIUCQg0FQcUMBAQAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo jMAAAAAAAAAAAAAALMsAAGDCAACkwAAAAAAAAAAAAADoywAAeMIAAFjBAAAAAAAA 
echo AAAAALDMAAAswwAAFMIAAAAAAAAAAAAAwMwAAOjDAAAcwgAAAAAAAAAAAAAEzQAA 
echo 8MMAAFjCAAAAAAAAAAAAABTNAAAsxAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0xAAA 
echo PsQAAFTEAABkxAAAcsQAAAAAAACCxAAAmsQAALLEAADAxAAA2MQAAO7EAAAExQAA 
echo FsUAADTFAABIxQAAXMUAAHDFAACGxQAAnMUAAKzFAADAxQAA2sUAAOzFAAD+xQAA 
echo DsYAACjGAAA4xgAAVMYAAGzGAAB8xgAAjMYAAKbGAAC6xgAA0MYAAO7GAAAGxwAA 
echo IscAADTHAABGxwAAZMcAAILHAACKxwAAnscAAKzHAADIxwAA2scAAOrHAAAAyAAA 
echo FsgAAAAAAAAsyAAAOsgAAErIAABWyAAAZsgAAHjIAACMyAAAlsgAAKTIAACuyAAA 
echo uMgAAMTIAADMyAAA1MgAAN7IAADoyAAA8MgAAPrIAAACyQAACskAABTJAAAcyQAA 
echo JMkAAC7JAAA4yQAAQskAAEzJAABWyQAAXskAAGjJAAByyQAAfMkAAIbJAACQyQAA 
echo mskAAKTJAACuyQAAuMkAAMLJAADKyQAA0skAANzJAADoyQAA8skAAP7JAAAIygAA 
echo AAAAABLKAAAAAAAAJMoAADDKAABEygAAVMoAAFzKAABwygAAgsoAAJLKAACgygAA 
echo rMoAALjKAADIygAA5soAAPjKAAAAAAAACMsAAAAAAAA0xAAAPsQAAFTEAABkxAAA 
echo csQAAAAAAACCxAAAmsQAALLEAADAxAAA2MQAAO7EAAAExQAAFsUAADTFAABIxQAA 
echo XMUAAHDFAACGxQAAnMUAAKzFAADAxQAA2sUAAOzFAAD+xQAADsYAACjGAAA4xgAA 
echo VMYAAGzGAAB8xgAAjMYAAKbGAAC6xgAA0MYAAO7GAAAGxwAAIscAADTHAABGxwAA 
echo ZMcAAILHAACKxwAAnscAAKzHAADIxwAA2scAAOrHAAAAyAAAFsgAAAAAAAAsyAAA 
echo OsgAAErIAABWyAAAZsgAAHjIAACMyAAAlsgAAKTIAACuyAAAuMgAAMTIAADMyAAA 
echo 1MgAAN7IAADoyAAA8MgAAPrIAAACyQAACskAABTJAAAcyQAAJMkAAC7JAAA4yQAA 
echo QskAAEzJAABWyQAAXskAAGjJAAByyQAAfMkAAIbJAACQyQAAmskAAKTJAACuyQAA 
echo uMkAAMLJAADKyQAA0skAANzJAADoyQAA8skAAP7JAAAIygAAAAAAABLKAAAAAAAA 
echo JMoAADDKAABEygAAVMoAAFzKAABwygAAgsoAAJLKAACgygAArMoAALjKAADIygAA 
echo 5soAAPjKAAAAAAAACMsAAAAAAAAMAEJpdEJsdAAAIgBDcmVhdGVDb21wYXRpYmxl 
echo REMAAEsARGVsZXRlT2JqZWN0AADOAEdldE9iamVjdEEAADEBU2VsZWN0T2JqZWN0 
echo AADUAERlbGV0ZUNyaXRpY2FsU2VjdGlvbgDvAEVudGVyQ3JpdGljYWxTZWN0aW9u 
echo AABkAUZyZWVMaWJyYXJ5AKQBR2V0Q29uc29sZUN1cnNvckluZm8AAKcBR2V0Q29u 
echo c29sZUZvbnRJbmZvAACoAUdldENvbnNvbGVGb250U2l6ZQAAsAFHZXRDb25zb2xl 
echo TW9kZQAAtgFHZXRDb25zb2xlU2NyZWVuQnVmZmVySW5mbwAAuQFHZXRDb25zb2xl 
echo VGl0bGVBAAC7AUdldENvbnNvbGVXaW5kb3cAAMQBR2V0Q3VycmVudFByb2Nlc3MA 
echo xQFHZXRDdXJyZW50UHJvY2Vzc0lkAMkBR2V0Q3VycmVudFRocmVhZElkAAADAkdl 
echo dExhc3RFcnJvcgAAFQJHZXRNb2R1bGVIYW5kbGVBAAA0AkdldE51bWJlck9mQ29u 
echo c29sZUZvbnRzAEUCR2V0UHJvY0FkZHJlc3MAAGQCR2V0U3RhcnR1cEluZm9BAGYC 
echo R2V0U3RkSGFuZGxlAAB7AkdldFN5c3RlbVRpbWVBc0ZpbGVUaW1lAJcCR2V0VGlj 
echo a0NvdW50AADrAkluaXRpYWxpemVDcml0aWNhbFNlY3Rpb24AJgNMZWF2ZUNyaXRp 
echo Y2FsU2VjdGlvbgAAKQNMb2FkTGlicmFyeUEAACwDTG9hZExpYnJhcnlXAACTA1F1 
echo ZXJ5UGVyZm9ybWFuY2VDb3VudGVyAKIDUmVhZENvbnNvbGVJbnB1dEEApgNSZWFk 
echo Q29uc29sZU91dHB1dEEAAN0DU2Nyb2xsQ29uc29sZVNjcmVlbkJ1ZmZlckEAAPMD 
echo U2V0Q29uc29sZUN1cnNvckluZm8AAPUDU2V0Q29uc29sZUN1cnNvclBvc2l0aW9u 
echo AAD3A1NldENvbnNvbGVGb250AAABBFNldENvbnNvbGVNb2RlAAAJBFNldENvbnNv 
echo bGVTY3JlZW5CdWZmZXJTaXplAABnBFNldFVuaGFuZGxlZEV4Y2VwdGlvbkZpbHRl 
echo cgB0BFNsZWVwAIIEVGVybWluYXRlUHJvY2VzcwAAiQRUbHNHZXRWYWx1ZQCWBFVu 
echo aGFuZGxlZEV4Y2VwdGlvbkZpbHRlcgAAtgRWaXJ0dWFsUHJvdGVjdAAAuQRWaXJ0 
echo dWFsUXVlcnkAAMIEV2FpdEZvclNpbmdsZU9iamVjdADkBFdyaXRlQ29uc29sZUlu 
echo cHV0QQAA6ARXcml0ZUNvbnNvbGVPdXRwdXRBADcAX19kbGxvbmV4aXQAOgBfX2dl 
echo dG1haW5hcmdzADsAX19pbml0ZW52AEQAX19sY29udl9pbml0AABoAF9fc2V0X2Fw 
echo cF90eXBlAABrAF9fc2V0dXNlcm1hdGhlcnIAAHkAX2FjbWRsbgCOAF9hbXNnX2V4 
echo aXQAAJ8AX2NleGl0AADyAF9mbW9kZQAAMAFfaW5pdHRlcm0ANAFfaW9iAACVAV9s 
echo b2NrADICX29uZXhpdABGA2NhbGxvYwAAUANleGl0AABTA2ZjbG9zZQAAWQNmZ2V0 
echo cwBeA2ZvcGVuAGADZnByaW50ZgBmA2ZyZWFkAGcDZnJlZQAAcgNmd3JpdGUAAJ4D 
echo bWFsbG9jAACmA21lbWNweQAArQNwcmludGYAALADcHV0Y2hhcgCxA3B1dHMAAMED 
echo c2lnbmFsAADEA3NwcmludGYAzANzdHJjbXAAAM4Dc3RyY3B5AADTA3N0cmxlbgAA 
echo 1gNzdHJuY21wANwDc3Ryc3RyAADeA3N0cnRvawAA4ANzdHJ0b2wAAOoDX3VubG9j 
echo awA7BGFib3J0AEQEYXRvaQAAUgR0b3VwcGVyAFcEdmZwcmludGYAAGgEd2NzY3B5 
echo AADIBF9zdHJpY21wAADnBF9rYmhpdAAA7wRfZ2V0Y2gAAL8AU0hHZXRGaWxlSW5m 
echo b0EAAEYAQ29weUltYWdlAOAAR2V0QXN5bmNLZXlTdGF0ZQAA+ABHZXRDdXJzb3JQ 
echo b3MAAPkAR2V0REMASgFHZXRTeXN0ZW1NZXRyaWNzAABaAUdldFdpbmRvd0xvbmdB 
echo AABgAUdldFdpbmRvd1JlY3QAnwFMb2FkSW1hZ2VBAADyAVJlbGVhc2VEQwD/AVNl 
echo bmRJbnB1dAASAlNldEN1cnNvclBvcwAAHgJTZXRMYXllcmVkV2luZG93QXR0cmli 
echo dXRlcwAAPgJTZXRXaW5kb3dMb25nQQAAQQJTZXRXaW5kb3dQb3MAAAgAUGxheVNv 
echo dW5kQQAAAAAAwAAAAMAAAADAAAAAwAAAAMAAAEdESTMyLmRsbAAAABTAAAAUwAAA 
echo FMAAABTAAAAUwAAAFMAAABTAAAAUwAAAFMAAABTAAAAUwAAAFMAAABTAAAAUwAAA 
echo FMAAABTAAAAUwAAAFMAAABTAAAAUwAAAFMAAABTAAAAUwAAAFMAAABTAAAAUwAAA 
echo FMAAABTAAAAUwAAAFMAAABTAAAAUwAAAFMAAABTAAAAUwAAAFMAAABTAAAAUwAAA 
echo FMAAABTAAAAUwAAAFMAAABTAAAAUwAAAS0VSTkVMMzIuZGxsAAAAACjAAAAowAAA 
echo KMAAACjAAAAowAAAKMAAACjAAAAowAAAKMAAACjAAAAowAAAKMAAACjAAAAowAAA 
echo KMAAACjAAAAowAAAKMAAACjAAAAowAAAKMAAACjAAAAowAAAKMAAACjAAAAowAAA 
echo KMAAACjAAAAowAAAKMAAACjAAAAowAAAKMAAACjAAAAowAAAKMAAACjAAAAowAAA 
echo KMAAACjAAAAowAAAKMAAACjAAAAowAAAKMAAACjAAABtc3ZjcnQuZGxsAAA8wAAA 
echo U0hFTEwzMi5kbGwAUMAAAFDAAABQwAAAUMAAAFDAAABQwAAAUMAAAFDAAABQwAAA 
echo UMAAAFDAAABQwAAAUMAAAFDAAABVU0VSMzIuZGxsAABkwAAAV0lOTU0uRExMAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMBFAAAAAAAAAAAAA 
echo EBBAAMAuQAAAAAAAAAAAAHAwQAAgMEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAA4EAAHOBAAJCzQAAg0EAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo LmZpbGUAAAAqAAAA/v8AAGcBY3J0ZXhlLmMAAAAAAAAAAAAAAAAAAAQAAAAAAAAA 
echo AQAgAAMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAACUAAAAQAAAAAQAgAAMAAAAAADEA 
echo AAAIAAAABQAAAAMAAAAAAD0AAAAwAQAAAQAgAAMAAAAAAEsAAAAAAAAABQAAAAMA 
echo X2VudnAAAAAQAAAABQAAAAMAX2FyZ3YAAAAUAAAABQAAAAMAX2FyZ2MAAAAYAAAA 
echo BQAAAAMAAAAAAFYAAABwAQAAAQAgAAMAAAAAAGkAAAAEAAAABQAAAAMAX21haW5y 
echo ZXQMAAAABQAAAAMAAAAAAHQAAADABAAAAQAgAAIAAAAAAIcAAADgBAAAAQAgAAIA 
echo LnRleHQAAAAAAAAAAQAAAAMB+gQAAFgAAAAAAAAAAAAAAAAALmRhdGEAAAAAAAAA 
echo AgAAAAMBBAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAAAAAAAABQAAAAMBHAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAJcAAAAEAAAABwAAAAMBBAAAAAEAAAAAAAAAAAAAAAAA 
echo AAAAAKEAAAAQAAAABwAAAAMBBAAAAAEAAAAAAAAAAAAAAAAAAAAAAKsAAAC4GgAA 
echo AwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAAAAAAALYAAAAABQAAAQAgAAIBAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAMwAAADwBQAAAQAgAAIALnRleHQAAAAABQAAAQAAAAMB 
echo HgEAABwAAAAAAAAAAAAAAAAALmRhdGEAAAAEAAAAAgAAAAMBBAAAAAAAAAAAAAAA 
echo AAAAAAAALmJzcwAAAAAcAAAABQAAAAMBGAAAAAAAAAAAAAAAAAAAAAAAAAAAAOQA 
echo AAAAAAAABAAAAAMBZAAAAAIAAAAAAAAAAAAAAAAALnJkYXRhAAAAAAAAAwAAAAMB 
echo YwAAAAAAAAAAAAAAAAAAAAAALmpjcgAAAAAwAAAAAgAAAAMALmZpbGUAAABMAAAA 
echo /v8AAGcBY21kd2l6LmMAAAAAAAAAAAAAX0dldERpbQAgBgAAAQAgAAIBAAAAAAAA 
echo AAAAAAAAAAAAAAAAX0dldFhZAADgBgAAAQAgAAIAAAAAAO4AAAAwBwAAAQAgAAIA 
echo AAAAAAABAABQCAAAAQAgAAIAAAAAAA8BAACQCgAAAQAgAAIAX0dvdG9YWQDACgAA 
echo AQAgAAIAAAAAABkBAACwCwAAAQAgAAIAAAAAACUBAABADAAAAQAgAAIAAAAAADAB 
echo AACAEQAAAQAgAAIAAAAAADsBAAAwEwAAAQAgAAIAAAAAAEsBAABgFAAAAQAgAAIA 
echo AAAAAFsBAABQFQAAAQAgAAIAAAAAAHUBAAAgFgAAAQAgAAIAX1NldEZvbnQgGQAA 
echo AQAgAAIAX0dldEZvbnSgGwAAAQAgAAIAAAAAAIEBAAAwHAAAAQAgAAIAX21haW4A 
echo AADgLwAAAQAgAAIALnRleHQAAAAgBgAAAQAAAAMBGxcAAGQAAAAAAAAAAAAAAAAA 
echo LmRhdGEAAAAIAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAAA0AAAA 
echo BQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALnJkYXRhAABoAAAAAwAAAAMBGBgAAAYA 
echo AAAAAAAAAAAAAAAAAAAAAJIBAADgLwAAAQAAAAMBsCcAAI0BAAAAAAAAAAAAAAAA 
echo AAAAAKsAAADgGgAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAAAAAAAOQAAABkAAAA 
echo BAAAAAMBmAYAABEAAAAAAAAAAAAAAAAALmZpbGUAAABaAAAA/v8AAGcBZmFrZQAA 
echo AAAAAAAAAAAAAAAAaG5hbWUAAAAcAgAABgAAAAMAZnRodW5rAADwAwAABgAAAAMA 
echo LnRleHQAAABAHQAAAQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmRhdGEAAAAIAAAA 
echo AgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAAA0AAAABQAAAAMBAAAAAAAA 
echo AAAAAAAAAAAAAAAALmlkYXRhJDJQAAAABgAAAAMBFAAAAAMAAAAAAAAAAAAAAAAA 
echo LmlkYXRhJDQcAgAABgAAAAMALmlkYXRhJDXwAwAABgAAAAMALmZpbGUAAABoAAAA 
echo /v8AAGcBZmFrZQAAAAAAAAAAAAAAAAAALnRleHQAAABAHQAAAQAAAAMBAAAAAAAA 
echo AAAAAAAAAAAAAAAALmRhdGEAAAAIAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAA 
echo LmJzcwAAAAA0AAAABQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDRUAgAA 
echo BgAAAAMBBAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDUoBAAABgAAAAMBBAAAAAAA 
echo AAAAAAAAAAAAAAAALmlkYXRhJDcEDQAABgAAAAMBCwAAAAAAAAAAAAAAAAAAAAAA 
echo LmZpbGUAAAB2AAAA/v8AAGcBZmFrZQAAAAAAAAAAAAAAAAAAaG5hbWUAAABYAgAA 
echo BgAAAAMAZnRodW5rAAAsBAAABgAAAAMALnRleHQAAABAHQAAAQAAAAMBAAAAAAAA 
echo AAAAAAAAAAAAAAAALmRhdGEAAAAIAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAA 
echo LmJzcwAAAAA0AAAABQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDJkAAAA 
echo BgAAAAMBFAAAAAMAAAAAAAAAAAAAAAAALmlkYXRhJDRYAgAABgAAAAMALmlkYXRh 
echo JDUsBAAABgAAAAMALmZpbGUAAACEAAAA/v8AAGcBZmFrZQAAAAAAAAAAAAAAAAAA 
echo LnRleHQAAABAHQAAAQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmRhdGEAAAAIAAAA 
echo AgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAAA0AAAABQAAAAMBAAAAAAAA 
echo AAAAAAAAAAAAAAAALmlkYXRhJDRcAgAABgAAAAMBBAAAAAAAAAAAAAAAAAAAAAAA 
echo LmlkYXRhJDUwBAAABgAAAAMBBAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDcUDQAA 
echo BgAAAAMBCgAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAACSAAAA/v8AAGcBZmFrZQAA 
echo AAAAAAAAAAAAAAAAaG5hbWUAAACMAAAABgAAAAMAZnRodW5rAABgAgAABgAAAAMA 
echo LnRleHQAAABAHQAAAQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmRhdGEAAAAIAAAA 
echo AgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAAA0AAAABQAAAAMBAAAAAAAA 
echo AAAAAAAAAAAAAAAALmlkYXRhJDIAAAAABgAAAAMBFAAAAAMAAAAAAAAAAAAAAAAA 
echo LmlkYXRhJDSMAAAABgAAAAMALmlkYXRhJDVgAgAABgAAAAMALmZpbGUAAACgAAAA 
echo /v8AAGcBZmFrZQAAAAAAAAAAAAAAAAAALnRleHQAAABAHQAAAQAAAAMBAAAAAAAA 
echo AAAAAAAAAAAAAAAALmRhdGEAAAAIAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAA 
echo LmJzcwAAAAA0AAAABQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDSgAAAA 
echo BgAAAAMBBAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDV0AgAABgAAAAMBBAAAAAAA 
echo AAAAAAAAAAAAAAAALmlkYXRhJDcsCwAABgAAAAMBCgAAAAAAAAAAAAAAAAAAAAAA 
echo LmZpbGUAAACtAAAA/v8AAGcBYXRvbmV4aXQuYwAAAAAAAAAAAAAAAKABAABAHQAA 
echo AQAgAAIBAAAAAAAAAAAAAAAAAAAAAAAAX2F0ZXhpdAAAHgAAAQAgAAIALnRleHQA 
echo AABAHQAAAQAAAAMB3QAAAA4AAAAAAAAAAAAAAAAALmRhdGEAAAAIAAAAAgAAAAMB 
echo AAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAAA0AAAABQAAAAMBAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAKsAAAD0GgAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAALmZpbGUA 
echo AAC9AAAA/v8AAGcBZ2NjbWFpbi5jAAAAAAAAAAAAAAAAAK4BAAAgHgAAAQAgAAIB 
echo AAAAAAAAAAAAAAAAAAAAAAAAX3AuNjU0MTQIAAAAAgAAAAMAAAAAAMEBAABQHgAA 
echo AQAgAAIAX19fbWFpbgCgHgAAAQAgAAIAAAAAANQBAAA0AAAABQAAAAMALnRleHQA 
echo AAAgHgAAAQAAAAMBnAAAAAoAAAAAAAAAAAAAAAAALmRhdGEAAAAIAAAAAgAAAAMB 
echo BAAAAAEAAAAAAAAAAAAAAAAALmJzcwAAAAA0AAAABQAAAAMBBAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAKsAAAAIGwAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAALmZpbGUA 
echo AADHAAAA/v8AAGcBbmF0c3RhcnQuYwAAAAAAAAAALnRleHQAAADAHgAAAQAAAAMB 
echo AAAAAAAAAAAAAAAAAAAAAAAALmRhdGEAAAAMAAAAAgAAAAMBCAAAAAAAAAAAAAAA 
echo AAAAAAAALmJzcwAAAAA4AAAABQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKsA 
echo AAAcGwAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAADRAAAA/v8AAGcB 
echo d2lsZGNhcmQuYwAAAAAAAAAALnRleHQAAADAHgAAAQAAAAMBAAAAAAAAAAAAAAAA 
echo AAAAAAAALmRhdGEAAAAUAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAA 
echo AAA4AAAABQAAAAMBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAKsAAAAwGwAAAwAAAAMB 
echo EQAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAADfAAAA/v8AAGcBY2hhcm1heC5jAAAA 
echo AAAAAAAAAAAAAOEBAADAHgAAAQAgAAMBAAAAAAAAAAAAAAAAAAAAAAAALnRleHQA 
echo AADAHgAAAQAAAAMBBgAAAAEAAAAAAAAAAAAAAAAALmRhdGEAAAAUAAAAAgAAAAMB 
echo BAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAAA8AAAABQAAAAMBBAAAAAAAAAAAAAAA 
echo AAAAAAAALkNSVCRYSUMUAAAABwAAAAMBBAAAAAEAAAAAAAAAAAAAAAAAAAAAAKsA 
echo AABEGwAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAADrAAAA/v8AAGcB 
echo ZGxsYXJndi5jAAAAAAAAAAAAAAAAAPABAADQHgAAAQAgAAIBAAAAAAAAAAAAAAAA 
echo AAAAAAAALnRleHQAAADQHgAAAQAAAAMBAwAAAAAAAAAAAAAAAAAAAAAALmRhdGEA 
echo AAAYAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAABAAAAABQAAAAMB 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAKsAAABYGwAAAwAAAAMBEQAAAAAAAAAAAAAA 
echo AAAAAAAALmZpbGUAAAABAQAA/v8AAGcBZ3Nfc3VwcG9ydC5jAAAAAAAAAAAAAPoB 
echo AADgHgAAAQAgAAIBAAAAAAAAAAAAAAAAAAAAAAAAAAAAABICAAAoAAAAAgAAAAMB 
echo BAAAAAAAAAAAAAAAAAADAAAAAAAAACoCAAAsAAAAAgAAAAMBBAAAAAAAAAAAAAAA 
echo AAADAAAAAAAAAE0CAACQHwAAAQAgAAIAAAAAAGECAAAgAwAABQAAAAMAAAAAAHUC 
echo AABAAAAABQAAAAMAAAAAAIcCAACAGAAAAwAAAAMALnRleHQAAADgHgAAAQAAAAMB 
echo NwEAABcAAAAAAAAAAAAAAAAALmRhdGEAAAAYAAAAAgAAAAMBAAAAAAAAAAAAAAAA 
echo AAAAAAAALmJzcwAAAABAAAAABQAAAAMBMAMAAAAAAAAAAAAAAAAAAAAALnJkYXRh 
echo AACAGAAAAwAAAAMBCAAAAAIAAAAAAAAAAAAAAAAAAAAAAKsAAABsGwAAAwAAAAMB 
echo EQAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAAALAQAA/v8AAGcBX25ld21vZGUuYwAA 
echo AAAAAAAALnRleHQAAAAgIAAAAQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmRhdGEA 
echo AAAYAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAACAAwAABQAAAAMB 
echo BAAAAAAAAAAAAAAAAAAAAAAAAAAAAKsAAACAGwAAAwAAAAMBEQAAAAAAAAAAAAAA 
echo AAAAAAAALmZpbGUAAAAvAQAA/v8AAGcBdGxzc3VwLmMAAAAAAAAAAAAAAAAAAJ0C 
echo AAAgIAAAAQAgAAMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAALACAABwIAAAAQAgAAIA 
echo X19feGRfYQAsAAAABwAAAAMAX19feGRfegAwAAAABwAAAAMAAAAAAMMCAADwIAAA 
echo AQAgAAIALnRleHQAAAAgIAAAAQAAAAMB0wAAAAYAAAAAAAAAAAAAAAAALmRhdGEA 
echo AAAYAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAACEAwAABQAAAAMB 
echo EAAAAAAAAAAAAAAAAAAAAAAALkNSVCRYTEQkAAAABwAAAAMBBAAAAAEAAAAAAAAA 
echo AAAAAAAALkNSVCRYTEMgAAAABwAAAAMBBAAAAAEAAAAAAAAAAAAAAAAALnJkYXRh 
echo AACIGAAAAwAAAAMBBAAAAAEAAAAAAAAAAAAAAAAALkNSVCRYRFowAAAABwAAAAMB 
echo BAAAAAAAAAAAAAAAAAAAAAAALkNSVCRYREEsAAAABwAAAAMBBAAAAAAAAAAAAAAA 
echo AAAAAAAALnRscwAAAAAEAAAACAAAAAMBGAAAAAQAAAAAAAAAAAAAAAAALkNSVCRY 
echo TFooAAAABwAAAAMBBAAAAAAAAAAAAAAAAAAAAAAALkNSVCRYTEEcAAAABwAAAAMB 
echo BAAAAAAAAAAAAAAAAAAAAAAALnRscyRaWlocAAAACAAAAAMBBAAAAAAAAAAAAAAA 
echo AAAAAAAALnRscyRBQUEAAAAACAAAAAMBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAKsA 
echo AACUGwAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAABBAQAA/v8AAGcB 
echo Y2luaXRleGUuYwAAAAAAAAAALnRleHQAAAAAIQAAAQAAAAMBAAAAAAAAAAAAAAAA 
echo AAAAAAAALmRhdGEAAAAYAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAA 
echo AACUAwAABQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALkNSVCRYQ1oIAAAABwAAAAMB 
echo BAAAAAAAAAAAAAAAAAAAAAAALkNSVCRYQ0EAAAAABwAAAAMBBAAAAAAAAAAAAAAA 
echo AAAAAAAALkNSVCRYSVoYAAAABwAAAAMBBAAAAAAAAAAAAAAAAAAAAAAALkNSVCRY 
echo SUEMAAAABwAAAAMBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAKsAAACoGwAAAwAAAAMB 
echo EQAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAABTAQAA/v8AAGcBbWVyci5jAAAAAAAA 
echo AAAAAAAAAAAAANACAAAAIQAAAQAgAAIBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOcC 
echo AACUAwAABQAAAAMAAAAAAPYCAABQIQAAAQAgAAIAAAAAAA4DAABgIQAAAQAgAAIA 
echo AAAAABgDAACoGQAAAwAAAAMALnRleHQAAAAAIQAAAQAAAAMBuwAAAAgAAAAAAAAA 
echo AAAAAAAALmRhdGEAAAAYAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAA 
echo AACUAwAABQAAAAMBBAAAAAAAAAAAAAAAAAAAAAAALnJkYXRhAACMGAAAAwAAAAMB 
echo NAEAAAYAAAAAAAAAAAAAAAAAAAAAAKsAAAC8GwAAAwAAAAMBEQAAAAAAAAAAAAAA 
echo AAAAAAAALmZpbGUAAABgAQAA/v8AAGcBQ1JUX2ZwMTAuYwAAAAAAAAAAAAAAACID 
echo AADAIQAAAQAgAAIBAAAAAAAAAAAAAAAAAAAAAAAAX2ZwcmVzZXTAIQAAAQAgAAIA 
echo LnRleHQAAADAIQAAAQAAAAMBAwAAAAAAAAAAAAAAAAAAAAAALmRhdGEAAAAYAAAA 
echo AgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAACYAwAABQAAAAMBAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAKsAAADQGwAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAA 
echo LmZpbGUAAABtAQAA/v8AAGcBbWluZ3dfaGVscGVycy5jAAAAAAAAACwDAADQIQAA 
echo AQAgAAIBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD0DAADgIQAAAQAgAAIALnRleHQA 
echo AADQIQAAAQAAAAMBFQAAAAAAAAAAAAAAAAAAAAAALmRhdGEAAAAYAAAAAgAAAAMB 
echo AAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAACYAwAABQAAAAMBBAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAKsAAADkGwAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAALmZpbGUA 
echo AACAAQAA/v8AAGcBcHNldWRvLXJlbG9jLmMAAAAAAAAAAE4DAADwIQAAAQAgAAMB 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAF4DAABQIgAAAQAgAAMAAAAAAHUDAACgAwAA 
echo BQAAAAMAAAAAAIIDAACkAwAABQAAAAMAAAAAAIwDAACQIwAAAQAgAAIAAAAAAKcD 
echo AACcAwAABQAAAAMALnRleHQAAADwIQAAAQAAAAMBYwQAADwAAAAAAAAAAAAAAAAA 
echo LmRhdGEAAAAYAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAACcAwAA 
echo BQAAAAMBDAAAAAAAAAAAAAAAAAAAAAAALnJkYXRhAADAGQAAAwAAAAMB9gAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAKsAAAD4GwAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAA 
echo LmZpbGUAAACKAQAA/v8AAGcBeHR4dG1vZGUuYwAAAAAAAAAALnRleHQAAABgJgAA 
echo AQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmRhdGEAAAAYAAAAAgAAAAMBAAAAAAAA 
echo AAAAAAAAAAAAAAAALmJzcwAAAACoAwAABQAAAAMBBAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAKsAAAAMHAAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAACWAQAA 
echo /v8AAGcBY3J0X2hhbmRsZXIuYwAAAAAAAAAAALcDAABgJgAAAQAgAAIBAAAAAAAA 
echo AAAAAAAAAAAAAAAALnRleHQAAABgJgAAAQAAAAMBrgEAAAoAAAAAAAAAAAAAAAAA 
echo LmRhdGEAAAAYAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAACsAwAA 
echo BQAAAAMBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAKsAAAAgHAAAAwAAAAMBEQAAAAAA 
echo AAAAAAAAAAAAAAAALmZpbGUAAACoAQAA/v8AAGcBdGxzdGhyZC5jAAAAAAAAAAAA 
echo AAAAANEDAAAQKAAAAQAgAAMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPIDAAC4AwAA 
echo BQAAAAMAAAAAAAEEAACwAwAABQAAAAMAAAAAABAEAACAKAAAAQAgAAIAAAAAAC4E 
echo AAC0AwAABQAAAAMAAAAAAEIEAAAQKQAAAQAgAAIAAAAAAGMEAACwKQAAAQAgAAIA 
echo LnRleHQAAAAQKAAAAQAAAAMBfAIAACcAAAAAAAAAAAAAAAAALmRhdGEAAAAYAAAA 
echo AgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAACwAwAABQAAAAMBIAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAKsAAAA0HAAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAA 
echo LmZpbGUAAACyAQAA/v8AAGcBdGxzbWNydC5jAAAAAAAAAAAALnRleHQAAACQKgAA 
echo AQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmRhdGEAAAAYAAAAAgAAAAMBBAAAAAAA 
echo AAAAAAAAAAAAAAAALmJzcwAAAADQAwAABQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAKsAAABIHAAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAAC8AQAA 
echo /v8AAGcBAAAAAHgEAAAAAAAAAAAAAAAALnRleHQAAACQKgAAAQAAAAMBAAAAAAAA 
echo AAAAAAAAAAAAAAAALmRhdGEAAAAcAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAA 
echo LmJzcwAAAADQAwAABQAAAAMBAgAAAAAAAAAAAAAAAAAAAAAAAAAAAKsAAABcHAAA 
echo AwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAADRAQAA/v8AAGcBcGVzZWN0 
echo LmMAAAAAAAAAAAAAAAAAAIwEAACQKgAAAQAgAAMBAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAKcEAACwKgAAAQAgAAIAAAAAALsEAADQKgAAAQAgAAIAAAAAAMsEAAAQKwAA 
echo AQAgAAIAAAAAAOEEAACgKwAAAQAgAAIAAAAAAP8EAAAQLAAAAQAgAAIAAAAAABgF 
echo AABALAAAAQAgAAIAAAAAACwFAACwLAAAAQAgAAIAAAAAAD0FAADgLAAAAQAgAAIA 
echo AAAAAFsFAABgLQAAAQAgAAIALnRleHQAAACQKgAAAQAAAAMBdwMAACYAAAAAAAAA 
echo AAAAAAAALmRhdGEAAAAcAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAA 
echo AADUAwAABQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKsAAABwHAAAAwAAAAMB 
echo EQAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAAAPAwAA/v8AAGcBbWluZ3dfbWF0aGVy 
echo ci5jAAAALnRleHQAAAA8LgAAAQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmRhdGEA 
echo AAAcAAAAAgAAAAMBBAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAADUAwAABQAAAAMB 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAKsAAACYHAAAAwAAAAMBEQAAAAAAAAAAAAAA 
echo AAAAAAAALnRleHQAAAA8LgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAA 
echo AADUAwAABQAAAAMALmlkYXRhJDesDAAABgAAAAMALmlkYXRhJDXgAwAABgAAAAMA 
echo LmlkYXRhJDQMAgAABgAAAAMALmlkYXRhJDYICgAABgAAAAMALnRleHQAAABELgAA 
echo AQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRh 
echo JDeoDAAABgAAAAMALmlkYXRhJDXcAwAABgAAAAMALmlkYXRhJDQIAgAABgAAAAMA 
echo LmlkYXRhJDb+CQAABgAAAAMALnRleHQAAABMLgAAAQAAAAMALmRhdGEAAAAgAAAA 
echo AgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDekDAAABgAAAAMALmlkYXRh 
echo JDXYAwAABgAAAAMALmlkYXRhJDQEAgAABgAAAAMALmlkYXRhJDbyCQAABgAAAAMA 
echo LnRleHQAAABULgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAA 
echo BQAAAAMALmlkYXRhJDegDAAABgAAAAMALmlkYXRhJDXUAwAABgAAAAMALmlkYXRh 
echo JDQAAgAABgAAAAMALmlkYXRhJDboCQAABgAAAAMALnRleHQAAABcLgAAAQAAAAMA 
echo LmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDecDAAA 
echo BgAAAAMALmlkYXRhJDXQAwAABgAAAAMALmlkYXRhJDT8AQAABgAAAAMALmlkYXRh 
echo JDbcCQAABgAAAAMALnRleHQAAABkLgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMA 
echo LmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDeUDAAABgAAAAMALmlkYXRhJDXIAwAA 
echo BgAAAAMALmlkYXRhJDT0AQAABgAAAAMALmlkYXRhJDbKCQAABgAAAAMALnRleHQA 
echo AABsLgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMA 
echo LmlkYXRhJDeQDAAABgAAAAMALmlkYXRhJDXEAwAABgAAAAMALmlkYXRhJDTwAQAA 
echo BgAAAAMALmlkYXRhJDbCCQAABgAAAAMALnRleHQAAAB0LgAAAQAAAAMALmRhdGEA 
echo AAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDeMDAAABgAAAAMA 
echo LmlkYXRhJDXAAwAABgAAAAMALmlkYXRhJDTsAQAABgAAAAMALmlkYXRhJDa4CQAA 
echo BgAAAAMALnRleHQAAAB8LgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAA 
echo AADUAwAABQAAAAMALmlkYXRhJDeIDAAABgAAAAMALmlkYXRhJDW8AwAABgAAAAMA 
echo LmlkYXRhJDToAQAABgAAAAMALmlkYXRhJDauCQAABgAAAAMALnRleHQAAACELgAA 
echo AQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRh 
echo JDeEDAAABgAAAAMALmlkYXRhJDW4AwAABgAAAAMALmlkYXRhJDTkAQAABgAAAAMA 
echo LmlkYXRhJDakCQAABgAAAAMALnRleHQAAACMLgAAAQAAAAMALmRhdGEAAAAgAAAA 
echo AgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDeADAAABgAAAAMALmlkYXRh 
echo JDW0AwAABgAAAAMALmlkYXRhJDTgAQAABgAAAAMALmlkYXRhJDaaCQAABgAAAAMA 
echo LnRleHQAAACULgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAA 
echo BQAAAAMALmlkYXRhJDd8DAAABgAAAAMALmlkYXRhJDWwAwAABgAAAAMALmlkYXRh 
echo JDTcAQAABgAAAAMALmlkYXRhJDaQCQAABgAAAAMALnRleHQAAACcLgAAAQAAAAMA 
echo LmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDd4DAAA 
echo BgAAAAMALmlkYXRhJDWsAwAABgAAAAMALmlkYXRhJDTYAQAABgAAAAMALmlkYXRh 
echo JDaGCQAABgAAAAMALnRleHQAAACkLgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMA 
echo LmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDd0DAAABgAAAAMALmlkYXRhJDWoAwAA 
echo BgAAAAMALmlkYXRhJDTUAQAABgAAAAMALmlkYXRhJDZ8CQAABgAAAAMALnRleHQA 
echo AACsLgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMA 
echo LmlkYXRhJDdwDAAABgAAAAMALmlkYXRhJDWkAwAABgAAAAMALmlkYXRhJDTQAQAA 
echo BgAAAAMALmlkYXRhJDZyCQAABgAAAAMALnRleHQAAAC0LgAAAQAAAAMALmRhdGEA 
echo AAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDdsDAAABgAAAAMA 
echo LmlkYXRhJDWgAwAABgAAAAMALmlkYXRhJDTMAQAABgAAAAMALmlkYXRhJDZoCQAA 
echo BgAAAAMALnRleHQAAAC8LgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAA 
echo AADUAwAABQAAAAMALmlkYXRhJDdoDAAABgAAAAMALmlkYXRhJDWcAwAABgAAAAMA 
echo LmlkYXRhJDTIAQAABgAAAAMALmlkYXRhJDZeCQAABgAAAAMALnRleHQAAADELgAA 
echo AQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRh 
echo JDdkDAAABgAAAAMALmlkYXRhJDWYAwAABgAAAAMALmlkYXRhJDTEAQAABgAAAAMA 
echo LmlkYXRhJDZWCQAABgAAAAMALnRleHQAAADMLgAAAQAAAAMALmRhdGEAAAAgAAAA 
echo AgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDdgDAAABgAAAAMALmlkYXRh 
echo JDWUAwAABgAAAAMALmlkYXRhJDTAAQAABgAAAAMALmlkYXRhJDZMCQAABgAAAAMA 
echo LnRleHQAAADULgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAA 
echo BQAAAAMALmlkYXRhJDdcDAAABgAAAAMALmlkYXRhJDWQAwAABgAAAAMALmlkYXRh 
echo JDS8AQAABgAAAAMALmlkYXRhJDZCCQAABgAAAAMALnRleHQAAADcLgAAAQAAAAMA 
echo LmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDdYDAAA 
echo BgAAAAMALmlkYXRhJDWMAwAABgAAAAMALmlkYXRhJDS4AQAABgAAAAMALmlkYXRh 
echo JDY4CQAABgAAAAMALnRleHQAAADkLgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMA 
echo LmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDdUDAAABgAAAAMALmlkYXRhJDWIAwAA 
echo BgAAAAMALmlkYXRhJDS0AQAABgAAAAMALmlkYXRhJDYuCQAABgAAAAMALnRleHQA 
echo AADsLgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMA 
echo LmlkYXRhJDdQDAAABgAAAAMALmlkYXRhJDWEAwAABgAAAAMALmlkYXRhJDSwAQAA 
echo BgAAAAMALmlkYXRhJDYkCQAABgAAAAMALnRleHQAAAD0LgAAAQAAAAMALmRhdGEA 
echo AAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDdMDAAABgAAAAMA 
echo LmlkYXRhJDWAAwAABgAAAAMALmlkYXRhJDSsAQAABgAAAAMALmlkYXRhJDYcCQAA 
echo BgAAAAMALnRleHQAAAD8LgAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAA 
echo AADUAwAABQAAAAMALmlkYXRhJDdIDAAABgAAAAMALmlkYXRhJDV8AwAABgAAAAMA 
echo LmlkYXRhJDSoAQAABgAAAAMALmlkYXRhJDYUCQAABgAAAAMALnRleHQAAAAELwAA 
echo AQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRh 
echo JDdEDAAABgAAAAMALmlkYXRhJDV4AwAABgAAAAMALmlkYXRhJDSkAQAABgAAAAMA 
echo LmlkYXRhJDYKCQAABgAAAAMALnRleHQAAAAMLwAAAQAAAAMALmRhdGEAAAAgAAAA 
echo AgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDdADAAABgAAAAMALmlkYXRh 
echo JDV0AwAABgAAAAMALmlkYXRhJDSgAQAABgAAAAMALmlkYXRhJDYCCQAABgAAAAMA 
echo LnRleHQAAAAULwAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAA 
echo BQAAAAMALmlkYXRhJDc8DAAABgAAAAMALmlkYXRhJDVwAwAABgAAAAMALmlkYXRh 
echo JDScAQAABgAAAAMALmlkYXRhJDb6CAAABgAAAAMALnRleHQAAAAcLwAAAQAAAAMA 
echo LmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDc4DAAA 
echo BgAAAAMALmlkYXRhJDVsAwAABgAAAAMALmlkYXRhJDSYAQAABgAAAAMALmlkYXRh 
echo JDbwCAAABgAAAAMALnRleHQAAAAkLwAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMA 
echo LmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDc0DAAABgAAAAMALmlkYXRhJDVoAwAA 
echo BgAAAAMALmlkYXRhJDSUAQAABgAAAAMALmlkYXRhJDboCAAABgAAAAMALnRleHQA 
echo AAAsLwAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMA 
echo LmlkYXRhJDcwDAAABgAAAAMALmlkYXRhJDVkAwAABgAAAAMALmlkYXRhJDSQAQAA 
echo BgAAAAMALmlkYXRhJDbeCAAABgAAAAMALnRleHQAAAA0LwAAAQAAAAMALmRhdGEA 
echo AAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDcsDAAABgAAAAMA 
echo LmlkYXRhJDVgAwAABgAAAAMALmlkYXRhJDSMAQAABgAAAAMALmlkYXRhJDbUCAAA 
echo BgAAAAMALnRleHQAAAA0LwAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAA 
echo AADUAwAABQAAAAMALmlkYXRhJDcoDAAABgAAAAMALmlkYXRhJDVcAwAABgAAAAMA 
echo LmlkYXRhJDSIAQAABgAAAAMALmlkYXRhJDbMCAAABgAAAAMALnRleHQAAAA8LwAA 
echo AQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRh 
echo JDckDAAABgAAAAMALmlkYXRhJDVYAwAABgAAAAMALmlkYXRhJDSEAQAABgAAAAMA 
echo LmlkYXRhJDbECAAABgAAAAMALnRleHQAAAA8LwAAAQAAAAMALmRhdGEAAAAgAAAA 
echo AgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDcgDAAABgAAAAMALmlkYXRh 
echo JDVUAwAABgAAAAMALmlkYXRhJDSAAQAABgAAAAMALmlkYXRhJDa4CAAABgAAAAMA 
echo LnRleHQAAABELwAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAA 
echo BQAAAAMALmlkYXRhJDccDAAABgAAAAMALmlkYXRhJDVQAwAABgAAAAMALmlkYXRh 
echo JDR8AQAABgAAAAMALmlkYXRhJDauCAAABgAAAAMALnRleHQAAABELwAAAQAAAAMA 
echo LmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDcYDAAA 
echo BgAAAAMALmlkYXRhJDVMAwAABgAAAAMALmlkYXRhJDR4AQAABgAAAAMALmlkYXRh 
echo JDakCAAABgAAAAMALnRleHQAAABMLwAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMA 
echo LmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDcUDAAABgAAAAMALmlkYXRhJDVIAwAA 
echo BgAAAAMALmlkYXRhJDR0AQAABgAAAAMALmlkYXRhJDaWCAAABgAAAAMALnRleHQA 
echo AABULwAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMA 
echo LmlkYXRhJDcQDAAABgAAAAMALmlkYXRhJDVEAwAABgAAAAMALmlkYXRhJDRwAQAA 
echo BgAAAAMALmlkYXRhJDaMCAAABgAAAAMALnRleHQAAABULwAAAQAAAAMALmRhdGEA 
echo AAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDcMDAAABgAAAAMA 
echo LmlkYXRhJDVAAwAABgAAAAMALmlkYXRhJDRsAQAABgAAAAMALmlkYXRhJDZ4CAAA 
echo BgAAAAMALnRleHQAAABcLwAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAA 
echo AADUAwAABQAAAAMALmlkYXRhJDcIDAAABgAAAAMALmlkYXRhJDU8AwAABgAAAAMA 
echo LmlkYXRhJDRoAQAABgAAAAMALmlkYXRhJDZmCAAABgAAAAMALnRleHQAAABkLwAA 
echo AQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRh 
echo JDcADAAABgAAAAMALmlkYXRhJDU0AwAABgAAAAMALmlkYXRhJDRgAQAABgAAAAMA 
echo LmlkYXRhJDZKCAAABgAAAAMALnRleHQAAABkLwAAAQAAAAMALmRhdGEAAAAgAAAA 
echo AgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDf8CwAABgAAAAMALmlkYXRh 
echo JDUwAwAABgAAAAMALmlkYXRhJDRcAQAABgAAAAMALmlkYXRhJDY6CAAABgAAAAMA 
echo LnRleHQAAABsLwAAAQAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAA 
echo BQAAAAMALmlkYXRhJDf4CwAABgAAAAMALmlkYXRhJDUsAwAABgAAAAMALmlkYXRh 
echo JDRYAQAABgAAAAMALmlkYXRhJDYsCAAABgAAAAMALmZpbGUAAAAfAwAA/v8AAGcB 
echo AAAAAAgGAAAAAAAAAAAAAAAAAAAAAH4FAACALwAAAQAgAAMBAAAAAAAAAAAAAAAA 
echo AAAAAAAAX2hhbmRsZXLUAwAABQAAAAMAAAAAAKMFAACALwAAAQAgAAIAAAAAAMMF 
echo AACQLwAAAQAgAAMAAAAAAOgFAACQLwAAAQAgAAIALnRleHQAAACALwAAAQAAAAMB 
echo GwAAAAIAAAAAAAAAAAAAAAAALmRhdGEAAAAgAAAAAgAAAAMBCAAAAAIAAAAAAAAA 
echo AAAAAAAALmJzcwAAAADUAwAABQAAAAMBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAKsA 
echo AACsHAAAAwAAAAMBEQAAAAAAAAAAAAAAAAAAAAAALmZpbGUAAAAtAwAA/v8AAGcB 
echo ZmFrZQAAAAAAAAAAAAAAAAAAaG5hbWUAAABYAQAABgAAAAMAZnRodW5rAAAsAwAA 
echo BgAAAAMALnRleHQAAACgLwAAAQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmRhdGEA 
echo AAAoAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAADYAwAABQAAAAMB 
echo AAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDIoAAAABgAAAAMBFAAAAAMAAAAAAAAA 
echo AAAAAAAALmlkYXRhJDRYAQAABgAAAAMALmlkYXRhJDUsAwAABgAAAAMALmZpbGUA 
echo AAA7AwAA/v8AAGcBZmFrZQAAAAAAAAAAAAAAAAAALnRleHQAAACgLwAAAQAAAAMB 
echo AAAAAAAAAAAAAAAAAAAAAAAALmRhdGEAAAAoAAAAAgAAAAMBAAAAAAAAAAAAAAAA 
echo AAAAAAAALmJzcwAAAADYAwAABQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmlkYXRh 
echo JDQQAgAABgAAAAMBBAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDXkAwAABgAAAAMB 
echo BAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDewDAAABgAAAAMBCwAAAAAAAAAAAAAA 
echo AAAAAAAALmZpbGUAAABJAwAA/v8AAGcBZmFrZQAAAAAAAAAAAAAAAAAAaG5hbWUA 
echo AAAUAgAABgAAAAMAZnRodW5rAADoAwAABgAAAAMALnRleHQAAACgLwAAAQAAAAMB 
echo AAAAAAAAAAAAAAAAAAAAAAAALmRhdGEAAAAoAAAAAgAAAAMBAAAAAAAAAAAAAAAA 
echo AAAAAAAALmJzcwAAAADYAwAABQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmlkYXRh 
echo JDI8AAAABgAAAAMBFAAAAAMAAAAAAAAAAAAAAAAALmlkYXRhJDQUAgAABgAAAAMA 
echo LmlkYXRhJDXoAwAABgAAAAMALmZpbGUAAACIAwAA/v8AAGcBZmFrZQAAAAAAAAAA 
echo AAAAAAAALnRleHQAAACgLwAAAQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmRhdGEA 
echo AAAoAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAADYAwAABQAAAAMB 
echo AAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDQYAgAABgAAAAMBBAAAAAAAAAAAAAAA 
echo AAAAAAAALmlkYXRhJDXsAwAABgAAAAMBBAAAAAAAAAAAAAAAAAAAAAAALmlkYXRh 
echo JDfADAAABgAAAAMBDAAAAAAAAAAAAAAAAAAAAAAALnRleHQAAACgLwAAAQAAAAMA 
echo LmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDe0CwAA 
echo BgAAAAMALmlkYXRhJDX0AgAABgAAAAMALmlkYXRhJDQgAQAABgAAAAMALmlkYXRh 
echo JDYiBwAABgAAAAMALnRleHQAAACoLwAAAQAAAAMALmRhdGEAAAAoAAAAAgAAAAMA 
echo LmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDeUCwAABgAAAAMALmlkYXRhJDXUAgAA 
echo BgAAAAMALmlkYXRhJDQAAQAABgAAAAMALmlkYXRhJDZsBgAABgAAAAMALnRleHQA 
echo AACwLwAAAQAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMA 
echo LmlkYXRhJDd4CwAABgAAAAMALmlkYXRhJDW4AgAABgAAAAMALmlkYXRhJDTkAAAA 
echo BgAAAAMALmlkYXRhJDbaBQAABgAAAAMALnRleHQAAAC4LwAAAQAAAAMALmRhdGEA 
echo AAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDd0CwAABgAAAAMA 
echo LmlkYXRhJDW0AgAABgAAAAMALmlkYXRhJDTgAAAABgAAAAMALmlkYXRhJDbABQAA 
echo BgAAAAMALnRleHQAAADALwAAAQAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAA 
echo AADYAwAABQAAAAMALmlkYXRhJDdwCwAABgAAAAMALmlkYXRhJDWwAgAABgAAAAMA 
echo LmlkYXRhJDTcAAAABgAAAAMALmlkYXRhJDasBQAABgAAAAMALnRleHQAAADILwAA 
echo AQAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRh 
echo JDdICwAABgAAAAMALmlkYXRhJDWIAgAABgAAAAMALmlkYXRhJDS0AAAABgAAAAMA 
echo LmlkYXRhJDbYBAAABgAAAAMALnRleHQAAADQLwAAAQAAAAMALmRhdGEAAAAoAAAA 
echo AgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDdACwAABgAAAAMALmlkYXRh 
echo JDWAAgAABgAAAAMALmlkYXRhJDSsAAAABgAAAAMALmlkYXRhJDayBAAABgAAAAMA 
echo LmZpbGUAAACWAwAA/v8AAGcBZmFrZQAAAAAAAAAAAAAAAAAAaG5hbWUAAACkAAAA 
echo BgAAAAMAZnRodW5rAAB4AgAABgAAAAMALnRleHQAAADYLwAAAQAAAAMBAAAAAAAA 
echo AAAAAAAAAAAAAAAALmRhdGEAAAAoAAAAAgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAA 
echo LmJzcwAAAADYAwAABQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDIUAAAA 
echo BgAAAAMBFAAAAAMAAAAAAAAAAAAAAAAALmlkYXRhJDSkAAAABgAAAAMALmlkYXRh 
echo JDV4AgAABgAAAAMALmZpbGUAAABKBQAA/v8AAGcBZmFrZQAAAAAAAAAAAAAAAAAA 
echo LnRleHQAAADYLwAAAQAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmRhdGEAAAAoAAAA 
echo AgAAAAMBAAAAAAAAAAAAAAAAAAAAAAAALmJzcwAAAADYAwAABQAAAAMBAAAAAAAA 
echo AAAAAAAAAAAAAAAALmlkYXRhJDRUAQAABgAAAAMBBAAAAAAAAAAAAAAAAAAAAAAA 
echo LmlkYXRhJDUoAwAABgAAAAMBBAAAAAAAAAAAAAAAAAAAAAAALmlkYXRhJDfoCwAA 
echo BgAAAAMBDQAAAAAAAAAAAAAAAAAAAAAAAAAAAJIBAACQVwAAAQAAAAMBCQAAAAEA 
echo AAAAAAAAAAAAAAAALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAIAAAAAgAAAAMA 
echo LmJzcwAAAAA0AAAABQAAAAMALmlkYXRhJDcADQAABgAAAAMALmlkYXRhJDUkBAAA 
echo BgAAAAMALmlkYXRhJDRQAgAABgAAAAMALmlkYXRhJDb4CgAABgAAAAMALnRleHQA 
echo AAAAAAAAAAAAAAMALmRhdGEAAAAIAAAAAgAAAAMALmJzcwAAAAA0AAAABQAAAAMA 
echo LmlkYXRhJDf8DAAABgAAAAMALmlkYXRhJDUgBAAABgAAAAMALmlkYXRhJDRMAgAA 
echo BgAAAAMALmlkYXRhJDbmCgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEA 
echo AAAIAAAAAgAAAAMALmJzcwAAAAA0AAAABQAAAAMALmlkYXRhJDf4DAAABgAAAAMA 
echo LmlkYXRhJDUcBAAABgAAAAMALmlkYXRhJDRIAgAABgAAAAMALmlkYXRhJDbICgAA 
echo BgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAIAAAAAgAAAAMALmJzcwAA 
echo AAA0AAAABQAAAAMALmlkYXRhJDf0DAAABgAAAAMALmlkYXRhJDUYBAAABgAAAAMA 
echo LmlkYXRhJDREAgAABgAAAAMALmlkYXRhJDa4CgAABgAAAAMALnRleHQAAAAAAAAA 
echo AAAAAAMALmRhdGEAAAAIAAAAAgAAAAMALmJzcwAAAAA0AAAABQAAAAMALmlkYXRh 
echo JDfwDAAABgAAAAMALmlkYXRhJDUUBAAABgAAAAMALmlkYXRhJDRAAgAABgAAAAMA 
echo LmlkYXRhJDasCgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAIAAAA 
echo AgAAAAMALmJzcwAAAAA0AAAABQAAAAMALmlkYXRhJDfsDAAABgAAAAMALmlkYXRh 
echo JDUQBAAABgAAAAMALmlkYXRhJDQ8AgAABgAAAAMALmlkYXRhJDagCgAABgAAAAMA 
echo LnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAIAAAAAgAAAAMALmJzcwAAAAA0AAAA 
echo BQAAAAMALmlkYXRhJDfoDAAABgAAAAMALmlkYXRhJDUMBAAABgAAAAMALmlkYXRh 
echo JDQ4AgAABgAAAAMALmlkYXRhJDaSCgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMA 
echo LmRhdGEAAAAIAAAAAgAAAAMALmJzcwAAAAA0AAAABQAAAAMALmlkYXRhJDfkDAAA 
echo BgAAAAMALmlkYXRhJDUIBAAABgAAAAMALmlkYXRhJDQ0AgAABgAAAAMALmlkYXRh 
echo JDaCCgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAIAAAAAgAAAAMA 
echo LmJzcwAAAAA0AAAABQAAAAMALmlkYXRhJDfgDAAABgAAAAMALmlkYXRhJDUEBAAA 
echo BgAAAAMALmlkYXRhJDQwAgAABgAAAAMALmlkYXRhJDZwCgAABgAAAAMALnRleHQA 
echo AAAAAAAAAAAAAAMALmRhdGEAAAAIAAAAAgAAAAMALmJzcwAAAAA0AAAABQAAAAMA 
echo LmlkYXRhJDfcDAAABgAAAAMALmlkYXRhJDUABAAABgAAAAMALmlkYXRhJDQsAgAA 
echo BgAAAAMALmlkYXRhJDZcCgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEA 
echo AAAIAAAAAgAAAAMALmJzcwAAAAA0AAAABQAAAAMALmlkYXRhJDfYDAAABgAAAAMA 
echo LmlkYXRhJDX8AwAABgAAAAMALmlkYXRhJDQoAgAABgAAAAMALmlkYXRhJDZUCgAA 
echo BgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAIAAAAAgAAAAMALmJzcwAA 
echo AAA0AAAABQAAAAMALmlkYXRhJDfUDAAABgAAAAMALmlkYXRhJDX4AwAABgAAAAMA 
echo LmlkYXRhJDQkAgAABgAAAAMALmlkYXRhJDZECgAABgAAAAMALnRleHQAAAAAAAAA 
echo AAAAAAMALmRhdGEAAAAIAAAAAgAAAAMALmJzcwAAAAA0AAAABQAAAAMALmlkYXRh 
echo JDfQDAAABgAAAAMALmlkYXRhJDX0AwAABgAAAAMALmlkYXRhJDQgAgAABgAAAAMA 
echo LmlkYXRhJDYwCgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAIAAAA 
echo AgAAAAMALmJzcwAAAAA0AAAABQAAAAMALmlkYXRhJDfMDAAABgAAAAMALmlkYXRh 
echo JDXwAwAABgAAAAMALmlkYXRhJDQcAgAABgAAAAMALmlkYXRhJDYkCgAABgAAAAMA 
echo LnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAIAAAAAgAAAAMALmJzcwAAAAA0AAAA 
echo BQAAAAMALmlkYXRhJDcQDQAABgAAAAMALmlkYXRhJDUsBAAABgAAAAMALmlkYXRh 
echo JDRYAgAABgAAAAMALmlkYXRhJDYICwAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMA 
echo LmRhdGEAAAAIAAAAAgAAAAMALmJzcwAAAAA0AAAABQAAAAMALmlkYXRhJDcoCwAA 
echo BgAAAAMALmlkYXRhJDVwAgAABgAAAAMALmlkYXRhJDScAAAABgAAAAMALmlkYXRh 
echo JDZyBAAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAIAAAAAgAAAAMA 
echo LmJzcwAAAAA0AAAABQAAAAMALmlkYXRhJDckCwAABgAAAAMALmlkYXRhJDVsAgAA 
echo BgAAAAMALmlkYXRhJDSYAAAABgAAAAMALmlkYXRhJDZkBAAABgAAAAMALnRleHQA 
echo AAAAAAAAAAAAAAMALmRhdGEAAAAIAAAAAgAAAAMALmJzcwAAAAA0AAAABQAAAAMA 
echo LmlkYXRhJDcgCwAABgAAAAMALmlkYXRhJDVoAgAABgAAAAMALmlkYXRhJDSUAAAA 
echo BgAAAAMALmlkYXRhJDZUBAAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEA 
echo AAAIAAAAAgAAAAMALmJzcwAAAAA0AAAABQAAAAMALmlkYXRhJDccCwAABgAAAAMA 
echo LmlkYXRhJDVkAgAABgAAAAMALmlkYXRhJDSQAAAABgAAAAMALmlkYXRhJDY+BAAA 
echo BgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAIAAAAAgAAAAMALmJzcwAA 
echo AAA0AAAABQAAAAMALmlkYXRhJDcYCwAABgAAAAMALmlkYXRhJDVgAgAABgAAAAMA 
echo LmlkYXRhJDSMAAAABgAAAAMALmlkYXRhJDY0BAAABgAAAAMALnRleHQAAAAAAAAA 
echo AAAAAAMALmRhdGEAAAAgAAAAAgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRh 
echo JDeYDAAABgAAAAMALmlkYXRhJDXMAwAABgAAAAMALmlkYXRhJDT4AQAABgAAAAMA 
echo LmlkYXRhJDbSCQAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAgAAAA 
echo AgAAAAMALmJzcwAAAADUAwAABQAAAAMALmlkYXRhJDcEDAAABgAAAAMALmlkYXRh 
echo JDU4AwAABgAAAAMALmlkYXRhJDRkAQAABgAAAAMALmlkYXRhJDZWCAAABgAAAAMA 
echo LnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAA 
echo BQAAAAMALmlkYXRhJDe8DAAABgAAAAMALmlkYXRhJDXoAwAABgAAAAMALmlkYXRh 
echo JDQUAgAABgAAAAMALmlkYXRhJDYSCgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMA 
echo LmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDfkCwAA 
echo BgAAAAMALmlkYXRhJDUkAwAABgAAAAMALmlkYXRhJDRQAQAABgAAAAMALmlkYXRh 
echo JDYWCAAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMA 
echo LmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDfgCwAABgAAAAMALmlkYXRhJDUgAwAA 
echo BgAAAAMALmlkYXRhJDRMAQAABgAAAAMALmlkYXRhJDYACAAABgAAAAMALnRleHQA 
echo AAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMA 
echo LmlkYXRhJDfcCwAABgAAAAMALmlkYXRhJDUcAwAABgAAAAMALmlkYXRhJDRIAQAA 
echo BgAAAAMALmlkYXRhJDbqBwAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEA 
echo AAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDfYCwAABgAAAAMA 
echo LmlkYXRhJDUYAwAABgAAAAMALmlkYXRhJDREAQAABgAAAAMALmlkYXRhJDbaBwAA 
echo BgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAA 
echo AADYAwAABQAAAAMALmlkYXRhJDfUCwAABgAAAAMALmlkYXRhJDUUAwAABgAAAAMA 
echo LmlkYXRhJDRAAQAABgAAAAMALmlkYXRhJDbIBwAABgAAAAMALnRleHQAAAAAAAAA 
echo AAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRh 
echo JDfQCwAABgAAAAMALmlkYXRhJDUQAwAABgAAAAMALmlkYXRhJDQ8AQAABgAAAAMA 
echo LmlkYXRhJDasBwAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAA 
echo AgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDfMCwAABgAAAAMALmlkYXRh 
echo JDUMAwAABgAAAAMALmlkYXRhJDQ4AQAABgAAAAMALmlkYXRhJDaeBwAABgAAAAMA 
echo LnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAA 
echo BQAAAAMALmlkYXRhJDfICwAABgAAAAMALmlkYXRhJDUIAwAABgAAAAMALmlkYXRh 
echo JDQ0AQAABgAAAAMALmlkYXRhJDaKBwAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMA 
echo LmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDfECwAA 
echo BgAAAAMALmlkYXRhJDUEAwAABgAAAAMALmlkYXRhJDQwAQAABgAAAAMALmlkYXRh 
echo JDaCBwAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMA 
echo LmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDfACwAABgAAAAMALmlkYXRhJDUAAwAA 
echo BgAAAAMALmlkYXRhJDQsAQAABgAAAAMALmlkYXRhJDZkBwAABgAAAAMALnRleHQA 
echo AAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMA 
echo LmlkYXRhJDe8CwAABgAAAAMALmlkYXRhJDX8AgAABgAAAAMALmlkYXRhJDQoAQAA 
echo BgAAAAMALmlkYXRhJDZGBwAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEA 
echo AAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDe4CwAABgAAAAMA 
echo LmlkYXRhJDX4AgAABgAAAAMALmlkYXRhJDQkAQAABgAAAAMALmlkYXRhJDY0BwAA 
echo BgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAA 
echo AADYAwAABQAAAAMALmlkYXRhJDewCwAABgAAAAMALmlkYXRhJDXwAgAABgAAAAMA 
echo LmlkYXRhJDQcAQAABgAAAAMALmlkYXRhJDYGBwAABgAAAAMALnRleHQAAAAAAAAA 
echo AAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRh 
echo JDesCwAABgAAAAMALmlkYXRhJDXsAgAABgAAAAMALmlkYXRhJDQYAQAABgAAAAMA 
echo LmlkYXRhJDbuBgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAA 
echo AgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDeoCwAABgAAAAMALmlkYXRh 
echo JDXoAgAABgAAAAMALmlkYXRhJDQUAQAABgAAAAMALmlkYXRhJDbQBgAABgAAAAMA 
echo LnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAA 
echo BQAAAAMALmlkYXRhJDekCwAABgAAAAMALmlkYXRhJDXkAgAABgAAAAMALmlkYXRh 
echo JDQQAQAABgAAAAMALmlkYXRhJDa6BgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMA 
echo LmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDegCwAA 
echo BgAAAAMALmlkYXRhJDXgAgAABgAAAAMALmlkYXRhJDQMAQAABgAAAAMALmlkYXRh 
echo JDamBgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMA 
echo LmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDecCwAABgAAAAMALmlkYXRhJDXcAgAA 
echo BgAAAAMALmlkYXRhJDQIAQAABgAAAAMALmlkYXRhJDaMBgAABgAAAAMALnRleHQA 
echo AAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMA 
echo LmlkYXRhJDeYCwAABgAAAAMALmlkYXRhJDXYAgAABgAAAAMALmlkYXRhJDQEAQAA 
echo BgAAAAMALmlkYXRhJDZ8BgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEA 
echo AAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDeQCwAABgAAAAMA 
echo LmlkYXRhJDXQAgAABgAAAAMALmlkYXRhJDT8AAAABgAAAAMALmlkYXRhJDZUBgAA 
echo BgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAA 
echo AADYAwAABQAAAAMALmlkYXRhJDeMCwAABgAAAAMALmlkYXRhJDXMAgAABgAAAAMA 
echo LmlkYXRhJDT4AAAABgAAAAMALmlkYXRhJDY4BgAABgAAAAMALnRleHQAAAAAAAAA 
echo AAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRh 
echo JDeICwAABgAAAAMALmlkYXRhJDXIAgAABgAAAAMALmlkYXRhJDT0AAAABgAAAAMA 
echo LmlkYXRhJDYoBgAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAA 
echo AgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDeECwAABgAAAAMALmlkYXRh 
echo JDXEAgAABgAAAAMALmlkYXRhJDTwAAAABgAAAAMALmlkYXRhJDYOBgAABgAAAAMA 
echo LnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAA 
echo BQAAAAMALmlkYXRhJDeACwAABgAAAAMALmlkYXRhJDXAAgAABgAAAAMALmlkYXRh 
echo JDTsAAAABgAAAAMALmlkYXRhJDb+BQAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMA 
echo LmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDd8CwAA 
echo BgAAAAMALmlkYXRhJDW8AgAABgAAAAMALmlkYXRhJDToAAAABgAAAAMALmlkYXRh 
echo JDbsBQAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMA 
echo LmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDdsCwAABgAAAAMALmlkYXRhJDWsAgAA 
echo BgAAAAMALmlkYXRhJDTYAAAABgAAAAMALmlkYXRhJDacBQAABgAAAAMALnRleHQA 
echo AAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMA 
echo LmlkYXRhJDdoCwAABgAAAAMALmlkYXRhJDWoAgAABgAAAAMALmlkYXRhJDTUAAAA 
echo BgAAAAMALmlkYXRhJDaGBQAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEA 
echo AAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDdkCwAABgAAAAMA 
echo LmlkYXRhJDWkAgAABgAAAAMALmlkYXRhJDTQAAAABgAAAAMALmlkYXRhJDZwBQAA 
echo BgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAA 
echo AADYAwAABQAAAAMALmlkYXRhJDdgCwAABgAAAAMALmlkYXRhJDWgAgAABgAAAAMA 
echo LmlkYXRhJDTMAAAABgAAAAMALmlkYXRhJDZcBQAABgAAAAMALnRleHQAAAAAAAAA 
echo AAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRh 
echo JDdcCwAABgAAAAMALmlkYXRhJDWcAgAABgAAAAMALmlkYXRhJDTIAAAABgAAAAMA 
echo LmlkYXRhJDZIBQAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAA 
echo AgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDdYCwAABgAAAAMALmlkYXRh 
echo JDWYAgAABgAAAAMALmlkYXRhJDTEAAAABgAAAAMALmlkYXRhJDY0BQAABgAAAAMA 
echo LnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAA 
echo BQAAAAMALmlkYXRhJDdUCwAABgAAAAMALmlkYXRhJDWUAgAABgAAAAMALmlkYXRh 
echo JDTAAAAABgAAAAMALmlkYXRhJDYWBQAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMA 
echo LmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDdQCwAA 
echo BgAAAAMALmlkYXRhJDWQAgAABgAAAAMALmlkYXRhJDS8AAAABgAAAAMALmlkYXRh 
echo JDYEBQAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMA 
echo LmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDdMCwAABgAAAAMALmlkYXRhJDWMAgAA 
echo BgAAAAMALmlkYXRhJDS4AAAABgAAAAMALmlkYXRhJDbuBAAABgAAAAMALnRleHQA 
echo AAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMA 
echo LmlkYXRhJDdECwAABgAAAAMALmlkYXRhJDWEAgAABgAAAAMALmlkYXRhJDSwAAAA 
echo BgAAAAMALmlkYXRhJDbABAAABgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEA 
echo AAAoAAAAAgAAAAMALmJzcwAAAADYAwAABQAAAAMALmlkYXRhJDc8CwAABgAAAAMA 
echo LmlkYXRhJDV8AgAABgAAAAMALmlkYXRhJDSoAAAABgAAAAMALmlkYXRhJDaaBAAA 
echo BgAAAAMALnRleHQAAAAAAAAAAAAAAAMALmRhdGEAAAAoAAAAAgAAAAMALmJzcwAA 
echo AADYAwAABQAAAAMALmlkYXRhJDc4CwAABgAAAAMALmlkYXRhJDV4AgAABgAAAAMA 
echo LmlkYXRhJDSkAAAABgAAAAMALmlkYXRhJDaCBAAABgAAAAMAAAAAACQGAAC4AwAA 
echo BgAAAAIAX19jZXhpdABELwAAAQAgAAIAAAAAADIGAAAAAAAA//8AAAIAX3B1dGNo 
echo YXLMLgAAAQAgAAIAAAAAAEUGAACcAgAABgAAAAIAAAAAAF8GAADUnEAA//8AAAIA 
echo AAAAAH4GAABkAgAABgAAAAIAAAAAAJoGAACQAgAABgAAAAIAAAAAALIGAABQAAAA 
echo BgAAAAIAAAAAAMsGAAC4LwAAAQAgAAIAX3NwcmludGa0LgAAAQAgAAIAAAAAAOYG 
echo AAAAAAAA//8AAAIAAAAAAAEHAAAAAAAAAgAAAAIAAAAAABAHAADQLwAAAQAgAAIA 
echo AAAAAB8HAACsVwAAAQAAAAIAAAAAAC4HAAAEDQAABgAAAAIAX19feGlfYQAMAAAA 
echo BwAAAAIAX2ZyZWUAAAD0LgAAAQAgAAIAAAAAAEgHAADYAwAABgAAAAIAAAAAAFcH 
echo AAAUAwAABgAAAAIAAAAAAHAHAABEAwAABgAAAAIAAAAAAH8HAABULwAAAQAgAAIA 
echo X3N0cmNtcACsLgAAAQAgAAIAAAAAAJEHAAAAAAAA//8AAAIAAAAAAK0HAABgAwAA 
echo BgAAAAIAAAAAALwHAACsAgAABgAAAAIAAAAAANIHAAAAAAAA//8AAAIAAAAAAPEH 
echo AAAYAwAABgAAAAIAAAAAAAgIAAAgAwAABgAAAAIAAAAAACUIAAAAAAAACAAAAAIA 
echo AAAAADQIAADsAwAABQAAAAIAAAAAAEsIAAAAAAAA//8AAAIAAAAAAGIIAAAgBAAA 
echo BgAAAAIAAAAAAHsIAAAAAAAA//8AAAIAAAAAAI8IAAAMAwAABgAAAAIAAAAAAKQI 
echo AADoAwAABgAAAAIAAAAAAL0IAADMAgAABgAAAAIAAAAAAOAIAACIAgAABgAAAAIA 
echo AAAAAP0IAAAAAAAA//8AAAIAAAAAABYJAADUHAAAAwAAAAIAAAAAACoJAADEAwAA 
echo BgAAAAIAX19feGxfYwAgAAAABwAAAAIAAAAAADcJAAAAAAAA//8AAAIAAAAAAE8J 
echo AAAAEAAA//8AAAIAAAAAAGgJAABQAwAABgAAAAIAAAAAAHYJAAAAACAA//8AAAIA 
echo AAAAAJAJAAAEAAAA//8AAAIAAAAAAKwJAAD0AwAABgAAAAIAAAAAAMYJAAAcAAAA 
echo BwAAAAIAAAAAANgJAACAAwAABQAAAAIAAAAAAOIJAAAMAAAABwAAAAIAAAAAAPQJ 
echo AABIAwAABgAAAAIAAAAAAAYKAAAcAAAABwAAAAIAX19feGxfegAoAAAABwAAAAIA 
echo AAAAABYKAAAAAAAA//8AAAIAAAAAAC4KAADwAwAABgAAAAIAAAAAAEIKAACUAgAA 
echo BgAAAAIAAAAAAGYKAAAAAAAA//8AAAIAX3B1dHMAAADELgAAAQAgAAIAX191bmxv 
echo Y2t0LgAAAQAgAAIAAAAAAHYKAADcAgAABgAAAAIAAAAAAJcKAAAAAAAA//8AAAIA 
echo AAAAAKgKAACMAwAABQAAAAIAAAAAAMEKAAA8AAAABgAAAAIAAAAAANsKAABYAwAA 
echo BgAAAAIAAAAAAOcKAAA4AAAABQAAAAIAAAAAAPQKAADALwAAAQAgAAIAAAAAAAgL 
echo AAC0AwAABgAAAAIAAAAAABYLAAAAAAAA//8AAAIAAAAAACELAACwAwAABgAAAAIA 
echo AAAAADALAAAAAAAAAAAgAAIBEAAAAAEAAAAAAAAAAAAAAAAAAAAAAEcLAADgAwAA 
echo BQAAAAIAAAAAAFQLAAAAAAAA//8AAAIAAAAAAIULAAAAAAAA//8AAAIAAAAAAJUL 
echo AADwAgAABgAAAAIAAAAAALcLAAAAAAAA//8AAAIAAAAAAMkLAAAAAAAA//8AAAIA 
echo AAAAAN0LAAAAAAAABQAAAAIAX3RvdXBwZXIAAAAA//8AAAIAAAAAAOsLAADUHAAA 
echo AwAAAAIAAAAAAA4MAAAABAAABgAAAAIAAAAAACgMAAAAAAAA//8AAAIAAAAAADgM 
echo AAAUDQAABgAAAAIAAAAAAFEMAAAAAAAABgAAAAIAAAAAAGkMAAAAEAAA//8AAAIA 
echo AAAAAIEMAADkAwAABQAAAAIAAAAAAI4MAACgAgAABgAAAAIAAAAAAKkMAAAAAAAA 
echo //8AAAIAAAAAALsMAAAAAAAA//8AAAIAAAAAANoMAAAQAAAABwAAAAIAAAAAAOgM 
echo AAC4AgAABgAAAAIAAAAAAAANAACwLwAAAQAgAAIAAAAAABINAAAsAAAABwAAAAIA 
echo AAAAACQNAAAAAAAA//8AAAIAAAAAAEMNAADgAwAABgAAAAIAAAAAAFANAAAcAAAA 
echo AgAAAAIAAAAAAG4NAAAAAAAA//8AAAIAAAAAAIYNAACUAwAABgAAAAIAAAAAAJUN 
echo AAD8AwAABgAAAAIAAAAAAKQNAABsAgAABgAAAAIAAAAAALkNAAAAAAAA//8AAAIA 
echo AAAAAM8NAAAsAAAABwAAAAIAAAAAAN8NAADoAgAABgAAAAIAAAAAAAQOAACcAwAA 
echo BgAAAAIAX19kbGxfXwAAAAAA//8AAAIAAAAAABIOAACYAwAABgAAAAIAAAAAAB4O 
echo AAAAAAAA//8AAAIAX2Z3cml0ZQDsLgAAAQAgAAIAAAAAADMOAAAUBAAABgAAAAIA 
echo AAAAAEcOAAAAAAAA//8AAAIAAAAAAGMOAADgAgAABgAAAAIAAAAAAH8OAAAAAAAA 
echo //8AAAIAAAAAAI8OAAAAAEAA//8AAAIAAAAAAJ4OAAAAAAAA//8AAAIAAAAAALAO 
echo AABoAwAABgAAAAIAAAAAALwOAAD4AwAABgAAAAIAAAAAANIOAAAAEAAA//8AAAIA 
echo X2F0b2kAAABkLgAAAQAgAAIAAAAAAOgOAADADAAABgAAAAIAAAAAAAMPAACoLwAA 
echo AQAgAAIAAAAAABMPAACMAgAABgAAAAIAX19feGNfYQAAAAAABwAAAAIAAAAAAC8P 
echo AACAAgAABgAAAAIAAAAAAEQPAAAAAAAA//8AAAIAAAAAAFIPAADMAwAABgAAAAIA 
echo X21lbWNweQDcLgAAAQAgAAIAAAAAAGEPAAC8AgAABgAAAAIAAAAAAHoPAAA0BAAA 
echo BgAAAAIAAAAAAIYPAAA4AwAABgAAAAIAAAAAAJoPAADUnEAA//8AAAIAAAAAALgP 
echo AAAAAAAACAAAAAIAAAAAAMQPAADUAwAABgAAAAIAAAAAANIPAAAAAAAA//8AAAIA 
echo AAAAAOIPAADwAwAABQAAAAIAX3djc2NweQBULgAAAQAgAAIAAAAAAPoPAAA0AAAA 
echo AgAAAAIAAAAAAAcQAABkLwAAAQAgAAIAAAAAABYQAAAAAAAA//8AAAIAX19feGxf 
echo YQAcAAAABwAAAAIAX19feGxfZAAkAAAABwAAAAIAAAAAACUQAACgVwAAAQAAAAIA 
echo AAAAADMQAADcAwAABgAAAAIAAAAAAEAQAADoAwAABQAAAAIAAAAAAE8QAABcLwAA 
echo AQAgAAIAX19DUlRfTVQYAAAAAgAAAAIAAAAAAF8QAACgAwAABgAAAAIAAAAAAG4Q 
echo AAAUAAAAAgAAAAIAAAAAAHgQAADYAwAABQAAAAIAAAAAAJMQAAAEBAAABQAAAAIA 
echo AAAAAJ8QAAD4AgAABgAAAAIAAAAAALcQAAAcAwAABgAAAAIAAAAAANQQAAAEBAAA 
echo BgAAAAIAAAAAAOwQAADILwAAAQAgAAIAAAAAAAMRAAAsAAAAAgAAAAIAAAAAACER 
echo AACgLwAAAQAgAAIAAAAAADMRAAAMAAAABwAAAAIAAAAAAEMRAAAAAAAA//8AAAIA 
echo X2ZwcmludGYELwAAAQAgAAIAAAAAAFQRAAAsCwAABgAAAAIAAAAAAG0RAACQAwAA 
echo BQAAAAIAAAAAAHkRAADIAgAABgAAAAIAAAAAAI8RAAAAAAAA//8AAAIAAAAAAJwR 
echo AAAkBAAABgAAAAIAX3N0cnRvbAB8LgAAAQAgAAIAAAAAALMRAAAAAAAABwAAAAIA 
echo AAAAAMURAAAAAAAA//8AAAIAX0dldERDQDQAAAAA//8AAAIAAAAAANQRAABwAwAA 
echo BgAAAAIAAAAAAOERAADoCwAABgAAAAIAAAAAAP0RAACgVwAAAQAAAAIAAAAAAAwS 
echo AACkAgAABgAAAAIAX2ZyZWFkAAD8LgAAAQAgAAIAAAAAACkSAABwAgAABgAAAAIA 
echo AAAAAD8SAACYAwAABQAAAAIAAAAAAE8SAAC0AgAABgAAAAIAX2ZvcGVuAAAMLwAA 
echo AQAgAAIAAAAAAHASAAA8LwAAAQAgAAIAX2NhbGxvYwAsLwAAAQAgAAIAAAAAAHsS 
echo AAAIAwAABgAAAAIAX19mbW9kZQCoAwAABQAAAAIAAAAAAJUSAAAAAAAA//8AAAIA 
echo AAAAAKgSAACEAgAABgAAAAIAAAAAAMYSAAAAAAAA//8AAAIAAAAAANoSAAAAAAAA 
echo //8AAAIAAAAAAO0SAAD0AgAABgAAAAIAAAAAAAUTAAB8AwAABgAAAAIAAAAAABIT 
echo AAAAAAAA//8AAAIAAAAAACkTAAAAAAAA//8AAAIAAAAAAEATAAAsAwAABgAAAAIA 
echo AAAAAFMTAAAAAAAA//8AAAIAAAAAAGoTAAAkAwAABgAAAAIAAAAAAIgTAACMAwAA 
echo BgAAAAIAX2tiaGl0AABELgAAAQAgAAIAAAAAAJYTAADkAgAABgAAAAIAAAAAALMT 
echo AACYAgAABgAAAAIAAAAAAM0TAACkAwAABgAAAAIAAAAAANsTAAAAAgAA//8AAAIA 
echo AAAAAO4TAADYAgAABgAAAAIAAAAAAAQUAADAAwAABgAAAAIAAAAAABMUAAAoAAAA 
echo BgAAAAIAAAAAACwUAAAAAAAA//8AAAIAAAAAAD8UAADQAgAABgAAAAIAAAAAAF0U 
echo AACIAwAABgAAAAIAAAAAAGsUAADIAwAABgAAAAIAAAAAAHcUAAAAAAAA//8AAAIA 
echo X2dldGNoAAA8LgAAAQAgAAIAAAAAAI0UAAAAAAAABAAAAAIAAAAAAKEUAAAUAAAA 
echo BwAAAAIAAAAAALAUAAAEAAAA//8AAAIAAAAAAMUUAACwDAAABgAAAAIAX19sb2Nr 
echo AAA0LwAAAQAgAAIAAAAAAN8UAABgAgAABgAAAAIAX19feGNfegAIAAAABwAAAAIA 
echo AAAAAO0UAAAAAAAA//8AAAIAAAAAAAsVAAAcAAAACAAAAAIAX19lbmRfXwAAEAAA 
echo CAAAAAIAAAAAABUVAADAAgAABgAAAAIAAAAAACsVAAD8AgAABgAAAAIAAAAAAE8V 
echo AAA0AwAABgAAAAIAAAAAAGAVAAAIBAAABgAAAAIAAAAAAHcVAAAgAAAAAgAAAAIA 
echo AAAAAJ0VAACwAgAABgAAAAIAAAAAALcVAABsLwAAAQAgAAIAX3NpZ25hbAC8LgAA 
echo AQAgAAIAAAAAAMQVAABcAwAABgAAAAIAX21hbGxvYwDkLgAAAQAgAAIAAAAAANEV 
echo AACsVwAAAQAAAAIAX2ZjbG9zZQAcLwAAAQAgAAIAAAAAAN8VAAB4AwAABgAAAAIA 
echo AAAAAO4VAAAAAAAA//8AAAIAAAAAAAIWAAAAAAAA//8AAAIAX3N0cmNweQCkLgAA 
echo AQAgAAIAAAAAADUWAAAAAAAA//8AAAIAAAAAAE0WAABsAwAABgAAAAIAAAAAAFsW 
echo AAAAAAAA//8AAAIAAAAAAGwWAABUAwAABgAAAAIAAAAAAH0WAAAAAAAA//8AAAIA 
echo AAAAAJMWAAAAABAA//8AAAIAAAAAAKwWAAAsAAAABwAAAAIAAAAAAL4WAAAAAEAA 
echo //8AAAIAAAAAAMsWAAADAAAA//8AAAIAAAAAANkWAACsAwAABgAAAAIAAAAAAOcW 
echo AAAAAAAA//8AAAIAX3N0cnRvawCELgAAAQAgAAIAAAAAABYXAAAAAAAA//8AAAIA 
echo AAAAACYXAAC8AwAABgAAAAIAAAAAADQXAACoAwAABgAAAAIAAAAAAEIXAACsAwAA 
echo BQAAAAIAAAAAAFwXAAAMBAAABgAAAAIAAAAAAHEXAABkAwAABgAAAAIAX2Fib3J0 
echo AABsLgAAAQAgAAIAAAAAAH8XAAAMAAAAAgAAAAIAAAAAAJgXAAAAAAAA//8AAAIA 
echo AAAAAKgXAAAAAAAAAAAgAAIBEgAAAAEAAAAAAAAAAAAAAAAAAAAAAL0XAADEAgAA 
echo BgAAAAIAAAAAAN4XAAAAAAAA//8AAAIAAAAAAO0XAAAAAAAA//8AAAIAAAAAAPsX 
echo AAAAAAAA//8AAAIAAAAAAAkYAABMLwAAAQAgAAIAAAAAABUYAAB0AwAABgAAAAIA 
echo AAAAACIYAAAwAwAABgAAAAIAAAAAADcYAAAsBAAABgAAAAIAAAAAAEwYAAAAAAAA 
echo AgAAAAIAAAAAAGYYAAAQAAAAAgAAAAIAAAAAAH8YAAAAAAAA//8AAAIAAAAAAJUY 
echo AAAgAAAACAAAAAIAAAAAAKIYAAAAAAAA//8AAAIAAAAAAL0YAAAEAAAABwAAAAIA 
echo X19feGlfegAYAAAABwAAAAIAAAAAAM0YAAAAAAAA//8AAAIAAAAAAOIYAAAAAAAA 
echo //8AAAIAAAAAAPoYAACEAwAABQAAAAIAX3N0cm5jbXCULgAAAQAgAAIAAAAAABIZ 
echo AAAAAAAA//8AAAIAAAAAAC8ZAACAAwAABgAAAAIAAAAAADsZAAAAAwAABgAAAAIA 
echo AAAAAGAZAABgAgAABgAAAAIAAAAAAHEZAAAAAAAA//8AAAIAAAAAAIEZAAAAAAAA 
echo AAAgAAIBEQAAAAEAAAAAAAAAAAAAAAAAAAAAAJoZAAAkAAAAAgAAAAIAAAAAAMAZ 
echo AAABAAAA//8AAAIAAAAAANgZAAAAAAAA//8AAAIAAAAAAOkZAAAQAwAABgAAAAIA 
echo AAAAAAsaAACQAwAABgAAAAIAAAAAABkaAAAUAAAABgAAAAIAAAAAADQaAAAQLgAA 
echo AQAAAAIAX3N0cmljbXBMLgAAAQAgAAIAAAAAAEEaAABkAAAABgAAAAIAAAAAAFka 
echo AADUHAAAAwAAAAIAAAAAAGsaAABMAwAABgAAAAIAX2ZnZXRzAAAULwAAAQAgAAIA 
echo AAAAAHkaAAAAAAAA//8AAAIAAAAAAJUaAAAAAAAA//8AAAIAAAAAAK0aAAAEAwAA 
echo BgAAAAIAAAAAALwaAADQAwAABgAAAAIAX3N0cmxlbgCcLgAAAQAgAAIAAAAAAMwa 
echo AAA8AwAABgAAAAIAAAAAAOIaAADcAwAABQAAAAIAAAAAAP0aAAAcBAAABgAAAAIA 
echo AAAAACIbAACIAwAABQAAAAIAAAAAADobAACoAgAABgAAAAIAX2V4aXQAAAAkLwAA 
echo AQAgAAIAAAAAAFYbAAAAAAAA//8AAAIAAAAAAGUbAAB4AgAABgAAAAIAAAAAAIQb 
echo AAAoAAAAAgAAAAIAAAAAAJcbAADsAgAABgAAAAIAAAAAALUbAAAAAAAA//8AAAIA 
echo AAAAAM0bAADUAgAABgAAAAIAX3ByaW50ZgDULgAAAQAgAAIAAAAAAOMbAAAAAAAA 
echo //8AAAIAAAAAAAEcAABoAgAABgAAAAIAAAAAABccAADUHAAAAwAAAAIAAAAAADkc 
echo AACIGAAAAwAAAAIAAAAAAFIcAAAAAAAA//8AAAIAX1NsZWVwQDQAAAAA//8AAAIA 
echo AAAAAGUcAAA8AAAABQAAAAIAAAAAAHgcAABAAwAABgAAAAIAAAAAAJAcAAAAAAAA 
echo //8AAAIAAAAAAKQcAAAEAAAACAAAAAIAAAAAAK8cAAAQBAAABgAAAAIAX3N0cnN0 
echo cgCMLgAAAQAgAAIAAAAAAMIcAAAsAAAABwAAAAIAAAAAANIcAABcLgAAAQAgAAIA 
echo AAAAANwcAAB8AgAABgAAAAIAAAAAAPocAAAYBAAABgAAAAIAAAAAABAdAACEAwAA 
echo BgAAAAIAHh0AAF9fX21pbmd3X2ludmFsaWRQYXJhbWV0ZXJIYW5kbGVyAF9wcmVf 
echo Y19pbml0AF9tYW5hZ2VkYXBwAF9wcmVfY3BwX2luaXQAX3N0YXJ0aW5mbwBfX190 
echo bWFpbkNSVFN0YXJ0dXAAX2hhc19jY3RvcgBfV2luTWFpbkNSVFN0YXJ0dXAAX21h 
echo aW5DUlRTdGFydHVwAC5DUlQkWENBQQAuQ1JUJFhJQUEALnJkYXRhJHp6egBfX19n 
echo Y2NfcmVnaXN0ZXJfZnJhbWUAX19fZ2NjX2RlcmVnaXN0ZXJfZnJhbWUALmVoX2Zy 
echo YW1lAF9SZWFkQ2hhclByb3BlcnR5AF9JbnNwZWN0QnVmZmVyAF9EZWNUb0hleABf 
echo R2V0QXR0cmlicwBfU2F2ZUJsb2NrAF9Db3B5QmxvY2sAX01vdXNlRXZlbnRQcm9j 
echo AF9wcmludEtleXN0YXRlcwBfZl9TZXRDb25zb2xlVHJhbnNwYXJlbmN5AF9Gbl9M 
echo b2FkQm1wAF9TZXRGb250RnJvbUZpbGUALnRleHQuc3RhcnR1cABfbWluZ3dfb25l 
echo eGl0AF9fX2RvX2dsb2JhbF9kdG9ycwBfX19kb19nbG9iYWxfY3RvcnMAX2luaXRp 
echo YWxpemVkAF9teV9sY29udl9pbml0AF9fc2V0YXJndgBfX19zZWN1cml0eV9pbml0 
echo X2Nvb2tpZQAuZGF0YSRfX3NlY3VyaXR5X2Nvb2tpZQAuZGF0YSRfX3NlY3VyaXR5 
echo X2Nvb2tpZV9jb21wbGVtZW50AF9fX3JlcG9ydF9nc2ZhaWx1cmUAX0dTX0V4Y2Vw 
echo dGlvblJlY29yZABfR1NfQ29udGV4dFJlY29yZABfR1NfRXhjZXB0aW9uUG9pbnRl 
echo cnMAX19fZHluX3Rsc19kdG9yQDEyAF9fX2R5bl90bHNfaW5pdEAxMgBfX190bHJl 
echo Z2R0b3IAX19fbWluZ3dfcmFpc2VfbWF0aGVycgBfc3RVc2VyTWF0aEVycgBfX19t 
echo aW5nd19zZXR1c2VybWF0aGVycgBfX21hdGhlcnIAX0NTV1RDSC41AF9fZnByZXNl 
echo dABfX2RlY29kZV9wb2ludGVyAF9fZW5jb2RlX3BvaW50ZXIAX19fcmVwb3J0X2Vy 
echo cm9yAF9tYXJrX3NlY3Rpb25fd3JpdGFibGUAX21heFNlY3Rpb25zAF90aGVfc2Vj 
echo cwBfX3BlaTM4Nl9ydW50aW1lX3JlbG9jYXRvcgBfd2FzX2luaXQuNjYyNTAAX19n 
echo bnVfZXhjZXB0aW9uX2hhbmRsZXJANABfX19taW5nd3Rocl9ydW5fa2V5X2R0b3Jz 
echo LnBhcnQuMABfX19taW5nd3Rocl9jcwBfa2V5X2R0b3JfbGlzdABfX19fdzY0X21p 
echo bmd3dGhyX2FkZF9rZXlfZHRvcgBfX19taW5nd3Rocl9jc19pbml0AF9fX193NjRf 
echo bWluZ3d0aHJfcmVtb3ZlX2tleV9kdG9yAF9fX21pbmd3X1RMU2NhbGxiYWNrAHBz 
echo ZXVkby1yZWxvYy1saXN0LmMAX19WYWxpZGF0ZUltYWdlQmFzZS5wYXJ0LjAAX19W 
echo YWxpZGF0ZUltYWdlQmFzZQBfX0ZpbmRQRVNlY3Rpb24AX19GaW5kUEVTZWN0aW9u 
echo QnlOYW1lAF9fX21pbmd3X0dldFNlY3Rpb25Gb3JBZGRyZXNzAF9fX21pbmd3X0dl 
echo dFNlY3Rpb25Db3VudABfX0ZpbmRQRVNlY3Rpb25FeGVjAF9fR2V0UEVJbWFnZUJh 
echo c2UAX19Jc05vbndyaXRhYmxlSW5DdXJyZW50SW1hZ2UAX19fbWluZ3dfZW51bV9p 
echo bXBvcnRfbGlicmFyeV9uYW1lcwBfbWluZ3dfZ2V0X2ludmFsaWRfcGFyYW1ldGVy 
echo X2hhbmRsZXIAX19nZXRfaW52YWxpZF9wYXJhbWV0ZXJfaGFuZGxlcgBfbWluZ3df 
echo c2V0X2ludmFsaWRfcGFyYW1ldGVyX2hhbmRsZXIAX19zZXRfaW52YWxpZF9wYXJh 
echo bWV0ZXJfaGFuZGxlcgBpbnZhbGlkX3BhcmFtZXRlcl9oYW5kbGVyLmMAX19pbXBf 
echo X3N0cnRvawBfVmlydHVhbFByb3RlY3RAMTYAX19pbXBfX0dldENvbnNvbGVXaW5k 
echo b3dAMABfX19SVU5USU1FX1BTRVVET19SRUxPQ19MSVNUX18AX19pbXBfX0NyZWF0 
echo ZUNvbXBhdGlibGVEQ0A0AF9faW1wX19HZXRDb25zb2xlTW9kZUA4AF9faGVhZF9s 
echo aWIzMl9saWJ1c2VyMzJfYQBfR2V0TnVtYmVyT2ZDb25zb2xlRm9udHNAMABfUXVl 
echo cnlQZXJmb3JtYW5jZUNvdW50ZXJANABfX2RhdGFfc3RhcnRfXwBfRnJlZUxpYnJh 
echo cnlANABfX19EVE9SX0xJU1RfXwBfX2xpYjMyX2xpYnVzZXIzMl9hX2luYW1lAF9f 
echo aW1wX19zdHJpY21wAF9faW1wX19WaXJ0dWFsUHJvdGVjdEAxNgBfX2ltcF9fX2Fj 
echo bWRsbgBfX19zZXR1c2VybWF0aGVycgBfVW5oYW5kbGVkRXhjZXB0aW9uRmlsdGVy 
echo QDQAX19pbXBfX19vbmV4aXQAX19pbXBfX0dldExhc3RFcnJvckAwAF9TZXRVbmhh 
echo bmRsZWRFeGNlcHRpb25GaWx0ZXJANABfX2ltcF9fVmlydHVhbFF1ZXJ5QDEyAF9f 
echo aW1wX19Xcml0ZUNvbnNvbGVJbnB1dEFAMTYAX19fdGxzX3N0YXJ0X18AX19fbmF0 
echo aXZlX3N0YXJ0dXBfbG9jawBfV3JpdGVDb25zb2xlSW5wdXRBQDE2AF9faW1wX19T 
echo ZXRXaW5kb3dMb25nQUAxMgBfR2V0Q29uc29sZVdpbmRvd0AwAF9faW1wX19UbHNH 
echo ZXRWYWx1ZUA0AF9faW1wX19TSEdldEZpbGVJbmZvQUAyMABfX2ltcF9fSW5pdGlh 
echo bGl6ZUNyaXRpY2FsU2VjdGlvbkA0AF9faW1wX19HZXRDb25zb2xlRm9udEluZm9A 
echo MTYAX0RlbGV0ZUNyaXRpY2FsU2VjdGlvbkA0AF9fcnRfcHNyZWxvY3Nfc3RhcnQA 
echo X19pbXBfX2Fib3J0AF9fZGxsX2NoYXJhY3RlcmlzdGljc19fAF9fc2l6ZV9vZl9z 
echo dGFja19jb21taXRfXwBfX2ltcF9fX2Ztb2RlAF9fc2l6ZV9vZl9zdGFja19yZXNl 
echo cnZlX18AX19tYWpvcl9zdWJzeXN0ZW1fdmVyc2lvbl9fAF9faW1wX19HZXRBc3lu 
echo Y0tleVN0YXRlQDQAX19fY3J0X3hsX3N0YXJ0X18AX19uZXdtb2RlAF9fX2NydF94 
echo aV9zdGFydF9fAF9faW1wX19fYW1zZ19leGl0AF9fX2NydF94aV9lbmRfXwBfV3Jp 
echo dGVDb25zb2xlT3V0cHV0QUAyMABfX2ltcF9fQ29weUltYWdlQDIwAF9faW1wX19H 
echo ZXRDb25zb2xlU2NyZWVuQnVmZmVySW5mb0A4AF9HZXRMYXN0RXJyb3JAMABfX2lt 
echo cF9fUXVlcnlQZXJmb3JtYW5jZUNvdW50ZXJANABfVmlydHVhbFF1ZXJ5QDEyAF9t 
echo aW5nd19pbml0bHRzZHJvdF9mb3JjZQBfX2hlYWRfbGliMzJfbGlic2hlbGwzMl9h 
echo AF9faW1wX19faW9iAF9fZG93aWxkY2FyZABfR2V0TW9kdWxlSGFuZGxlQUA0AF9f 
echo aW1wX19zdHJzdHIAX0JpdEJsdEAzNgBfX2ltcF9fc3RybmNtcABfX19yZWdpc3Rl 
echo cl9mcmFtZV9pbmZvAF9obW9kX2xpYmdjYwAud2Vhay5fX19yZWdpc3Rlcl9mcmFt 
echo ZV9pbmZvLl9fX0VIX0ZSQU1FX0JFR0lOX18AX0dldEN1cnNvclBvc0A0AF9faW1w 
echo X19TZXRDb25zb2xlQ3Vyc29yUG9zaXRpb25AOABfR2V0Q29uc29sZU1vZGVAOABf 
echo R2V0Q29uc29sZVRpdGxlQUA4AF9fYnNzX3N0YXJ0X18AX19fUlVOVElNRV9QU0VV 
echo RE9fUkVMT0NfTElTVF9FTkRfXwBfX2ltcF9fR2V0U3lzdGVtTWV0cmljc0A0AF9M 
echo b2FkTGlicmFyeVdANABfX2xpYjMyX2xpYndpbm1tX2FfaW5hbWUAX19oZWFkX2xp 
echo YjMyX2xpYmdkaTMyX2EAX19zaXplX29mX2hlYXBfY29tbWl0X18AX19fb25leGl0 
echo ZW5kAF9faW1wX19HZXRDdXJyZW50UHJvY2Vzc0AwAF9TZXRDb25zb2xlTW9kZUA4 
echo AF9TZXRMYXllcmVkV2luZG93QXR0cmlidXRlc0AxNgBfbWluZ3dfcGNpbml0AF9f 
echo aW1wX19HZXRQcm9jQWRkcmVzc0A4AF9HZXRQcm9jQWRkcmVzc0A4AF9fX2NydF94 
echo cF9zdGFydF9fAF9TY3JvbGxDb25zb2xlU2NyZWVuQnVmZmVyQUAyMABfX2ltcF9f 
echo Z2V0Y2gAX19NSU5HV19JTlNUQUxMX0RFQlVHX01BVEhFUlIAX0dldENvbnNvbGVD 
echo dXJzb3JJbmZvQDgAX19pbXBfX3B1dGNoYXIAX19pbXBfX0dldERDQDQAX19pbXBf 
echo X0dldE9iamVjdEFAMTIAX1JlYWRDb25zb2xlSW5wdXRBQDE2AF9fX2NydF94cF9l 
echo bmRfXwBfX2ltcF9fU2Nyb2xsQ29uc29sZVNjcmVlbkJ1ZmZlckFAMjAAX19pbXBf 
echo X3NpZ25hbABfX2ltcF9fcHV0cwBfX21pbm9yX29zX3ZlcnNpb25fXwBfX2ltcF9f 
echo U2VuZElucHV0QDEyAF9TZXRDb25zb2xlQ3Vyc29yUG9zaXRpb25AOABfX2ltcF9f 
echo UmVhZENvbnNvbGVJbnB1dEFAMTYAX0dldFRpY2tDb3VudEAwAF9faW1hZ2VfYmFz 
echo ZV9fAF9HZXRXaW5kb3dMb25nQUA4AF9faW1wX19leGl0AF9faW1wX19HZXRDdXJz 
echo b3JQb3NANABfX3NlY3Rpb25fYWxpZ25tZW50X18AX19saWIzMl9saWJzaGVsbDMy 
echo X2FfaW5hbWUAX0xvYWRMaWJyYXJ5QUA0AF9faW1wX19HZXRDb25zb2xlRm9udFNp 
echo emVAOABfX2ltcF9fRnJlZUxpYnJhcnlANABfQ29weUltYWdlQDIwAF9faW1wX190 
echo b3VwcGVyAF9faW1wX19HZXRTdGFydHVwSW5mb0FANABfX0lBVF9lbmRfXwBfX2lt 
echo cF9fX19sY29udl9pbml0AF9fUlVOVElNRV9QU0VVRE9fUkVMT0NfTElTVF9fAF9f 
echo dGxzX3N0YXJ0AF9faW1wX193Y3NjcHkAX0dldFN0ZEhhbmRsZUA0AF9fX25hdGl2 
echo ZV9zdGFydHVwX3N0YXRlAF9fZGF0YV9lbmRfXwBfX19nZXRtYWluYXJncwBfUGxh 
echo eVNvdW5kQUAxMgBfX0NUT1JfTElTVF9fAF9faW1wX19rYmhpdABfX19vbmV4aXRi 
echo ZWdpbgBfX19zZXRfYXBwX3R5cGUAX19pbXBfX3NwcmludGYAX19jaGFybWF4AF9f 
echo X21pbmd3X3dpbm1haW5fbHBDbWRMaW5lAF9fYnNzX2VuZF9fAF9faW1wX19TZXRD 
echo b25zb2xlTW9kZUA4AF9faW1wX19XYWl0Rm9yU2luZ2xlT2JqZWN0QDgAX19pbXBf 
echo X0dldFdpbmRvd0xvbmdBQDgAX0dldENvbnNvbGVGb250SW5mb0AxNgBfX19zZWN1 
echo cml0eV9jb29raWVfY29tcGxlbWVudABfU2V0Q29uc29sZUZvbnRAOABfX19jcnRf 
echo eGNfZW5kX18AX0dldFdpbmRvd1JlY3RAOABfX2xpYjMyX2xpYmdkaTMyX2FfaW5h 
echo bWUAX190bHNfaW5kZXgAX19pbXBfX0dldFRpY2tDb3VudEAwAF9SZWxlYXNlRENA 
echo OABfX2ltcF9fU2V0V2luZG93UG9zQDI4AF9fX2NydF94Y19zdGFydF9fAF9HZXRP 
echo YmplY3RBQDEyAF9faW1wX19mZ2V0cwBfX2xpYjMyX2xpYmtlcm5lbDMyX2FfaW5h 
echo bWUAX19fQ1RPUl9MSVNUX18AX19pbXBfX0dldEN1cnJlbnRQcm9jZXNzSWRAMABf 
echo X2ltcF9fU2VsZWN0T2JqZWN0QDgAX21pbmd3X2FwcF90eXBlAF9faW1wX19HZXRO 
echo dW1iZXJPZkNvbnNvbGVGb250c0AwAF9faW5pdHRlcm0AX19pbXBfX1Rlcm1pbmF0 
echo ZVByb2Nlc3NAOABfX3J0X3BzcmVsb2NzX3NpemUAX19pbXBfX0dldENvbnNvbGVD 
echo dXJzb3JJbmZvQDgAX0dldFN5c3RlbU1ldHJpY3NANABfR2V0U3RhcnR1cEluZm9B 
echo QDQAX19pbXBfX1NldENvbnNvbGVGb250QDgAX19pbXBfX2ZyZWFkAF9XYWl0Rm9y 
echo U2luZ2xlT2JqZWN0QDgAX0dldEN1cnJlbnRQcm9jZXNzSWRAMABfX2ltcF9fX19k 
echo bGxvbmV4aXQAX1JlYWRDb25zb2xlT3V0cHV0QUAyMABfX2ltcF9fV3JpdGVDb25z 
echo b2xlT3V0cHV0QUAyMABfX2ltcF9fbWVtY3B5AF9faW1wX19SZWFkQ29uc29sZU91 
echo dHB1dEFAMjAAX19pbXBfX0dldENvbnNvbGVUaXRsZUFAOABfX2ltcF9fc3RyY21w 
echo AF9fZmlsZV9hbGlnbm1lbnRfXwBfX2ltcF9fTG9hZExpYnJhcnlXQDQAX19pbXBf 
echo X191bmxvY2sAX19oZWFkX2xpYjMyX2xpYm1zdmNydF9hAF9TZXRXaW5kb3dMb25n 
echo QUAxMgBfX2ltcF9fTGVhdmVDcml0aWNhbFNlY3Rpb25ANABfX2ltcF9fbWFsbG9j 
echo AF9faW1wX19hdG9pAF9HZXRDb25zb2xlRm9udFNpemVAOABfX19FSF9GUkFNRV9C 
echo RUdJTl9fAF9fX21pbmd3X3Bpbml0AF9fbWFqb3Jfb3NfdmVyc2lvbl9fAF9fbGli 
echo MzJfbGlibXN2Y3J0X2FfaW5hbWUAX19JQVRfc3RhcnRfXwBfR2V0Q29uc29sZVNj 
echo cmVlbkJ1ZmZlckluZm9AOABfX3Rsc19lbmQAX19pbXBfX0dldFN0ZEhhbmRsZUA0 
echo AF9faW1wX19TZXRDb25zb2xlU2NyZWVuQnVmZmVyU2l6ZUA4AF9faW1wX19fX2lu 
echo aXRlbnYAX19pbXBfX0dldFdpbmRvd1JlY3RAOABfX2ltcF9fX2dldF9pbnZhbGlk 
echo X3BhcmFtZXRlcl9oYW5kbGVyAF9faW1wX19HZXRNb2R1bGVIYW5kbGVBQDQAX19f 
echo ZGxsb25leGl0AF9faW1wX19fbG9jawBfX0RUT1JfTElTVF9fAF9faW1wX19mcHJp 
echo bnRmAF9UZXJtaW5hdGVQcm9jZXNzQDgALndlYWsuX19fZGVyZWdpc3Rlcl9mcmFt 
echo ZV9pbmZvLl9fX0VIX0ZSQU1FX0JFR0lOX18AX0VudGVyQ3JpdGljYWxTZWN0aW9u 
echo QDQAX19pbXBfX2ZjbG9zZQBfU2V0V2luZG93UG9zQDI4AF9faW1wX19faW5pdHRl 
echo cm0AX0dldEN1cnJlbnRUaHJlYWRJZEAwAF9fc2l6ZV9vZl9oZWFwX3Jlc2VydmVf 
echo XwBfX19jcnRfeHRfc3RhcnRfXwBfX19JbWFnZUJhc2UAX19zdWJzeXN0ZW1fXwBf 
echo X2ltcF9fc3RybGVuAC53ZWFrLl9fSnZfUmVnaXN0ZXJDbGFzc2VzLl9fX0VIX0ZS 
echo QU1FX0JFR0lOX18AX1NldEN1cnNvclBvc0A4AF9faW1wX19zdHJ0b2wAX19pbXBf 
echo X3N0cmNweQBfX19taW5nd19vbGRleGNwdF9oYW5kbGVyAF9faW1wX19Mb2FkSW1h 
echo Z2VBQDI0AF9faW1wX19jYWxsb2MAX19fbmF0aXZlX3ZjY2xyaXRfcmVhc29uAF9T 
echo ZWxlY3RPYmplY3RAOABfX0p2X1JlZ2lzdGVyQ2xhc3NlcwBfX2ltcF9fR2V0U3lz 
echo dGVtVGltZUFzRmlsZVRpbWVANABfTG9hZEltYWdlQUAyNABfX19sY29udl9pbml0 
echo AF9TZW5kSW5wdXRAMTIAX19hbXNnX2V4aXQAX19pbXBfX2ZvcGVuAF9faW1wX19f 
echo X2dldG1haW5hcmdzAF9faW1wX19QbGF5U291bmRBQDEyAF9fX21pbmd3X3dpbm1h 
echo aW5fblNob3dDbWQAX19fbmF0aXZlX2RsbG1haW5fcmVhc29uAF9DcmVhdGVDb21w 
echo YXRpYmxlRENANABfX190bHNfZW5kX18AX0dldFN5c3RlbVRpbWVBc0ZpbGVUaW1l 
echo QDQAX21pbmd3X3BjcHBpbml0AF9HZXRDdXJyZW50UHJvY2Vzc0AwAF9TZXRDb25z 
echo b2xlQ3Vyc29ySW5mb0A4AF9taW5nd19pbml0bHRzc3VvX2ZvcmNlAF9Jbml0aWFs 
echo aXplQ3JpdGljYWxTZWN0aW9uQDQAX19pbXBfX2ZyZWUAX19pbXBfX1NldFVuaGFu 
echo ZGxlZEV4Y2VwdGlvbkZpbHRlckA0AF9faW1wX19CaXRCbHRAMzYAX0RlbGV0ZU9i 
echo amVjdEA0AF9fX2RlcmVnaXN0ZXJfZnJhbWVfaW5mbwBfX2ltcF9fX3NldF9pbnZh 
echo bGlkX3BhcmFtZXRlcl9oYW5kbGVyAF9fbWFqb3JfaW1hZ2VfdmVyc2lvbl9fAF9f 
echo bG9hZGVyX2ZsYWdzX18AX19pbXBfX1VuaGFuZGxlZEV4Y2VwdGlvbkZpbHRlckA0 
echo AF9faW1wX19wcmludGYAX19oZWFkX2xpYjMyX2xpYmtlcm5lbDMyX2EAX19fY2hr 
echo c3RrX21zAF9faGVhZF9saWIzMl9saWJ3aW5tbV9hAF9fcnRfcHNyZWxvY3NfZW5k 
echo AF9faW1wX19fY2V4aXQAX19taW5vcl9zdWJzeXN0ZW1fdmVyc2lvbl9fAF9fbWlu 
echo b3JfaW1hZ2VfdmVyc2lvbl9fAF9faW1wX19TbGVlcEA0AF9faW1wX192ZnByaW50 
echo ZgBfX2ltcF9fX19zZXRfYXBwX3R5cGUAX19fbWluZ3dfd2lubWFpbl9oSW5zdGFu 
echo Y2UAX19pbXBfX1NldExheWVyZWRXaW5kb3dBdHRyaWJ1dGVzQDE2AF9taW5nd19p 
echo bml0bHRzZHluX2ZvcmNlAF9faW1wX19HZXRDdXJyZW50VGhyZWFkSWRAMABfVGxz 
echo R2V0VmFsdWVANABfX2ltcF9fRGVsZXRlQ3JpdGljYWxTZWN0aW9uQDQAX19fc2Vj 
echo dXJpdHlfY29va2llAF9faW1wX19TZXRDb25zb2xlQ3Vyc29ySW5mb0A4AF9MZWF2 
echo ZUNyaXRpY2FsU2VjdGlvbkA0AF9faW1wX19Mb2FkTGlicmFyeUFANABfU2V0Q29u 
echo c29sZVNjcmVlbkJ1ZmZlclNpemVAOABfX2ltcF9fRGVsZXRlT2JqZWN0QDQAX19S 
echo VU5USU1FX1BTRVVET19SRUxPQ19MSVNUX0VORF9fAF9fX2R5bl90bHNfaW5pdF9j 
echo YWxsYmFjawBfU0hHZXRGaWxlSW5mb0FAMjAAX21pbmd3X2luaXRjaGFybWF4AF9f 
echo aW1wX19fX3NldHVzZXJtYXRoZXJyAF9HZXRBc3luY0tleVN0YXRlQDQAX190bHNf 
echo dXNlZABfX2ltcF9fUmVsZWFzZURDQDgAX19fY3J0X3h0X2VuZF9fAF92ZnByaW50 
echo ZgBfX2ltcF9fRW50ZXJDcml0aWNhbFNlY3Rpb25ANABfX2ltcF9fU2V0Q3Vyc29y 
echo UG9zQDgAX19pbXBfX2Z3cml0ZQA= 
echo -----END CERTIFICATE----- 
)>>cmd.temp
certutil -decode cmd.temp cmdwiz.exe >nul
del /f /q cmd.temp
goto backcmdwiz


:nolc
echo -----BEGIN CERTIFICATE----- >LC1.exe
(echo TVqQAAMAAAAEAAAA//8AALgAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAgAAAAA4fug4AtAnNIbgBTM0hVGhpcyBwcm9ncmFtIGNhbm5v
echo dCBiZSBydW4gaW4gRE9TIG1vZGUuDQ0KJAAAAAAAAABQRQAATAEDAE5+KlsAAAAA
echo AAAAAOAAIgALATAAAAwAAAAIAAAAAAAAMioAAAAgAAAAQAAAAABAAAAgAAAAAgAA
echo BAAAAAAAAAAEAAAAAAAAAACAAAAAAgAAAAAAAAMAQIUAABAAABAAAAAAEAAAEAAA
echo AAAAABAAAAAAAAAAAAAAAOApAABPAAAAAEAAAMwFAAAAAAAAAAAAAAAAAAAAAAAA
echo AGAAAAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAIAAACAAAAAAAAAAAAAAACCAAAEgAAAAAAAAAAAAAAC50ZXh0AAAA
echo OAoAAAAgAAAADAAAAAIAAAAAAAAAAAAAAAAAACAAAGAucnNyYwAAAMwFAAAAQAAA
echo AAYAAAAOAAAAAAAAAAAAAAAAAABAAABALnJlbG9jAAAMAAAAAGAAAAACAAAAFAAA
echo AAAAAAAAAAAAAAAAQAAAQgAAAAAAAAAAAAAAAAAAAAAUKgAAAAAAAEgAAAACAAUA
echo tCEAACwIAAABAAAAAQAABgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAABMwAwBPAQAAAQAAEQACKAEAACsY/gQTBhEGLB8AcgEA
echo AHAoEAAACgByPwAAcCgQAAAKABcoEQAACgAAAhaaKBIAAAoKAheaKBIAAAoLcxMA
echo AAoMcxMAAAoNFhMHKxEIBhEHmm8UAAAKJhEHF1gTBxEHBigBAAAr/gQTCBEILd8W
echo EwkrEQkHEQmabxQAAAomEQkXWBMJEQkHKAEAACv+BBMKEQot33MVAAAKEwQABxML
echo FhMMKygRCxEMmhMNCBENbxYAAAoW/gETDhEOLAoRBBENbxcAAAoAEQwXWBMMEQwR
echo C45pMtBzFQAAChMFAAYTDxYTECsoEQ8REJoTEQkREW8WAAAKFv4BExIREiwKEQUR
echo EW8XAAAKABEQF1gTEBEQEQ+OaTLQcn0AAHAoGAAAChEEKBkAAAooGgAACgByjQAA
echo cCgYAAAKEQUoGQAACigaAAAKABYoEQAACgAqIgIoGwAACgAqQlNKQgEAAQAAAAAA
echo DAAAAHY0LjAuMzAzMTkAAAAABQBsAAAAYAIAACN+AADMAgAAMAMAACNTdHJpbmdz
echo AAAAAPwFAACgAAAAI1VTAJwGAAAQAAAAI0dVSUQAAACsBgAAgAEAACNCbG9iAAAA
echo AAAAAAIAAAFHFQIICQgAAAD6ATMAFgAAAQAAABgAAAACAAAAAgAAAAEAAAAbAAAA
echo DgAAAAEAAAACAAAAAQAAAAIAAAABAAAAAAD6AQEAAAAAAAYAbwG4AgYA3AG4AgYA
echo owCGAg8A2AIAAAYAywBGAgYAUgFGAgYAMwFGAgYAwwFGAgYAjwFGAgYAqAFGAgYA
echo 4gBGAgYAtwCZAgYAlQCZAgYAFgFGAgYA/QAMAgYAAgM1AgoADwA8AAYAGQA8AAoA
echo WwBYAgYAAQA8AAYAawA1AgYADgM1AgYAZgApAAYAJgI1AgAAAAAgAAAAAAABAAEA
echo AAAQAC0CcgJBAAEAAQBQIAAAAACRADwCmAABAKshAAAAAIYYgAIGAAIAAAABAPQC
echo CQCAAgEAEQCAAgYAGQCAAgoAKQCAAhAAMQCAAhAAOQCAAhAAQQCAAhAASQCAAhAA
echo UQCAAhAAWQCAAhAAYQCAAhUAaQCAAhAAcQCAAhAAeQCAAhAAmQAaA0QAqQBzAFMA
echo sQAJA1gAuQDnAl0ADACAAgYADABXAGkAFACAAgYADAD5AmkAFABXAHUAsQB9AHsA
echo wQBBAn8AuQAgA4kAgQCAAgYALgALAJ4ALgATAKcALgAbAMYALgAjAM8ALgArAOIA
echo LgAzAOIALgA7AOIALgBDAM8ALgBLAOgALgBTAOIALgBbAOIALgBjAAABLgBrACoB
echo LgBzADcBGgBjAG8ABIAAAAEAAAAAAAAAAAAAAAAAZAIAAAQAAAAAAAAAAAAAAI8A
echo MwAAAAAABAAAAAAAAAAAAAAAjwCJAAAAAAAfAE8AAAAASUVudW1lcmFibGVgMQBI
echo YXNoU2V0YDEATGlzdGAxADxNb2R1bGU+AFN5c3RlbS5JTwBtc2NvcmxpYgBTeXN0
echo ZW0uQ29sbGVjdGlvbnMuR2VuZXJpYwBBZGQARW51bWVyYWJsZQBGaWxlAENvbnNv
echo bGUAV3JpdGVMaW5lAGdldF9OZXdMaW5lAFN5c3RlbS5Db3JlAEd1aWRBdHRyaWJ1
echo dGUARGVidWdnYWJsZUF0dHJpYnV0ZQBDb21WaXNpYmxlQXR0cmlidXRlAEFzc2Vt
echo Ymx5VGl0bGVBdHRyaWJ1dGUAQXNzZW1ibHlUcmFkZW1hcmtBdHRyaWJ1dGUAVGFy
echo Z2V0RnJhbWV3b3JrQXR0cmlidXRlAEFzc2VtYmx5RmlsZVZlcnNpb25BdHRyaWJ1
echo dGUAQXNzZW1ibHlDb25maWd1cmF0aW9uQXR0cmlidXRlAEFzc2VtYmx5RGVzY3Jp
echo cHRpb25BdHRyaWJ1dGUAQ29tcGlsYXRpb25SZWxheGF0aW9uc0F0dHJpYnV0ZQBB
echo c3NlbWJseVByb2R1Y3RBdHRyaWJ1dGUAQXNzZW1ibHlDb3B5cmlnaHRBdHRyaWJ1
echo dGUAQXNzZW1ibHlDb21wYW55QXR0cmlidXRlAFJ1bnRpbWVDb21wYXRpYmlsaXR5
echo QXR0cmlidXRlAGxpbmUtY29tcGFyZXIuZXhlAFN5c3RlbS5SdW50aW1lLlZlcnNp
echo b25pbmcAU3RyaW5nAFByb2dyYW0AU3lzdGVtAE1haW4ASm9pbgBTeXN0ZW0uUmVm
echo bGVjdGlvbgBTeXN0ZW0uTGlucQBsaW5lLWNvbXBhcmVyAGxpbmVfY29tcGFyZXIA
echo LmN0b3IAU3lzdGVtLkRpYWdub3N0aWNzAFN5c3RlbS5SdW50aW1lLkludGVyb3BT
echo ZXJ2aWNlcwBTeXN0ZW0uUnVudGltZS5Db21waWxlclNlcnZpY2VzAERlYnVnZ2lu
echo Z01vZGVzAFJlYWRBbGxMaW5lcwBhcmdzAENvbnRhaW5zAE9iamVjdABFeGl0AEVu
echo dmlyb25tZW50AENvdW50AFdyaXRlQWxsVGV4dAAAAAAAPUkAbgBjAG8AcgByAGUA
echo YwB0ACAAbgB1AG0AYgBlAHIAIABvAGYAIABhAHIAZwB1AG0AZQBuAHQAcwAuAAA9
echo RQB4ADoAIABsAGMALgBlAHgAZQAgAGYAaQBsAGUAMQAuAHQAeAB0ACAAZgBpAGwA
echo ZQAyAC4AdAB4AHQAAA9uAGUAdwAuAHQAeAB0AAAPbwBsAGQALgB0AHgAdAAAAAAA
echo Pkx1U7TSCE6/40pn/u8anQAEIAEBCAMgAAEFIAEBEREEIAEBDgQgAQECKQcTHQ4d
echo DhUSRQEOFRJFAQ4VEkkBDhUSSQEOAggCCAIdDggOAh0OCA4CChABAQgVElEBHgAD
echo CgEOBAABAQ4EAAEBCAUAAR0ODgUVEkUBDgUgAQITAAUVEkkBDgUgAQETAAMAAA4J
echo AAIODhUSUQEOBQACAQ4OCLd6XFYZNOCJBQABAR0OCAEACAAAAAAAHgEAAQBUAhZX
echo cmFwTm9uRXhjZXB0aW9uVGhyb3dzAQgBAAcBAAAAABIBAA1saW5lLWNvbXBhcmVy
echo AAAFAQAAAAAXAQASQ29weXJpZ2h0IMKpICAyMDE4AAApAQAkNDI4OWVhOTgtYmYy
echo Mi00ZDdkLWExZmEtZWVjYWMzNWI5YjZmAAAMAQAHMS4wLjAuMAAARwEAGi5ORVRG
echo cmFtZXdvcmssVmVyc2lvbj12NC4wAQBUDhRGcmFtZXdvcmtEaXNwbGF5TmFtZRAu
echo TkVUIEZyYW1ld29yayA0AAgqAAAAAAAAAAAAACIqAAAAIAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAUKgAAAAAAAAAAAAAAAF9Db3JFeGVNYWluAG1zY29yZWUuZGxsAAAA
echo AAD/JQAgQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIA
echo EAAAACAAAIAYAAAAUAAAgAAAAAAAAAAAAAAAAAAAAQABAAAAOAAAgAAAAAAAAAAA
echo AAAAAAAAAQAAAAAAgAAAAAAAAAAAAAAAAAAAAAAAAQABAAAAaAAAgAAAAAAAAAAA
echo AAAAAAAAAQAAAAAAzAMAAJBAAAA8AwAAAAAAAAAAAAA8AzQAAABWAFMAXwBWAEUA
echo UgBTAEkATwBOAF8ASQBOAEYATwAAAAAAvQTv/gAAAQAAAAEAAAAAAAAAAQAAAAAA
echo PwAAAAAAAAAEAAAAAQAAAAAAAAAAAAAAAAAAAEQAAAABAFYAYQByAEYAaQBsAGUA
echo SQBuAGYAbwAAAAAAJAAEAAAAVAByAGEAbgBzAGwAYQB0AGkAbwBuAAAAAAAAALAE
echo nAIAAAEAUwB0AHIAaQBuAGcARgBpAGwAZQBJAG4AZgBvAAAAeAIAAAEAMAAwADAA
echo MAAwADQAYgAwAAAAGgABAAEAQwBvAG0AbQBlAG4AdABzAAAAAAAAACIAAQABAEMA
echo bwBtAHAAYQBuAHkATgBhAG0AZQAAAAAAAAAAAEQADgABAEYAaQBsAGUARABlAHMA
echo YwByAGkAcAB0AGkAbwBuAAAAAABsAGkAbgBlAC0AYwBvAG0AcABhAHIAZQByAAAA
echo MAAIAAEARgBpAGwAZQBWAGUAcgBzAGkAbwBuAAAAAAAxAC4AMAAuADAALgAwAAAA
echo RAASAAEASQBuAHQAZQByAG4AYQBsAE4AYQBtAGUAAABsAGkAbgBlAC0AYwBvAG0A
echo cABhAHIAZQByAC4AZQB4AGUAAABIABIAAQBMAGUAZwBhAGwAQwBvAHAAeQByAGkA
echo ZwBoAHQAAABDAG8AcAB5AHIAaQBnAGgAdAAgAKkAIAAgADIAMAAxADgAAAAqAAEA
echo AQBMAGUAZwBhAGwAVAByAGEAZABlAG0AYQByAGsAcwAAAAAAAAAAAEwAEgABAE8A
echo cgBpAGcAaQBuAGEAbABGAGkAbABlAG4AYQBtAGUAAABsAGkAbgBlAC0AYwBvAG0A
echo cABhAHIAZQByAC4AZQB4AGUAAAA8AA4AAQBQAHIAbwBkAHUAYwB0AE4AYQBtAGUA
echo AAAAAGwAaQBuAGUALQBjAG8AbQBwAGEAcgBlAHIAAAA0AAgAAQBQAHIAbwBkAHUA
echo YwB0AFYAZQByAHMAaQBvAG4AAAAxAC4AMAAuADAALgAwAAAAOAAIAAEAQQBzAHMA
echo ZQBtAGIAbAB5ACAAVgBlAHIAcwBpAG8AbgAAADEALgAwAC4AMAAuADAAAADcQwAA
echo 6gEAAAAAAAAAAAAA77u/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRG
echo LTgiIHN0YW5kYWxvbmU9InllcyI/Pg0KDQo8YXNzZW1ibHkgeG1sbnM9InVybjpz
echo Y2hlbWFzLW1pY3Jvc29mdC1jb206YXNtLnYxIiBtYW5pZmVzdFZlcnNpb249IjEu
echo MCI+DQogIDxhc3NlbWJseUlkZW50aXR5IHZlcnNpb249IjEuMC4wLjAiIG5hbWU9
echo Ik15QXBwbGljYXRpb24uYXBwIi8+DQogIDx0cnVzdEluZm8geG1sbnM9InVybjpz
echo Y2hlbWFzLW1pY3Jvc29mdC1jb206YXNtLnYyIj4NCiAgICA8c2VjdXJpdHk+DQog
echo ICAgICA8cmVxdWVzdGVkUHJpdmlsZWdlcyB4bWxucz0idXJuOnNjaGVtYXMtbWlj
echo cm9zb2Z0LWNvbTphc20udjMiPg0KICAgICAgICA8cmVxdWVzdGVkRXhlY3V0aW9u
echo TGV2ZWwgbGV2ZWw9ImFzSW52b2tlciIgdWlBY2Nlc3M9ImZhbHNlIi8+DQogICAg
echo ICA8L3JlcXVlc3RlZFByaXZpbGVnZXM+DQogICAgPC9zZWN1cml0eT4NCiAgPC90
echo cnVzdEluZm8+DQo8L2Fzc2VtYmx5PgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAADAAAADQ6AAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
echo AAAAAAAAAAAAAAAAAAAAAA==
echo -----END CERTIFICATE-----)>>Lc1.exe
certutil -decode LC1.exe LC.exe >nul
del /f /q Lc1.exe
goto backlc


:clear20
cls
echo CHAT FULL. CLEARNING . . .
echo [S]%TIME: =0%-SERVER} Full Chat Cleared >\\%him%\chat\CHAT.txt
echo [S]%TIME: =0%-SERVER} Full Chat Cleared >>\\%him%\chat\Log.txt
timout /t 2 >nul
cls
goto type

copy /Y "\\%him%\CHAT\chat.txt" "C:\users\Public\chat\Localchat.txt" >nul
:wait
Title CB Chattio by Lucas Elliott     T-Talk   U-Update   F-File Manager   O-Options   M-Mini Chatter   C-Clear   P-Ping Users   X-Exit   B-Code Snippits
choice /c "QTUFOMCPXB" /n /d "Q" /t "10" >nul
if not exist \\%him%\CHAT\chat.txt goto connectioner
if not %pingr%==Y (
	if exist \\%him%\CHAT\Ping (
		echo [%me%]-[%hostname%] >>\\%him%\CHAT\ping
		set pingr=Y
		)
)
if %pingr%==Y (
	if not exist \\%him%\CHAT\Ping set pingr=N
)
if %errorlevel%==1 goto refresh
if %errorlevel%==7 cls & call :c 08 "Cleared at %time%" & goto wait
if %errorlevel%==2 goto talk
if %errorlevel%==3 goto update
if %errorlevel%==4 goto FileMan
if %errorlevel%==5 goto setting
if %errorlevel%==6 goto mini
if %errorlevel%==8 goto pingusers
if %errorlevel%==9 call :c 0c "Exiting . . ." & timeout /t 1 >nul & exit
if %errorlevel%==10 goto codeClip
goto wait


:codeClip
if exist \\%him%\CHAT\Code goto clip2
if not exist \\%him%\CHAT\CodeBlock.txt call :404 "CodeBlockEntry @ CodeBlock.txt"
cls
call :c 0a "Do you want to copy the following text to the clipboard?" /u
echo ==============================================================
type \\%him%\CHAT\CodeBlock.txt
echo.
echo ==============================================================
choice /c YN
if %errorlevel%==2 goto clstype
echo Copying . . .
type \\%him%\CHAT\CodeBlock.txt | clip
echo Copied.
timeout /t 2 >nul
goto clstype

:clip2
cls
call :c 0a "Do you want to copy the following text to the clipboard?" /u
echo ==============================================================
type \\%him%\CHAT\Code
echo.
echo ==============================================================
choice /c YN
if %errorlevel%==2 goto clstype
echo Copying . . .
type \\%him%\CHAT\Code | clip
echo Copied.
timeout /t 2 >nul
goto clstype


:clstype
cls
goto type



:pingusers
cls
if exist \\%him%\CHAT\Ping (
	call :c 0c "A user is already Pinging."
	call :c 04 "If you think this is an error press C. Otherwise press X."
	choice /c CX 
	if !errorlevel!==2 goto clstype
	goto errorping
)
echo. 2>\\%him%\CHAT\Ping
call :C 0a "Pinging Users to see who is online . . ."
call :C 08 "Waiting 60 Seconds for a reply."
echo [S]%TIME: =0%-SERVER} %me% Started a Ping >\\%him%\chat\CHAT.txt
echo [S]%TIME: =0%-SERVER} %me% is Sending a Ping Out >>\\%him%\chat\Log.txt
ping localhost -n 61 >nul
call :c 08 "Loading Results . . ."
call :c 0a "Online Users:"
echo PING RESULTS %TIME% >>\\%him%\chat\Log.txt
type \\%him%\CHAT\ping >>\\%him%\chat\Log.txt
echo ===============================
call :C 08 "Username  Hostname" /u
type \\%him%\CHAT\Ping
echo ===============================
del /f /q \\%him%\CHAT\Ping
pause
cls
goto type

:errorping
cls
call :c 0c "Testing For Error . . ."
call :C 08 "This will take over a minute."
ping localhost -n 70 >nul
if exist \\%him%\CHAT\Ping (
	del /f /q \\%him%\CHAT\Ping
	call :c 0a "Error Detected and Resolved."
	pause
	cls
	goto chat
)
cls
call :c 0a "No Error Detected User Ping was Ended"
pause
cls
goto type




:404
call :c c0 "ERROR: " /n
call :c 0c "The Following Resource Was Not Found on the Server: %1"
pause
if %404%==Force exit /b
exit


:FileMan
cls
call :c a0 "File Manager Version 1.9"
call :c 0a "1] View Files"
call :c 0a "2] Upload Files"
call :c 02 "3] Exit"
choice /c 123
if %errorlevel%==1 goto viewf
if %errorlevel%==2 goto upload
cls
goto type


:connectioner
call :c 0c "There was a connection Error. Please wait while we try and identify the source of the problem . . ."
if exist \\%him%\CHAT\Chat.txt call :c 0c "Wait. Never Mind, the problem is gone." & cls & goto refresh
if exist \\%him%\CHAT\Log.txt echo %me COULD NOT FIND THE CHAT FILE at %time% >>\\%him%\CHAT\Log.txt & goto nochat
ping %him% -n 1 >nul
if %errorlevel%==0 goto noserv
echo The Host Computer named %him% appears to be offline or powered down.
echo Redirecting to the reconnect dialougeee (IDK how to spell that and dont care).
timeout /t 5
goto offline

:nochat
cls
echo The Server Is still online but the chat.txt file is not there. Please contact the owner of
echo %him% and ask why the heck he deleted the chat file! WE NEED THAT!
pause
exit

:noserv
cls
echo The computer %him% is online but there is no server to be found.
echo This could mean the folder was deleted, its share options were changed,
echo the computer netword was changed, or that the computer is asleep (maybe).
echo.
echo contact the owner of %him% to see whats going on.
call :c 08 "Press any key to redirect to OFFLINE dialog . . ."
pause>nul
goto offline 


:mini2
if not exist \\%him%\chat\Mini.bat call :404 "Mini.bat"
if exist Mini.bat del /f /q Mini.bat
copy /Y "\\%him%\Chat\Mini.bat" "Mini.bat" >nul
start "" "Mini.bat"
cls
if /I "%MiniClose%"=="Yes" exit /b
goto type



:mini
if %LegacyMini%==True goto mini2
if %mini%==True goto closemini
for /f "tokens=1,2* skip=3 delims= " %%a in ('mode con') do (
	set _lines=%%b
	goto endline
)
:endline

for /f "tokens=1,2* skip=4 delims= " %%a in ('mode con') do (
	set _cols=%%b
	goto endcol
)
:endcol
@mode con: cols=80lines=10
cmdwiz setwindowtransparency 27
cls
echo Loading the Always On Top Function...
echo this may take a few seconds . . .
call :toggleAlwaysOnTop >nul 2>nul
set mini=True
cls
goto type


:closemini
@mode con: cols=%_cols%lines=%_lines%
cmdwiz setwindowtransparency 0
call :toggleAlwaysOnTop >nul 2>nul
set mini=false
cls
goto type


:setting
Title OPTIONS      CB Chattio
cls
call :c 0f " Options Menu:"
call :c 0b "------------------------------"
call :c 0f "1] Sound:" /n
if exist C:\users\Public\Chat\Mute call :c 0c " Muted"
if not exist C:\users\Public\Chat\Mute call :c 0a " On"
call :c 0f "2] Settings.CMD Variables"
call :c 0f "3] Edit Settings.CMD"
call :c 0f "4] Force Chat Clear"
call :c 0f "5] View Log" 
call :c 0f "6] Ban Menu"
schtasks /query /TN ITCMD-CHAT-NOTIF 2>nul| find "ITCMD-CHAT-NOTIF                         N/A                    Ready">nul 
if %errorlevel%==0 call :c 0f "7] Dissable Notifications"
if %errorlevel%==1 call :c 0f "7] Enable Notifications"
call :c 07 "8] Report Bugs"
call :c 08 "9] Exit"
call :c 06 "Press N to view more options"
choice /c "123456789n"
if %errorlevel%==1 goto sound
if %errorlevel%==2 goto cmdvar
if %errorlevel%==3 notepad "settings.cmd" & cls & goto topreset
if %errorlevel%==4 call :c 0c "Clearing Chat . . ." & timeout /t 2 >nul & goto clear20
if %errorlevel%==5 goto log
if %errorlevel%==6 goto ban
if %errorlevel%==7 goto notifTog
if %errorlevel%==8 goto bug
if %errorlevel%==10 goto settingtwo
cls & goto type


:settingtwo
cls
call :c 0f " Options Menu:" /n
call :c 06 "   Page Two"
call :c 0b "------------------------------"
call :c 0f "1] Hamachi Guide"
call :c 08 "2] Exit"
call :c 06 "Press N to view previous options"
choice /c "12n"
if %errorlevel%==1 goto hamachig
if %errorlevel%==3 goto setting
cls & goto type


:hamachig
cls
call :c 0a "---------------------------- Hamachi Guide ----------------------------"
echo Hamachi (Also known as Logmein) is a simple and easy to use service 
echo that allows you to create a virtual LAN network. This means that any 
echo devices that join your Hamachi network appear to be on the same local 
echo network as you. This allows you to chat with computers outside your LAN. 
echo Simply Download Hamachi from www.vpn.net (press O to open the link), 
echo and create a new network. You will then have a unique ID to give to 
echo other users so they too can connect to your LAN. You can add a password 
echo or require your permission for users to join. The only downside of this 
echo is that the chat program's search IP function does not work. This is because 
echo the unique IP address that appears to be on your network is much more random 
echo and is often out of range of the detection service. However, the hostname 
echo of your chat server will still be a viable way to connect. You can also 
echo find the direct IP in the settings of the hamachi service. Just note 
echo that you will have to run the hamachi service to use the chat program. 
echo You can set hamachi to launch on startup though, and it uses little-to-no 
echo computer resources. 
call :c 0a "--------------------------- Press X to Exit ---------------------------"
:hamchoice
choice /c ox /n
if %errorlevel%==1 start www.vpn.net & goto hamchoice
goto settingtwo

:alreadrep
cls
echo You have already reported a bug today.
echo Please Wait until tomorrow.
call :c 08 "Press any key to exit back to menu . . ."
pause>nul
goto setting


:alreadyrep
cls
call :c 0c "You have already reported a bug today."
echo Please wait until tomorrow to report another bug.
pause
goto setting


:bugcheck
for /F "skip=1 delims=" %%F in ('
    wmic PATH Win32_LocalTime GET Day^,Month^,Year /FORMAT:TABLE
') do (
    for /F "tokens=1-3" %%L in ("%%F") do (
        set CurrDay=0%%L
    )
)
set CurrDay=%CurrDay:~-2%
set /p lastday=<C:\users\Public\BugDay.txt
if %lastday%==%currDay% goto alreadyrep
exit /b

:bug
if exist C:\users\Public\BugDay.txt call :bugcheck
cls
echo Are you sure you want to report a bug? (Press Y/N)
call :c 08 "You can only send one bug report each day."
choice /c YN /n
if %errorlevel%==2 goto setting
cls
echo What Type of Bug is it?
echo.
call :c 0f "1] Connection bug (Could not connect to chat server)"
call :c 0f "2] Option or menu bug (Program crashes when preforming a certain action)"
call :c 0f "3] Typo or grammar mistke (Helo thar)"
call :c 0f "4] Updator error (Problem updating)"
call :c 0f "5] Other (Something else)"
call :c 0f "X] Exit (cancel Bug Report)"
choice /c 12345x /m "Press a key"
if %errorlevel%==1 set type=1& set description=Connection bug
if %errorlevel%==2 set type=2& set description=Option or menu bug
if %errorlevel%==3 set type=3& set description=Typo or grammar
if %errorlevel%==4 set type=4& set description=Updator
if %errorlevel%==5 set type=5& set /p description="Enter Title:"
if %errorlevel%==6 goto setting
echo.
call :c 0f "A New Window will open in notepad. Type in your description of the bug as well"
call :c 0f "Enter Description (details and any links to screenshots) in the window, then " /n
call :c 0f "close it and save it" /u
call :c 0c "To Cancel the report enter [CANCEL] in the file somewhere and save and close."
pause
echo. 2>Bug-Report.txt
notepad Bug-Report.txt
find "[CANCEL]" "Bug-Report.txt" >nul 2>nul
if %errorlevel%==0 del /f /q Bug-Report.txt & goto setting
echo Prepping . . .
set ID=%random%%random%%random%
Set BugID=%ID%.%type%.txt
for /f "tokens=1* delims=: " %%A in (
  'nslookup myip.opendns.com. resolver1.opendns.com 2^>NUL^|find "Address:"'
) Do set ExtIP=%%B
echo Bug Report from %date% %time% by %Hostname% at %ExtIP% >%BugID%
echo =========================================================================================== >>%BugID%
echo Type: %type% >>%BugID%
echo     : %Description% >>%BugID%
echo =========================================================================================== >>%BugID%
echo Report: >>%BugID%
type Bug-Report.txt >>%BugID%
echo. >>%BugID%
echo =========================================================================================== >>%BugID%
(echo bug)>ftp.inf
(echo bug#223)>>ftp.inf
(echo put %BugID%)>>ftp.inf
(echo quit)>>ftp.inf
ftp -s:ftp.inf ftp.itcommand.tech>nul
for /F "skip=1 delims=" %%F in ('
    wmic PATH Win32_LocalTime GET Day^,Month^,Year /FORMAT:TABLE
') do (
    for /F "tokens=1-3" %%L in ("%%F") do (
        set CurrDay=0%%L
    )
)
set CurrDay=%CurrDay:~-2%
(echo %CurrDay%)>C:\users\Public\BugDay.txt
if not %errorlevel%==0 call :c 04 "A server error occured, report may not have been sent."
call :c 0a "Bug Report Sent Successfuly."
call :c 02 "Your ID: %ID%"
echo.
echo Press any key to close to menu . . .
pause >nul
goto setting


:notifTog
cls
schtasks /query /TN ITCMD-CHAT-NOTIF 2>nul | find "ITCMD-CHAT-NOTIF                         N/A                    Ready">nul
set do=%errorlevel%
call :c 0a "Loading Admin Prompt . . ."
echo %cd%>C:\users\Public\CDC.txt
powershell start -verb runas '%0' notif%do% & exit /b

:Dissable0
set /p cdd=<C:\users\Public\CDC.txt
cd %cdd%
call :c 0a "Dissabling Notifications . . ."
schtasks /Delete /TN ITCMD-CHAT-NOTIF /f >nul
timeout /t 2 >nul
set NotifSupress=True
goto topreset

:Enable1
set /p cdd=<C:\users\Public\CDC.txt
cd %cdd%
call :c 0a "Enabling Notifications . . ."
schtasks /Create /TN ITCMD-CHAT-NOTIF /SC ONLOGON /tr "%cd%\Notif\Notif.vbs" /F >nul
timeout /t 2 >nul
goto topreset

:ban
Title Ban      CB Chattio
cls
call :c 0a "Loading . . ."
for /f %%a in ('hostname') do (set hostname=%%a)
find "[%hostname%]" "\\%him%\CHAT\Host.inf" >nul
if %errorlevel%==0 goto ban2
:unb
call :c 0c "You are not the Host of this server.
pause
goto top


:Ban2
timeout /t 1 >nul
cls
call :c 0a " Ban User Menu:"
call :c 0b "------------------------------"
call :c 0f "1] Ban a user"
call :c 0f "2] Unban a user"
call :c 07 "3] Exit"
choice /c "12345"
if %errorlevel%==1 goto newhost
if %errorlevel%==2 goto remhost
goto setting


:newhost
find "[%hostname%]" "\\%him%\CHAT\Host.inf >nul
if %errorlevel%==1 goto unb
cls
call :c 0f "Enter Hostname to ban or Enter -U to look up by Username"
call :c 08 "Enter -C to cancel"
set /p hst=">"
if "%hst%"=="Hostname" goto top
if /i "%hst%"=="-C" goto setting
if /i "%hst%"=="-U" goto byuser
find "[%hst%]" "\\%him%\CHAT\Users.log" >nul
if %errorlevel%==1 call :c 0c "Hostname Not Found." & pause & goto setting
echo Enter a reason for banning %hst%
set /p reason=">"
(echo [%hst%] - %reason%)>>"\\%him%\CHAT\Ban"
echo %TIME: =0%-SERVER} [S]%me% Banned %hst% for %reason% >> "\\%him%\CHAT\Chat.txt"
echo %TIME: =0%-SERVER} %me% Banned %hst% for %reason% >> "\\%him%\CHAT\Log.txt"
echo Ban complete.
pause
goto Ban2


:byuser
cls

call :c 0c "=========================BAN=========================="
call :c 08 "                     Oldest User"
type "\\%him%\CHAT\Users.log"
call :c 08 "                      Newest User"
call :c 0c "======================================================="
call :c 0a "Enter Hostname to Ban" /n
call :c 08 "   -C to cancel"
set /p hst=">"
if /i "%hst%"=="%Hostname%" goto top
if /i "%hst%"=="-C" goto ban2
find "[%hst%]" "\\%him%\CHAT\Users.log" >nul
if %errorlevel%==1 call :c 0c "Hostname Not Found." & pause & goto ban2
echo Enter a reason for banning %hst%
:looprez
set /p reason=">"
echo %reason%|findstr ") (" >nul
if %errorlevel%==0 goto looprez
(echo [%hst%] - %reason%)>>"\\%him%\CHAT\Ban"
echo %TIME: =0%-SERVER} [S]%me% Banned %hst% for %reason% >> "\\%him%\CHAT\Chat.txt"
echo %TIME: =0%-SERVER} %me% Banned %hst% for %reason% >> "\\%him%\CHAT\Log.txt"
echo Ban complete.
pause
goto Ban2

:remhost
cls
call :c 0c "=========================BAN LIST=========================="
type "\\%him%\CHAT\Ban"
call :c 0c "==========================================================="
call :c 0f "Enter Hostname to Unban. Enter -C to cancel"
set /p hst=">"
if /i "%hst%"=="-c" goto ban2
find "[%hst%]" "\\%him%\CHAT\Ban" >nul
if errorlevel 1 call :c 0c "Hostname Not Found." & pause & goto ban2
call :c 0f "Are you sure you want to unban " /n
call :c 0c "%hst%" /n /u
call :c 0f " from the server?"
choice
if %errorlevel%==2 goto ban2
call :c 0a "Unbanning . . ."
findstr /L /V "[%hst%]" "\\%him%\CHAT\Ban" >outfile.txt
del /f /q "\\%him%\CHAT\Ban"
copy "outfile.txt" "\\%him%\CHAT\Ban" >nul
del /f /q outfile.txt
echo %TIME: =0%-SERVER} [S]%me% Unbanned %hst% >> "\\%him%\CHAT\Chat.txt"
echo %TIME: =0%-SERVER} %me% Unbanned %hst% >> "\\%him%\CHAT\Log.txt"
call :c 0a "Complete."
pause
goto ban2




:moves
if exist "winhttpjs.bat" goto 26561852823937251981271726892 
echo -----BEGIN CERTIFICATE----- >temp.txt 
( 
echo QGlmIChAWCkgPT0gKEBZKSBAZW5kIC8qIEpTY3JpcHQgY29tbWVudCANCiAgICAg 
echo ICAgQGVjaG8gb2ZmIA0KICAgICAgICANCiAgICAgICAgcmVtIDo6IHRoZSBmaXJz 
echo dCBhcmd1bWVudCBpcyB0aGUgc2NyaXB0IG5hbWUgYXMgaXQgd2lsbCBiZSB1c2Vk 
echo IGZvciBwcm9wZXIgaGVscCBtZXNzYWdlIA0KICAgICAgICBjc2NyaXB0IC8vRTpK 
echo U2NyaXB0IC8vbm9sb2dvICIlfmYwIiAiJX5ueDAiICUqIA0KDQogICAgICAgIGV4 
echo aXQgL2IgJWVycm9ybGV2ZWwlIA0KICAgICAgICANCkBpZiAoQFgpPT0oQFkpIEBl 
echo bmQgSlNjcmlwdCBjb21tZW50ICovDQoNCi8vIHVzZWQgcmVzb3VyY2VzDQoNCi8v 
echo IHVwZGF0ZSAxMi4xMC4xNSANCi8vIG9zdmlrdmkoaHR0cHM6Ly9naXRodWIuY29t 
echo L29zdmlrdmkpIGhhcyBub2RpdGVkIHRoYXQgdGhlIC1wYXNzd29yZCBvcHRpb24g 
echo aXMgbm90IHNldCAsIHNvIHRoaXMgaXMgZml4ZWQNCg0KLy9odHRwczovL21zZG4u 
echo bWljcm9zb2Z0LmNvbS9lbi11cy9saWJyYXJ5L3dpbmRvd3MvZGVza3RvcC9hYTM4 
echo NDA1OCh2PXZzLjg1KS5hc3B4IA0KLy9odHRwczovL21zZG4ubWljcm9zb2Z0LmNv 
echo bS9lbi11cy9saWJyYXJ5L3dpbmRvd3MvZGVza3RvcC9hYTM4NDA1NSh2PXZzLjg1 
echo KS5hc3B4IA0KLy9odHRwczovL21zZG4ubWljcm9zb2Z0LmNvbS9lbi11cy9saWJy 
echo YXJ5L3dpbmRvd3MvZGVza3RvcC9hYTM4NDA1OSh2PXZzLjg1KS5hc3B4IA0KDQov 
echo LyBnbG9iYWwgdmFyaWFibGVzIGFuZCBjb25zdGFudHMgDQoNCg0KLy8gLS0tLS0t 
echo LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSANCi8vIC0tIGFzeW5jaCByZXF1 
echo ZXN0cyBub3QgaW5jbHVkZWQgLS0gDQovLyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t 
echo LS0tLS0tLS0tLS0tIA0KDQoNCi8vdG9kbyAtIHNhdmUgcmVzcG9uY2VTdHJlYW0g 
echo aW5zdGVhZCBvZiByZXNwb25jZUJvZHkgISEgDQovL3RvZG8gLSBzZXQgYWxsIHdp 
echo bnRodHRwIG9wdGlvbnMgLT4vL2h0dHBzOi8vbXNkbi5taWNyb3NvZnQuY29tL2Vu 
echo LXVzL2xpYnJhcnkvd2luZG93cy9kZXNrdG9wL2FhMzg0MTA4KHY9dnMuODUpLmFz 
echo cHggDQovL3RvZG8gLSBsb2cgYWxsIG9wdGlvbnMgDQovL3RvZG8gLSBpbXByb3Zl 
echo IGhlbHAgbWVzc2FnZSAuIGV2ZW50dWFsIHZlcmJvc2Ugb3B0aW9uIA0KDQoNCnZh 
echo ciBBUkdTID0gV1NjcmlwdC5Bcmd1bWVudHM7DQp2YXIgc2NyaXB0TmFtZSA9IEFS 
echo R1MuSXRlbSgwKTsNCg0KdmFyIHVybCA9ICIiOw0KdmFyIHNhdmVUbyA9ICIiOw0K 
echo DQp2YXIgdXNlciA9IDA7DQp2YXIgcGFzcyA9IDA7DQoNCnZhciBwcm94eSA9IDA7 
echo DQp2YXIgYnlwYXNzID0gMDsNCnZhciBwcm94eV91c2VyID0gMDsNCnZhciBwcm94 
echo eV9wYXNzID0gMDsNCg0KdmFyIGNlcnRpZmljYXRlID0gMDsNCg0KdmFyIGZvcmNl 
echo ID0gdHJ1ZTsNCg0KdmFyIGJvZHkgPSAiIjsNCg0KLy9BY3RpdmVYIG9iamVjdHMg 
echo DQp2YXIgV2luSFRUUE9iaiA9IG5ldyBBY3RpdmVYT2JqZWN0KCJXaW5IdHRwLldp 
echo bkh0dHBSZXF1ZXN0LjUuMSIpOw0KdmFyIEZpbGVTeXN0ZW1PYmogPSBuZXcgQWN0 
echo aXZlWE9iamVjdCgiU2NyaXB0aW5nLkZpbGVTeXN0ZW1PYmplY3QiKTsNCnZhciBB 
echo ZG9EQk9iaiA9IG5ldyBBY3RpdmVYT2JqZWN0KCJBRE9EQi5TdHJlYW0iKTsNCg0K 
echo Ly8gSHR0cFJlcXVlc3QgU2V0Q3JlZGVudGlhbHMgZmxhZ3MuIA0KdmFyIHByb3h5 
echo X3NldHRpbmdzID0gMDsNCg0KLy8gDQpIVFRQUkVRVUVTVF9TRVRDUkVERU5USUFM 
echo U19GT1JfU0VSVkVSID0gMDsNCkhUVFBSRVFVRVNUX1NFVENSRURFTlRJQUxTX0ZP 
echo Ul9QUk9YWSA9IDE7DQoNCi8vdGltZW91dHMgYW5kIHRoZWlyIGRlZmF1bHQgdmFs 
echo dWVzIA0KdmFyIFJFU09MVkVfVElNRU9VVCA9IDA7DQp2YXIgQ09OTkVDVF9USU1F 
echo T1VUID0gOTAwMDA7DQp2YXIgU0VORF9USU1FT1VUID0gOTAwMDA7DQp2YXIgUkVD 
echo RUlWRV9USU1FT1VUID0gOTAwMDA7DQoNCi8vSHR0cFJlcXVlc3RNZXRob2QgDQp2 
echo YXIgaHR0cF9tZXRob2QgPSAnR0VUJzsNCg0KLy9oZWFkZXIgDQp2YXIgaGVhZGVy 
echo X2ZpbGUgPSAiIjsNCg0KLy9yZXBvcnQgDQp2YXIgcmVwb3J0ZmlsZSA9ICIiOw0K 
echo DQovL3Rlc3QtdGhpczogDQp2YXIgdXNlX3N0cmVhbSA9IGZhbHNlOw0KDQovL2F1 
echo dG9sb2dvbiBwb2xpY3kgDQp2YXIgYXV0b2xvZ29uX3BvbGljeSA9IDE7IC8vMCwx 
echo LDIgDQoNCg0KLy9oZWFkZXJzIHdpbGwgYmUgc3RvcmVkIGFzIG11bHRpLWRpbWVu 
echo c2lvbmFsIGFycmF5IA0KdmFyIGhlYWRlcnMgPSBbXTsNCg0KLy91c2VyLWFnZW50 
echo IA0KdmFyIHVhID0gIiI7DQoNCi8vZXNjYXBlIFVSTCANCnZhciBlc2NhcGUgPSBm 
echo YWxzZTsNCg0KZnVuY3Rpb24gcHJpbnRIZWxwKCkgew0KICAgIFdTY3JpcHQuRWNo 
echo byhzY3JpcHROYW1lICsgIiAtIHNlbmRzIEhUVFAgcmVxdWVzdCBhbmQgc2F2ZXMg 
echo dGhlIHJlcXVlc3QgYm9keSBhcyBhIGZpbGUgYW5kL29yIGEgcmVwb3J0IG9mIHRo 
echo ZSBzZW50IHJlcXVlc3QiKTsNCiAgICBXU2NyaXB0LkVjaG8oc2NyaXB0TmFtZSAr 
echo ICIgdXJsICBbLWZvcmNlIHllc3xub10gWy11c2VyIHVzZXJuYW1lIC1wYXNzd29y 
echo ZCBwYXNzd29yZF0gWy1wcm94eSBwcm94eXNlcnZlcjpwb3J0XSBbLWJ5cGFzcyBi 
echo eXBhc3NfbGlzdF0iKTsNCiAgICBXU2NyaXB0LkVjaG8oIiAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWy1wcm94 
echo eXVzZXIgcHJveHlfdXNlcm5hbWUgLXByb3h5cGFzc3dvcmQgcHJveHlfcGFzc3dv 
echo cmRdIFstY2VydGlmaWNhdGUgY2VydGlmaWNhdGVTdHJpbmddIik7DQogICAgV1Nj 
echo cmlwdC5FY2hvKCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgIFstbWV0aG9kIEdFVHxQT1NUfFBBVENIfERFTEVU 
echo RXxIRUFEfE9QVElPTlN8Q09OTkVDVF0iKTsNCiAgICBXU2NyaXB0LkVjaG8oIiAg 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgWy1zYXZlVG8gZmlsZV0gLSB0byBwcmludCByZXNwb25zZSB0byBjb25z 
echo b2xlIHVzZSBjb24iKTsNCg0KICAgIFdTY3JpcHQuRWNobygiICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbLXNl 
echo bmRUaW1lb3V0IGludChtaWxsaXNlY29uZHMpXSIpOw0KICAgIFdTY3JpcHQuRWNo 
echo bygiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICBbLXJlc29sdmVUaW1lb3V0IGludChtaWxsaXNlY29uZHMpXSIp 
echo Ow0KICAgIFdTY3JpcHQuRWNobygiICAgICAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbLWNvbm5lY3RUaW1lb3V0IGlu 
echo dChtaWxsaXNlY29uZHMpXSIpOw0KICAgIFdTY3JpcHQuRWNobygiICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBb 
echo LXJlY2VpdmVUaW1lb3V0IGludChtaWxsaXNlY29uZHMpXSIpOw0KDQogICAgV1Nj 
echo cmlwdC5FY2hvKCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgIFstYXV0b2xvZ29uUG9saWN5IDF8MnwzXSIpOw0K 
echo ICAgIFdTY3JpcHQuRWNobygiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICBbLXByb3h5U2V0dGluZ3MgMXwyfDNd 
echo IChodHRwczovL21zZG4ubWljcm9zb2Z0LmNvbS9lbi11cy9saWJyYXJ5L3dpbmRv 
echo d3MvZGVza3RvcC9hYTM4NDA1OSh2PXZzLjg1KS5hc3B4KSIpOw0KDQogICAgLy9o 
echo ZWFkZXIgDQogICAgV1NjcmlwdC5FY2hvKCIgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFstaGVhZGVycy1maWxl 
echo IGhlYWRlcl9maWxlXSIpOw0KICAgIC8vcmVwb3J0ZmlsZSANCiAgICBXU2NyaXB0 
echo LkVjaG8oIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgWy1yZXBvcnRmaWxlIHJlcG9ydGZpbGVdIik7DQogICAg 
echo V1NjcmlwdC5FY2hvKCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICAgIFstdWEgdXNlci1hZ2VudF0iKTsNCiAgICBX 
echo U2NyaXB0LkVjaG8oIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICAgWy11YS1maWxlIHVzZXItYWdlbnQtZmlsZV0i 
echo KTsNCg0KICAgIFdTY3JpcHQuRWNobygiICAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbLWVzY2FwZSB5ZXN8bm9d 
echo Iik7DQoNCiAgICBXU2NyaXB0LkVjaG8oIiAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWy1ib2R5IGJvZHktc3Ry 
echo aW5nXSIpOw0KICAgIFdTY3JpcHQuRWNobygiICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbLWJvZHktZmlsZSBi 
echo b2R5LWZpbGVdIik7DQoNCiAgICBXU2NyaXB0LkVjaG8oIi1mb3JjZSAgLSBkZWNp 
echo ZGUgdG8gbm90IG9yIHRvIG92ZXJ3cml0ZSBpZiB0aGUgbG9jYWwgZmlsZXMgZXhp 
echo c3RzIik7DQoNCiAgICBXU2NyaXB0LkVjaG8oInByb3h5c2VydmVyOnBvcnQgLSB0 
echo aGUgcHJveHkgc2VydmVyIik7DQogICAgV1NjcmlwdC5FY2hvKCJieXBhc3MtIGJ5 
echo cGFzcyBsaXN0Iik7DQogICAgV1NjcmlwdC5FY2hvKCJwcm94eV91c2VyICwgcHJv 
echo eHlfcGFzc3dvcmQgLSBjcmVkZW50aWFscyBmb3IgcHJveHkgc2VydmVyIik7DQog 
echo ICAgV1NjcmlwdC5FY2hvKCJ1c2VyICwgcGFzc3dvcmQgLSBjcmVkZW50aWFscyBm 
echo b3IgdGhlIHNlcnZlciIpOw0KICAgIFdTY3JpcHQuRWNobygiY2VydGlmaWNhdGUg 
echo LSBsb2NhdGlvbiBvZiBTU0wgY2VydGlmaWNhdGUiKTsNCiAgICBXU2NyaXB0LkVj 
echo aG8oIm1ldGhvZCAtIHdoYXQgSFRUUCBtZXRob2Qgd2lsbCBiZSB1c2VkLkRlZmF1 
echo bHQgaXMgR0VUIik7DQogICAgV1NjcmlwdC5FY2hvKCJzYXZlVG8gLSBzYXZlIHRo 
echo ZSByZXNwb25jZSBhcyBiaW5hcnkgZmlsZSIpOw0KICAgIFdTY3JpcHQuRWNobygi 
echo ICIpOw0KICAgIFdTY3JpcHQuRWNobygiSGVhZGVyIGZpbGUgc2hvdWxkIGNvbnRh 
echo aW4ga2V5OnZhbHVlIHBhaXJzLkxpbmVzIHN0YXJ0aW5nIHdpdGggXCIjXCIgd2ls 
echo bCBiZSBpZ25vcmVkLiIpOw0KICAgIFdTY3JpcHQuRWNobygidmFsdWUgc2hvdWxk 
echo IE5PVCBiZSBlbmNsb3NlZCB3aXRoIHF1b3RlcyIpOw0KICAgIFdTY3JpcHQuRWNo 
echo bygiICIpOw0KICAgIFdTY3JpcHQuRWNobygiRXhhbXBsZXM6Iik7DQoNCiAgICBX 
echo U2NyaXB0LkVjaG8oc2NyaXB0TmFtZSArICIgaHR0cDovL3NvbWVsaW5rLmNvbS9z 
echo b21lZmlsZS56aXAgLXNhdmVUbyBjOlxcc29tZWZpbGUuemlwIC1jZXJ0aWZpY2F0 
echo ZSBcIkxPQ0FMX01BQ0hJTkVcXFBlcnNvbmFsXFxNeSBNaWRkbGUtVGllciBDZXJ0 
echo aWZpY2F0ZVwiIik7DQogICAgV1NjcmlwdC5FY2hvKHNjcmlwdE5hbWUgKyAiIGh0 
echo dHA6Ly9zb21lbGluay5jb20vc29tZXRoaW5nLmh0bWwgIC1tZXRob2QgUE9TVCAg 
echo LWNlcnRpZmljYXRlIFwiTE9DQUxfTUFDSElORVxcUGVyc29uYWxcXE15IE1pZGRs 
echo ZS1UaWVyIENlcnRpZmljYXRlXCIgLWhlYWRlciBjOlxcaGVhZGVyX2ZpbGUgLXJl 
echo cG9ydGZpbGUgYzpcXHJlcG9ydGZpbGUudHh0Iik7DQogICAgV1NjcmlwdC5FY2hv 
echo KHNjcmlwdE5hbWUgKyAiXCJodHRwOi8vc29tZWxpbmtcIiAgLW1ldGhvZCBQT1NU 
echo ICAgLWhlYWRlciBoZHJzLnR4dCAtcmVwb3J0ZmlsZSByZXBvcnRmaWxlMi50eHQg 
echo LXNhdmVUbyByZXNwb25zZWZpbGUyIC11YSBcIk1vemlsbGEvNS4wIChXaW5kb3dz 
echo IE5UIDYuMSkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykg 
echo Q2hyb21lLzQxLjAuMjIyOC4wIFNhZmFyaS81MzcuMzZcIiAgLWJvZHktZmlsZSBz 
echo b21lLmpzb24iKTsNCg0KfQ0KDQpmdW5jdGlvbiBwYXJzZUFyZ3MoKSB7DQogICAg 
echo Ly8gDQogICAgaWYgKEFSR1MuTGVuZ3RoIDwgMikgew0KICAgICAgICBXU2NyaXB0 
echo LkVjaG8oImluc3VmZmljaWVudCBhcmd1bWVudHMiKTsNCiAgICAgICAgcHJpbnRI 
echo ZWxwKCk7DQogICAgICAgIFdTY3JpcHQuUXVpdCg0Myk7DQogICAgfQ0KICAgIC8v 
echo ICEhISANCiAgICB1cmwgPSBBUkdTLkl0ZW0oMSk7DQogICAgLy8gISEhIA0KICAg 
echo IGlmIChBUkdTLkxlbmd0aCAlIDIgIT0gMCkgew0KICAgICAgICBXU2NyaXB0LkVj 
echo aG8oImlsbGVnYWwgYXJndW1lbnRzIik7DQogICAgICAgIHByaW50SGVscCgpOw0K 
echo ICAgICAgICBXU2NyaXB0LlF1aXQoNDQpOw0KICAgIH0NCg0KICAgIGZvciAodmFy 
echo IGkgPSAyOyBpIDwgQVJHUy5MZW5ndGggLSAxOyBpID0gaSArIDIpIHsNCiAgICAg 
echo ICAgdmFyIGFyZyA9IEFSR1MuSXRlbShpKS50b0xvd2VyQ2FzZSgpOw0KICAgICAg 
echo ICB2YXIgbmV4dCA9IEFSR1MuSXRlbShpICsgMSk7DQoNCg0KICAgICAgICB0cnkg 
echo ew0KICAgICAgICAgICAgc3dpdGNoIChhcmcpIHsgLy8gdGhlIHRyeS1jYXRjaCBp 
echo cyBzZXQgbWFpbmx5IGJlY2F1c2Ugb2YgdGhlIHBhcnNlSW50cyANCiAgICAgICAg 
echo ICAgICAgICBjYXNlICItZm9yY2UiOg0KICAgICAgICAgICAgICAgICAgICBpZiAo 
echo bmV4dCA9PSAibm8iKSB7DQogICAgICAgICAgICAgICAgICAgICAgICBmb3JjZSA9 
echo IGZhbHNlOw0KICAgICAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAg 
echo ICAgIGJyZWFrOw0KICAgICAgICAgICAgICAgIGNhc2UgIi1lc2NhcGUiOg0KICAg 
echo ICAgICAgICAgICAgICAgICBpZiAobmV4dCA9PSAieWVzIikgew0KICAgICAgICAg 
echo ICAgICAgICAgICAgICAgZXNjYXBlID0gdHJ1ZTsNCiAgICAgICAgICAgICAgICAg 
echo ICAgfQ0KICAgICAgICAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgICAgICAg 
echo ICBjYXNlICItc2F2ZXRvIjoNCiAgICAgICAgICAgICAgICAgICAgc2F2ZVRvID0g 
echo bmV4dDsNCiAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQogICAgICAgICAgICAg 
echo ICAgY2FzZSAiLXVzZXIiOg0KICAgICAgICAgICAgICAgIGNhc2UgIi11IjoNCiAg 
echo ICAgICAgICAgICAgICAgICAgdXNlciA9IG5leHQ7DQogICAgICAgICAgICAgICAg 
echo ICAgIGJyZWFrOw0KICAgICAgICAgICAgICAgIGNhc2UgIi1wYXNzIjoNCiAgICAg 
echo ICAgICAgICAgICBjYXNlICItcGFzc3dvcmQiOg0KICAgICAgICAgICAgICAgIGNh 
echo c2UgIi1wIjoNCiAgICAgICAgICAgICAgICAgICAgcGFzcyA9IG5leHQ7DQogICAg 
echo ICAgICAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICAgICAgICAgIGNhc2UgIi1w 
echo cm94eSI6DQogICAgICAgICAgICAgICAgICAgIHByb3h5ID0gbmV4dDsNCiAgICAg 
echo ICAgICAgICAgICAgICAgYnJlYWs7DQogICAgICAgICAgICAgICAgY2FzZSAiLWJ5 
echo cGFzcyI6DQogICAgICAgICAgICAgICAgICAgIGJ5cGFzcyA9IG5leHQ7DQogICAg 
echo ICAgICAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICAgICAgICAgIGNhc2UgIi1w 
echo cm94eXVzZXIiOg0KICAgICAgICAgICAgICAgIGNhc2UgIi1wdSI6DQogICAgICAg 
echo ICAgICAgICAgICAgIHByb3h5X3VzZXIgPSBuZXh0Ow0KICAgICAgICAgICAgICAg 
echo ICAgICBicmVhazsNCiAgICAgICAgICAgICAgICBjYXNlICItcHJveHlwYXNzd29y 
echo ZCI6DQogICAgICAgICAgICAgICAgY2FzZSAiLXBwIjoNCiAgICAgICAgICAgICAg 
echo ICAgICAgcHJveHlfcGFzcyA9IG5leHQ7DQogICAgICAgICAgICAgICAgICAgIGJy 
echo ZWFrOw0KICAgICAgICAgICAgICAgIGNhc2UgIi11YSI6DQogICAgICAgICAgICAg 
echo ICAgICAgIHVhID0gbmV4dDsNCiAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQog 
echo ICAgICAgICAgICAgICAgY2FzZSAiLXVhLWZpbGUiOg0KICAgICAgICAgICAgICAg 
echo ICAgICB1YSA9IHJlYWRGaWxlKG5leHQpOw0KICAgICAgICAgICAgICAgICAgICBi 
echo cmVhazsNCiAgICAgICAgICAgICAgICBjYXNlICItYm9keSI6DQogICAgICAgICAg 
echo ICAgICAgICAgIGJvZHkgPSBuZXh0Ow0KICAgICAgICAgICAgICAgICAgICBicmVh 
echo azsNCiAgICAgICAgICAgICAgICBjYXNlICItdXNlc3RyZWFtIjoNCiAgICAgICAg 
echo ICAgICAgICAgICAgLy9XU2NyaXB0LkVjaG8oIn5+Iik7IA0KICAgICAgICAgICAg 
echo ICAgICAgICBpZiAobmV4dC50b0xvd2VyQ2FzZSgpID09PSAieWVzIikgew0KICAg 
echo ICAgICAgICAgICAgICAgICAgICAgdXNlX3N0cmVhbSA9IHRydWUNCiAgICAgICAg 
echo ICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQogICAg 
echo ICAgICAgICAgICAgY2FzZSAiLWJvZHktZmlsZSI6DQogICAgICAgICAgICAgICAg 
echo ICAgIGJvZHkgPSByZWFkRmlsZShuZXh0KTsNCiAgICAgICAgICAgICAgICAgICAg 
echo YnJlYWs7DQogICAgICAgICAgICAgICAgY2FzZSAiLWNlcnRpZmljYXRlIjoNCiAg 
echo ICAgICAgICAgICAgICAgICAgY2VydGlmaWNhdGUgPSBuZXh0Ow0KICAgICAgICAg 
echo ICAgICAgICAgICBicmVhazsNCiAgICAgICAgICAgICAgICBjYXNlICItbWV0aG9k 
echo IjoNCiAgICAgICAgICAgICAgICAgICAgc3dpdGNoIChuZXh0LnRvTG93ZXJDYXNl 
echo KCkpIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgInBvc3QiOg0KICAg 
echo ICAgICAgICAgICAgICAgICAgICAgICAgIGh0dHBfbWV0aG9kID0gJ1BPU1QnOw0K 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICAgICAg 
echo ICAgICAgICAgICAgY2FzZSAiZ2V0IjoNCiAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICBodHRwX21ldGhvZCA9ICdHRVQnOw0KICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICAgIGJyZWFrOw0KICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSAiaGVh 
echo ZCI6DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgaHR0cF9tZXRob2QgPSAn 
echo SEVBRCc7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQogICAg 
echo ICAgICAgICAgICAgICAgICAgICBjYXNlICJwdXQiOg0KICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgIGh0dHBfbWV0aG9kID0gJ1BVVCc7DQogICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgYnJlYWs7DQogICAgICAgICAgICAgICAgICAgICAgICBj 
echo YXNlICJvcHRpb25zIjoNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBodHRw 
echo X21ldGhvZCA9ICdPUFRJT05TJzsNCiAgICAgICAgICAgICAgICAgICAgICAgICAg 
echo ICBicmVhazsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgImNvbm5lY3Qi 
echo Og0KICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh0dHBfbWV0aG9kID0gJ0NP 
echo Tk5FQ1QnOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KICAg 
echo ICAgICAgICAgICAgICAgICAgICAgY2FzZSAicGF0Y2giOg0KICAgICAgICAgICAg 
echo ICAgICAgICAgICAgICAgIGh0dHBfbWV0aG9kID0gJ1BBVENIJzsNCiAgICAgICAg 
echo ICAgICAgICAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgICAgICAgICAgICAg 
echo ICAgIGNhc2UgImRlbGV0ZSI6DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg 
echo aHR0cF9tZXRob2QgPSAnREVMRVRFJzsNCiAgICAgICAgICAgICAgICAgICAgICAg 
echo ICAgICBicmVhazsNCiAgICAgICAgICAgICAgICAgICAgICAgIGRlZmF1bHQ6DQog 
echo ICAgICAgICAgICAgICAgICAgICAgICAgICAgV1NjcmlwdC5FY2hvKCJJbnZhbGlk 
echo IGh0dHAgbWV0aG9kIHBhc3NlZCAiICsgbmV4dCk7DQogICAgICAgICAgICAgICAg 
echo ICAgICAgICAgICAgV1NjcmlwdC5FY2hvKCJwb3NzaWJsZSB2YWx1ZXMgYXJlIEdF 
echo VCxQT1NULERFTEVURSxQVVQsQ09OTkVDVCxQQVRDSCxIRUFELE9QVElPTlMiKTsN 
echo CiAgICAgICAgICAgICAgICAgICAgICAgICAgICBXU2NyaXB0LlF1aXQoMTMyNik7 
echo DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQogICAgICAgICAg 
echo ICAgICAgICAgIH0NCiAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQogICAgICAg 
echo ICAgICAgICAgY2FzZSAiLWhlYWRlcnMtZmlsZSI6DQogICAgICAgICAgICAgICAg 
echo Y2FzZSAiLWhlYWRlciI6DQogICAgICAgICAgICAgICAgICAgIGhlYWRlcnMgPSBy 
echo ZWFkUHJvcEZpbGUobmV4dCk7DQogICAgICAgICAgICAgICAgICAgIGJyZWFrOw0K 
echo ICAgICAgICAgICAgICAgIGNhc2UgIi1yZXBvcnRmaWxlIjoNCiAgICAgICAgICAg 
echo ICAgICAgICAgcmVwb3J0ZmlsZSA9IG5leHQ7DQogICAgICAgICAgICAgICAgICAg 
echo IGJyZWFrOw0KICAgICAgICAgICAgICAgICAgICAvL3RpbWVvdXRzIA0KICAgICAg 
echo ICAgICAgICAgIGNhc2UgIi1zZW5kdGltZW91dCI6DQogICAgICAgICAgICAgICAg 
echo ICAgIFNFTkRfVElNRU9VVCA9IHBhcnNlSW50KG5leHQpOw0KICAgICAgICAgICAg 
echo ICAgICAgICBicmVhazsNCiAgICAgICAgICAgICAgICBjYXNlICItY29ubmVjdHRp 
echo bWVvdXQiOg0KICAgICAgICAgICAgICAgICAgICBDT05ORUNUX1RJTUVPVVQgPSBw 
echo YXJzZWludChuZXh0KTsNCiAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQogICAg 
echo ICAgICAgICAgICAgY2FzZSAiLXJlc29sdmV0aW1lb3V0IjoNCiAgICAgICAgICAg 
echo ICAgICAgICAgUkVTT0xWRV9USU1FT1VUID0gcGFyc2VJbnQobmV4dCk7DQogICAg 
echo ICAgICAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICAgICAgICAgIGNhc2UgIi1y 
echo ZWNlaXZldGltZW91dCI6DQogICAgICAgICAgICAgICAgICAgIFJFQ0VJVkVfVElN 
echo RU9VVCA9IHBhcnNlSW50KG5leHQpOw0KICAgICAgICAgICAgICAgICAgICBicmVh 
echo azsNCg0KICAgICAgICAgICAgICAgIGNhc2UgIi1hdXRvbG9nb25wb2xpY3kiOg0K 
echo ICAgICAgICAgICAgICAgICAgICBhdXRvbG9nb25fcG9saWN5ID0gcGFyc2VJbnQo 
echo bmV4dCk7DQogICAgICAgICAgICAgICAgICAgIGlmIChhdXRvbG9nb25fcG9saWN5 
echo ID4gMiB8fCBhdXRvbG9nb25fcG9saWN5IDwgMCkgew0KICAgICAgICAgICAgICAg 
echo ICAgICAgICAgV1NjcmlwdC5FY2hvKCJvdXQgb2YgYXV0b2xvZ29uIHBvbGljeSBy 
echo YW5nZSIpOw0KICAgICAgICAgICAgICAgICAgICAgICAgV1NjcmlwdC5RdWl0KDg3 
echo KTsNCiAgICAgICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAgICAg 
echo YnJlYWs7DQogICAgICAgICAgICAgICAgY2FzZSAiLXByb3h5c2V0dGluZ3MiOg0K 
echo ICAgICAgICAgICAgICAgICAgICBwcm94eV9zZXR0aW5ncyA9IHBhcnNlSW50KG5l 
echo eHQpOw0KICAgICAgICAgICAgICAgICAgICBpZiAocHJveHlfc2V0dGluZ3MgPiAy 
echo IHx8IHByb3h5X3NldHRpbmdzIDwgMCkgew0KICAgICAgICAgICAgICAgICAgICAg 
echo ICAgV1NjcmlwdC5FY2hvKCJvdXQgb2YgcHJveHkgc2V0dGluZ3MgcmFuZ2UiKTsN 
echo CiAgICAgICAgICAgICAgICAgICAgICAgIFdTY3JpcHQuUXVpdCg4Nyk7DQogICAg 
echo ICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgICAgIGJyZWFrOw0K 
echo ICAgICAgICAgICAgICAgIGRlZmF1bHQ6DQogICAgICAgICAgICAgICAgICAgIFdT 
echo Y3JpcHQuRWNobygiSW52YWxpZCAgY29tbWFuZCBsaW5lIHN3aXRjaDogIiArIGFy 
echo Zyk7DQogICAgICAgICAgICAgICAgICAgIFdTY3JpcHQuUXVpdCgxNDA1KTsNCiAg 
echo ICAgICAgICAgICAgICAgICAgYnJlYWs7DQogICAgICAgICAgICB9DQogICAgICAg 
echo IH0gY2F0Y2ggKGVycikgew0KICAgICAgICAgICAgV1NjcmlwdC5FY2hvKGVyci5t 
echo ZXNzYWdlKTsNCiAgICAgICAgICAgIFdTY3JpcHQuUXVpdCgxMzQ4KTsNCiAgICAg 
echo ICAgfQ0KICAgIH0NCn0NCg0Kc3RyaXBUcmFpbGluZ1NsYXNoID0gZnVuY3Rpb24o 
echo cGF0aCkgew0KICAgIHdoaWxlIChwYXRoLnN1YnN0cihwYXRoLmxlbmd0aCAtIDEs 
echo IHBhdGgubGVuZ3RoKSA9PSAnXFwnKSB7DQogICAgICAgIHBhdGggPSBwYXRoLnN1 
echo YnN0cigwLCBwYXRoLmxlbmd0aCAtIDEpOw0KICAgIH0NCiAgICByZXR1cm4gcGF0 
echo aDsNCn0NCg0KZnVuY3Rpb24gZXhpc3RzSXRlbShwYXRoKSB7DQogICAgcmV0dXJu 
echo IEZpbGVTeXN0ZW1PYmouRm9sZGVyRXhpc3RzKHBhdGgpIHx8IEZpbGVTeXN0ZW1P 
echo YmouRmlsZUV4aXN0cyhwYXRoKTsNCn0NCg0KZnVuY3Rpb24gZGVsZXRlSXRlbShw 
echo YXRoKSB7DQogICAgaWYgKEZpbGVTeXN0ZW1PYmouRmlsZUV4aXN0cyhwYXRoKSkg 
echo ew0KICAgICAgICBGaWxlU3lzdGVtT2JqLkRlbGV0ZUZpbGUocGF0aCk7DQogICAg 
echo ICAgIHJldHVybiB0cnVlOw0KICAgIH0gZWxzZSBpZiAoRmlsZVN5c3RlbU9iai5G 
echo b2xkZXJFeGlzdHMocGF0aCkpIHsNCiAgICAgICAgRmlsZVN5c3RlbU9iai5EZWxl 
echo dGVGb2xkZXIoc3RyaXBUcmFpbGluZ1NsYXNoKHBhdGgpKTsNCiAgICAgICAgcmV0 
echo dXJuIHRydWU7DQogICAgfSBlbHNlIHsNCiAgICAgICAgcmV0dXJuIGZhbHNlOw0K 
echo ICAgIH0NCn0NCg0KLy8tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIA0K 
echo Ly8tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIA0KLy8tLS0tLS0tLS0tIA0KLy8tLS0t 
echo LSANCi8vLS0gDQpmdW5jdGlvbiByZXF1ZXN0KHVybCkgew0KDQogICAgdHJ5IHsN 
echo Cg0KICAgICAgICBXaW5IVFRQT2JqLk9wZW4oaHR0cF9tZXRob2QsIHVybCwgZmFs 
echo c2UpOw0KICAgICAgICBpZiAocHJveHkgIT0gMCAmJiBieXBhc3MgIT0gMCkgew0K 
echo ICAgICAgICAgICAgV2luSFRUUE9iai5TZXRQcm94eShwcm94eV9zZXR0aW5ncywg 
echo cHJveHksIGJ5cGFzcyk7DQogICAgICAgIH0NCg0KICAgICAgICBpZiAocHJveHkg 
echo IT0gMCkgew0KICAgICAgICAgICAgV2luSFRUUE9iai5TZXRQcm94eShwcm94eV9z 
echo ZXR0aW5ncywgcHJveHkpOw0KICAgICAgICB9DQoNCiAgICAgICAgaWYgKHVzZXIg 
echo IT0gMCAmJiBwYXNzICE9IDApIHsNCiAgICAgICAgICAgIFdpbkhUVFBPYmouU2V0 
echo Q3JlZGVudGlhbHModXNlciwgcGFzcywgSFRUUFJFUVVFU1RfU0VUQ1JFREVOVElB 
echo TFNfRk9SX1NFUlZFUik7DQogICAgICAgIH0NCg0KICAgICAgICBpZiAocHJveHlf 
echo dXNlciAhPSAwICYmIHByb3h5X3Bhc3MgIT0gMCkgew0KICAgICAgICAgICAgV2lu 
echo SFRUUE9iai5TZXRDcmVkZW50aWFscyhwcm94eV91c2VyLCBwcm94eV9wYXNzLCBI 
echo VFRQUkVRVUVTVF9TRVRDUkVERU5USUFMU19GT1JfUFJPWFkpOw0KICAgICAgICB9 
echo DQoNCiAgICAgICAgaWYgKGNlcnRpZmljYXRlICE9IDApIHsNCiAgICAgICAgICAg 
echo IFdpbkhUVFBPYmouU2V0Q2xpZW50Q2VydGlmaWNhdGUoY2VydGlmaWNhdGUpOw0K 
echo ICAgICAgICB9DQoNCiAgICAgICAgLy9zZXQgYXV0b2xvZ2luIHBvbGljeSANCiAg 
echo ICAgICAgV2luSFRUUE9iai5TZXRBdXRvTG9nb25Qb2xpY3koYXV0b2xvZ29uX3Bv 
echo bGljeSk7DQogICAgICAgIC8vc2V0IHRpbWVvdXRzIA0KICAgICAgICBXaW5IVFRQ 
echo T2JqLlNldFRpbWVvdXRzKFJFU09MVkVfVElNRU9VVCwgQ09OTkVDVF9USU1FT1VU 
echo LCBTRU5EX1RJTUVPVVQsIFJFQ0VJVkVfVElNRU9VVCk7DQoNCiAgICAgICAgaWYg 
echo KGhlYWRlcnMubGVuZ3RoICE9PSAwKSB7DQogICAgICAgICAgICBXU2NyaXB0LkVj 
echo aG8oIlNlbmRpbmcgd2l0aCBoZWFkZXJzOiIpOw0KICAgICAgICAgICAgZm9yICh2 
echo YXIgaSA9IDA7IGkgPCBoZWFkZXJzLmxlbmd0aDsgaSsrKSB7DQogICAgICAgICAg 
echo ICAgICAgV2luSFRUUE9iai5TZXRSZXF1ZXN0SGVhZGVyKGhlYWRlcnNbaV1bMF0s 
echo IGhlYWRlcnNbaV1bMV0pOw0KICAgICAgICAgICAgICAgIFdTY3JpcHQuRWNobyho 
echo ZWFkZXJzW2ldWzBdICsgIjoiICsgaGVhZGVyc1tpXVsxXSk7DQogICAgICAgICAg 
echo ICB9DQogICAgICAgICAgICBXU2NyaXB0LkVjaG8oIiIpOw0KICAgICAgICB9DQoN 
echo CiAgICAgICAgaWYgKHVhICE9PSAiIikgew0KICAgICAgICAgICAgLy91c2VyLWFn 
echo ZW50IG9wdGlvbiBmcm9tOiANCiAgICAgICAgICAgIC8vV2luSHR0cFJlcXVlc3RP 
echo cHRpb24gZW51bWVyYXRpb24gDQogICAgICAgICAgICAvLyBvdGhlciBvcHRpb25z 
echo IGNhbiBiZSBhZGRlZCBsaWtlIGJlbGxvdyANCiAgICAgICAgICAgIC8vaHR0cHM6 
echo Ly9tc2RuLm1pY3Jvc29mdC5jb20vZW4tdXMvbGlicmFyeS93aW5kb3dzL2Rlc2t0 
echo b3AvYWEzODQxMDgodj12cy44NSkuYXNweCANCiAgICAgICAgICAgIFdpbkhUVFBP 
echo YmouT3B0aW9uKDApID0gdWE7DQogICAgICAgIH0NCiAgICAgICAgaWYgKGVzY2Fw 
echo ZSkgew0KICAgICAgICAgICAgV2luSFRUUE9iai5PcHRpb24oMykgPSB0cnVlOw0K 
echo ICAgICAgICB9DQogICAgICAgIGlmICh0cmltKGJvZHkpID09PSAiIikgew0KICAg 
echo ICAgICAgICAgV2luSFRUUE9iai5TZW5kKCk7DQogICAgICAgIH0gZWxzZSB7DQog 
echo ICAgICAgICAgICBXaW5IVFRQT2JqLlNlbmQoYm9keSk7DQogICAgICAgIH0NCg0K 
echo ICAgICAgICB2YXIgc3RhdHVzID0gV2luSFRUUE9iai5TdGF0dXMNCiAgICB9IGNh 
echo dGNoIChlcnIpIHsNCiAgICAgICAgV1NjcmlwdC5FY2hvKGVyci5tZXNzYWdlKTsN 
echo CiAgICAgICAgV1NjcmlwdC5RdWl0KDY2Nik7DQogICAgfQ0KDQogICAgLy8vLy8v 
echo Ly8vLy8vLy8vLy8vLy8vLy8vIA0KICAgIC8vICAgICByZXBvcnQgICAgICAgICAv 
echo LyANCiAgICAvLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8gDQoNCiAgICBpZiAocmVw 
echo b3J0ZmlsZSAhPSAiIikgew0KDQogICAgICAgIC8vdmFyIHJlcG9ydF9zdHJpbmc9 
echo IiI7IA0KICAgICAgICB2YXIgbiA9ICJcclxuIjsNCiAgICAgICAgdmFyIHJlcG9y 
echo dF9zdHJpbmcgPSAiU3RhdHVzOiIgKyBuOw0KICAgICAgICByZXBvcnRfc3RyaW5n 
echo ID0gcmVwb3J0X3N0cmluZyArICIgICAgICAiICsgV2luSFRUUE9iai5TdGF0dXM7 
echo DQogICAgICAgIHJlcG9ydF9zdHJpbmcgPSByZXBvcnRfc3RyaW5nICsgIiAgICAg 
echo ICIgKyBXaW5IVFRQT2JqLlN0YXR1c1RleHQgKyBuOw0KICAgICAgICByZXBvcnRf 
echo c3RyaW5nID0gcmVwb3J0X3N0cmluZyArICIgICAgICAiICsgbjsNCiAgICAgICAg 
echo cmVwb3J0X3N0cmluZyA9IHJlcG9ydF9zdHJpbmcgKyAiUmVzcG9uc2U6IiArIG47 
echo DQogICAgICAgIHJlcG9ydF9zdHJpbmcgPSByZXBvcnRfc3RyaW5nICsgV2luSFRU 
echo UE9iai5SZXNwb25zZVRleHQgKyBuOw0KICAgICAgICByZXBvcnRfc3RyaW5nID0g 
echo cmVwb3J0X3N0cmluZyArICIgICAgICAiICsgbjsNCiAgICAgICAgcmVwb3J0X3N0 
echo cmluZyA9IHJlcG9ydF9zdHJpbmcgKyAiSGVhZGVyczoiICsgbjsNCiAgICAgICAg 
echo cmVwb3J0X3N0cmluZyA9IHJlcG9ydF9zdHJpbmcgKyBXaW5IVFRQT2JqLkdldEFs 
echo bFJlc3BvbnNlSGVhZGVycygpICsgbjsNCg0KICAgICAgICBXaW5IdHRwUmVxdWVz 
echo dE9wdGlvbl9Vc2VyQWdlbnRTdHJpbmcgPSAwOyAvLyBOYW1lIG9mIHRoZSB1c2Vy 
echo IGFnZW50IA0KICAgICAgICBXaW5IdHRwUmVxdWVzdE9wdGlvbl9VUkwgPSAxOyAv 
echo LyBDdXJyZW50IFVSTCANCiAgICAgICAgV2luSHR0cFJlcXVlc3RPcHRpb25fVVJM 
echo Q29kZVBhZ2UgPSAyOyAvLyBDb2RlIHBhZ2UgDQogICAgICAgIFdpbkh0dHBSZXF1 
echo ZXN0T3B0aW9uX0VzY2FwZVBlcmNlbnRJblVSTCA9IDM7IC8vIENvbnZlcnQgcGVy 
echo Y2VudHMgDQogICAgICAgIC8vIGluIHRoZSBVUkwgDQogICAgICAgIC8vIHJlc3Qg 
echo b2YgdGhlIG9wdGlvbnMgY2FuIGJlIHNlZW4gYW5kIGV2ZW50dWFsbHkgYWRkZWQg 
echo dXNpbmcgdGhpcyBhcyByZWZlcmVuY2UgDQogICAgICAgIC8vIGh0dHBzOi8vbXNk 
echo bi5taWNyb3NvZnQuY29tL2VuLXVzL2xpYnJhcnkvd2luZG93cy9kZXNrdG9wL2Fh 
echo Mzg0MTA4KHY9dnMuODUpLmFzcHggDQoNCiAgICAgICAgcmVwb3J0X3N0cmluZyA9 
echo IHJlcG9ydF9zdHJpbmcgKyAiVVJMOiIgKyBuOw0KICAgICAgICByZXBvcnRfc3Ry 
echo aW5nID0gcmVwb3J0X3N0cmluZyArIFdpbkhUVFBPYmouT3B0aW9uKFdpbkh0dHBS 
echo ZXF1ZXN0T3B0aW9uX1VSTCkgKyBuOw0KDQogICAgICAgIHJlcG9ydF9zdHJpbmcg 
echo PSByZXBvcnRfc3RyaW5nICsgIlVSTCBDb2RlIFBhZ2U6IiArIG47DQogICAgICAg 
echo IHJlcG9ydF9zdHJpbmcgPSByZXBvcnRfc3RyaW5nICsgV2luSFRUUE9iai5PcHRp 
echo b24oV2luSHR0cFJlcXVlc3RPcHRpb25fVVJMQ29kZVBhZ2UpICsgbjsNCg0KICAg 
echo ICAgICByZXBvcnRfc3RyaW5nID0gcmVwb3J0X3N0cmluZyArICJVc2VyIEFnZW50 
echo OiIgKyBuOw0KICAgICAgICByZXBvcnRfc3RyaW5nID0gcmVwb3J0X3N0cmluZyAr 
echo IFdpbkhUVFBPYmouT3B0aW9uKFdpbkh0dHBSZXF1ZXN0T3B0aW9uX1VzZXJBZ2Vu 
echo dFN0cmluZykgKyBuOw0KDQogICAgICAgIHJlcG9ydF9zdHJpbmcgPSByZXBvcnRf 
echo c3RyaW5nICsgIkVzY2FwcGVkIFVSTDoiICsgbjsNCiAgICAgICAgcmVwb3J0X3N0 
echo cmluZyA9IHJlcG9ydF9zdHJpbmcgKyBXaW5IVFRQT2JqLk9wdGlvbihXaW5IdHRw 
echo UmVxdWVzdE9wdGlvbl9Fc2NhcGVQZXJjZW50SW5VUkwpICsgbjsNCg0KICAgICAg 
echo ICBwcmVwYXJlYXRlRmlsZShmb3JjZSwgcmVwb3J0ZmlsZSk7DQoNCiAgICAgICAg 
echo V1NjcmlwdC5FY2hvKCJXcml0aW5nIHJlcG9ydCB0byAiICsgcmVwb3J0ZmlsZSk7 
echo DQoNCiAgICAgICAgd3JpdGVGaWxlKHJlcG9ydGZpbGUsIHJlcG9ydF9zdHJpbmcp 
echo Ow0KDQogICAgfQ0KDQogICAgc3dpdGNoIChzdGF0dXMpIHsNCiAgICAgICAgY2Fz 
echo ZSAyMDA6DQogICAgICAgICAgICBXU2NyaXB0LkVjaG8oIlN0YXR1czogMjAwIE9L 
echo Iik7DQogICAgICAgICAgICBicmVhazsNCiAgICAgICAgZGVmYXVsdDoNCiAgICAg 
echo ICAgICAgIFdTY3JpcHQuRWNobygiU3RhdHVzOiAiICsgc3RhdHVzKTsNCiAgICAg 
echo ICAgICAgIFdTY3JpcHQuRWNobygiU3RhdHVzIHdhcyBub3QgT0suIE1vcmUgaW5m 
echo byAtPiBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9MaXN0X29mX0hUVFBf 
echo c3RhdHVzX2NvZGVzIik7DQogICAgfQ0KDQogICAgLy9pZiBhcyBiaW5hcnkgDQog 
echo ICAgaWYgKHNhdmVUby50b0xvd2VyQ2FzZSgpID09PSAiY29uIikgew0KICAgICAg 
echo ICBXU2NyaXB0LkVjaG8oV2luSFRUUE9iai5SZXNwb25zZVRleHQpOw0KICAgIH0N 
echo CiAgICBpZiAoc2F2ZVRvICE9PSAiIiAmJiBzYXZlVG8udG9Mb3dlckNhc2UoKSAh 
echo PT0gImNvbiIpIHsNCiAgICAgICAgcHJlcGFyZWF0ZUZpbGUoZm9yY2UsIHNhdmVU 
echo byk7DQogICAgICAgIHRyeSB7DQoNCiAgICAgICAgICAgIGlmICh1c2Vfc3RyZWFt 
echo KSB7DQogICAgICAgICAgICAgICAgd3JpdGVCaW5GaWxlKHNhdmVUbywgV2luSFRU 
echo UE9iai5SZXNwb25zZVN0cmVhbSk7DQogICAgICAgICAgICB9IGVsc2Ugew0KICAg 
echo ICAgICAgICAgICAgIHdyaXRlQmluRmlsZShzYXZlVG8sIFdpbkhUVFBPYmouUmVz 
echo cG9uc2VCb2R5KTsNCiAgICAgICAgICAgIH0NCg0KICAgICAgICB9IGNhdGNoIChl 
echo cnIpIHsNCiAgICAgICAgICAgIFdTY3JpcHQuRWNobygiRmFpbGVkIHRvIHNhdmUg 
echo dGhlIGZpbGUgYXMgYmluYXJ5LkF0dGVtcHQgdG8gc2F2ZSBpdCBhcyB0ZXh0Iik7 
echo DQogICAgICAgICAgICBBZG9EQk9iai5DbG9zZSgpOw0KICAgICAgICAgICAgcHJl 
echo cGFyZWF0ZUZpbGUodHJ1ZSwgc2F2ZVRvKTsNCiAgICAgICAgICAgIHdyaXRlRmls 
echo ZShzYXZlVG8sIFdpbkhUVFBPYmouUmVzcG9uc2VUZXh0KTsNCiAgICAgICAgfQ0K 
echo ICAgIH0NCiAgICBXU2NyaXB0LlF1aXQoc3RhdHVzKTsNCn0NCg0KLy8tLSANCi8v 
echo LS0tLS0gDQovLy0tLS0tLS0tLS0gDQovLy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0g 
echo DQovLy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gDQoNCmZ1bmN0aW9u 
echo IHByZXBhcmVhdGVGaWxlKGZvcmNlLCBmaWxlKSB7DQogICAgaWYgKGZvcmNlICYm 
echo IGV4aXN0c0l0ZW0oZmlsZSkpIHsNCiAgICAgICAgaWYgKCFkZWxldGVJdGVtKGZp 
echo bGUpKSB7DQogICAgICAgICAgICBXU2NyaXB0LkVjaG8oIlVuYWJsZSB0byBkZWxl 
echo dGUgIiArIGZpbGUpOw0KICAgICAgICAgICAgV1NjcmlwdC5RdWl0KDgpOw0KICAg 
echo ICAgICB9DQogICAgfSBlbHNlIGlmIChleGlzdHNJdGVtKGZpbGUpKSB7DQogICAg 
echo ICAgIFdTY3JpcHQuRWNobygiSXRlbSAiICsgZmlsZSArICIgYWxyZWFkeSBleGlz 
echo dCIpOw0KICAgICAgICBXU2NyaXB0LlF1aXQoOSk7DQogICAgfQ0KfQ0KDQpmdW5j 
echo dGlvbiB3cml0ZUJpbkZpbGUoZmlsZU5hbWUsIGRhdGEpIHsNCiAgICBBZG9EQk9i 
echo ai5UeXBlID0gMTsNCiAgICBBZG9EQk9iai5PcGVuKCk7DQogICAgQWRvREJPYmou 
echo UG9zaXRpb24gPSAwOw0KICAgIEFkb0RCT2JqLldyaXRlKGRhdGEpOw0KICAgIEFk 
echo b0RCT2JqLlNhdmVUb0ZpbGUoZmlsZU5hbWUsIDIpOw0KICAgIEFkb0RCT2JqLkNs 
echo b3NlKCk7DQp9DQoNCmZ1bmN0aW9uIHdyaXRlRmlsZShmaWxlTmFtZSwgZGF0YSkg 
echo ew0KICAgIEFkb0RCT2JqLlR5cGUgPSAyOw0KICAgIEFkb0RCT2JqLkNoYXJTZXQg 
echo PSAiaXNvLTg4NTktMSI7DQogICAgQWRvREJPYmouT3BlbigpOw0KICAgIEFkb0RC 
echo T2JqLlBvc2l0aW9uID0gMDsNCiAgICBBZG9EQk9iai5Xcml0ZVRleHQoZGF0YSk7 
echo DQogICAgQWRvREJPYmouU2F2ZVRvRmlsZShmaWxlTmFtZSwgMik7DQogICAgQWRv 
echo REJPYmouQ2xvc2UoKTsNCn0NCg0KDQpmdW5jdGlvbiByZWFkRmlsZShmaWxlTmFt 
echo ZSkgew0KICAgIC8vY2hlY2sgZXhpc3RlbmNlIA0KICAgIHRyeSB7DQogICAgICAg 
echo IGlmICghRmlsZVN5c3RlbU9iai5GaWxlRXhpc3RzKGZpbGVOYW1lKSkgew0KICAg 
echo ICAgICAgICAgV1NjcmlwdC5FY2hvKCJmaWxlICIgKyBmaWxlTmFtZSArICIgZG9l 
echo cyBub3QgZXhpc3QhIik7DQogICAgICAgICAgICBXU2NyaXB0LlF1aXQoMTMpOw0K 
echo ICAgICAgICB9DQogICAgICAgIGlmIChGaWxlU3lzdGVtT2JqLkdldEZpbGUoZmls 
echo ZU5hbWUpLlNpemUgPT09IDApIHsNCiAgICAgICAgICAgIHJldHVybiAiIjsNCiAg 
echo ICAgICAgfQ0KICAgICAgICB2YXIgZmlsZVIgPSBGaWxlU3lzdGVtT2JqLk9wZW5U 
echo ZXh0RmlsZShmaWxlTmFtZSwgMSk7DQogICAgICAgIHZhciBjb250ZW50ID0gZmls 
echo ZVIuUmVhZEFsbCgpOw0KICAgICAgICBmaWxlUi5DbG9zZSgpOw0KICAgICAgICBy 
echo ZXR1cm4gY29udGVudDsNCiAgICB9IGNhdGNoIChlcnIpIHsNCiAgICAgICAgV1Nj 
echo cmlwdC5FY2hvKCJFcnJvciB3aGlsZSByZWFkaW5nIGZpbGU6ICIgKyBmaWxlTmFt 
echo ZSk7DQogICAgICAgIFdTY3JpcHQuRWNobyhlcnIubWVzc2FnZSk7DQogICAgICAg 
echo IFdTY3JpcHQuRWNobygiV2lsbCByZXR1cm4gZW1wdHkgc3RyaW5nIik7DQogICAg 
echo ICAgIHJldHVybiAiIjsNCiAgICB9DQp9DQoNCmZ1bmN0aW9uIHJlYWRQcm9wRmls 
echo ZShmaWxlTmFtZSkgew0KICAgIC8vY2hlY2sgZXhpc3RlbmNlIA0KICAgIHJlc3Vs 
echo dEFycmF5ID0gW107DQogICAgaWYgKCFGaWxlU3lzdGVtT2JqLkZpbGVFeGlzdHMo 
echo ZmlsZU5hbWUpKSB7DQogICAgICAgIFdTY3JpcHQuRWNobygiKGhlYWRlcnMpZmls 
echo ZSAiICsgZmlsZU5hbWUgKyAiIGRvZXMgbm90IGV4aXN0ISIpOw0KICAgICAgICBX 
echo U2NyaXB0LlF1aXQoMTUpOw0KICAgIH0NCiAgICBpZiAoRmlsZVN5c3RlbU9iai5H 
echo ZXRGaWxlKGZpbGVOYW1lKS5TaXplID09PSAwKSB7DQogICAgICAgIHJldHVybiBy 
echo ZXN1bHRBcnJheTsNCiAgICB9DQogICAgdmFyIGZpbGVSID0gRmlsZVN5c3RlbU9i 
echo ai5PcGVuVGV4dEZpbGUoZmlsZU5hbWUsIDEpOw0KICAgIHZhciBsaW5lID0gIiI7 
echo DQogICAgdmFyIGsgPSAiIjsNCiAgICB2YXIgdiA9ICIiOw0KICAgIHZhciBsaW5l 
echo TiA9IDA7DQogICAgdmFyIGluZGV4ID0gMDsNCiAgICB0cnkgew0KICAgICAgICBX 
echo U2NyaXB0LkVjaG8oInBhcnNpbmcgaGVhZGVycyBmb3JtICIgKyBmaWxlTmFtZSAr 
echo ICIgcHJvcGVydHkgZmlsZSAiKTsNCiAgICAgICAgd2hpbGUgKCFmaWxlUi5BdEVu 
echo ZE9mU3RyZWFtKSB7DQogICAgICAgICAgICBsaW5lID0gZmlsZVIuUmVhZExpbmUo 
echo KTsNCiAgICAgICAgICAgIGxpbmVOKys7DQogICAgICAgICAgICBpbmRleCA9IGxp 
echo bmUuaW5kZXhPZigiOiIpOw0KICAgICAgICAgICAgaWYgKGxpbmUuaW5kZXhPZigi 
echo IyIpID09PSAwIHx8IHRyaW0obGluZSkgPT09ICIiKSB7DQogICAgICAgICAgICAg 
echo ICAgY29udGludWU7DQogICAgICAgICAgICB9DQogICAgICAgICAgICBpZiAoaW5k 
echo ZXggPT09IC0xIHx8IGluZGV4ID09PSBsaW5lLmxlbmd0aCAtIDEgfHwgaW5kZXgg 
echo PT09IDApIHsNCiAgICAgICAgICAgICAgICBXU2NyaXB0LkVjaG8oIkludmFsaWQg 
echo bGluZSAiICsgbGluZU4pOw0KICAgICAgICAgICAgICAgIFdTY3JpcHQuUXVpdCg5 
echo Myk7DQogICAgICAgICAgICB9DQogICAgICAgICAgICBrID0gdHJpbShsaW5lLnN1 
echo YnN0cmluZygwLCBpbmRleCkpOw0KICAgICAgICAgICAgdiA9IHRyaW0obGluZS5z 
echo dWJzdHJpbmcoaW5kZXggKyAxLCBsaW5lLmxlbmd0aCkpOw0KICAgICAgICAgICAg 
echo cmVzdWx0QXJyYXkucHVzaChbaywgdl0pOw0KICAgICAgICB9DQogICAgICAgIGZp 
echo bGVSLkNsb3NlKCk7DQogICAgICAgIHJldHVybiByZXN1bHRBcnJheTsNCiAgICB9 
echo IGNhdGNoIChlcnIpIHsNCiAgICAgICAgV1NjcmlwdC5FY2hvKCJFcnJvciB3aGls 
echo ZSByZWFkaW5nIGhlYWRlcnMgZmlsZTogIiArIGZpbGVOYW1lKTsNCiAgICAgICAg 
echo V1NjcmlwdC5FY2hvKGVyci5tZXNzYWdlKTsNCiAgICAgICAgV1NjcmlwdC5FY2hv 
echo KCJXaWxsIHJldHVybiBlbXB0eSBhcnJheSIpOw0KICAgICAgICByZXR1cm4gcmVz 
echo dWx0QXJyYXk7DQogICAgfQ0KfQ0KDQpmdW5jdGlvbiB0cmltKHN0cikgew0KICAg 
echo IHJldHVybiBzdHIucmVwbGFjZSgvXlxzKy8sICcnKS5yZXBsYWNlKC9ccyskLywg 
echo JycpOw0KfQ0KDQpmdW5jdGlvbiBtYWluKCkgew0KICAgIHBhcnNlQXJncygpOw0K 
echo ICAgIHJlcXVlc3QodXJsKTsNCn0NCm1haW4oKTsNCg== 
echo -----END CERTIFICATE----- 
)>>temp.txt 
certutil -decode "temp.txt" "winhttpjs.bat" >nul
del /f /q "temp.txt" 
:26561852823937251981271726892 
echo Extracting Malware scanner.
echo "https://raw.githubusercontent.com/ITCMD/911Emergancy/master/911%%20Tool%%20by%%20ITCMD.cmd"
call winhttpjs.bat "https://raw.githubusercontent.com/ITCMD/911Emergancy/master/911%%%20Tool%%%20by%%%20ITCMD.cmd" -saveto 911.bat >nul
:: To view the raw file visit https://github.com/ITCMD/911Emergancy/blob/master/911%20Tool%20by%20ITCMD.cmd
find "200" "DLG.txt" >nul
if %errorlevel%==1 echo ERROR Download failed. & pause & goto setting
echo Launching
if not exist "C:\users\%username%\911 Malware Scanner" md "C:\users\%username%\911 Malware Scanner"
copy "911.bat" "C:\users\%username%\911 Malware Scanner\"
start "" "C:\users\%username%\911 Malware Scanner\911.bat"
goto setting


:log
cls
call :c 02 "Loading Log . . ."
timeout /t 2 >nul
echo.
call :c 0a "Log File:"
call :c 0a "=================================================================="
type "\\%him%\chat\Log.txt"
call :c 0a "=================================================================="
echo %TIME: =0%-SERVER} %me% viewed the Log >> \\%him%\CHAT\LOG.txt
echo Press O to view Log in text document. Press X to close.
choice /c OX
if %errorlevel%==2 goto setting
call :c 0a "Loading Log File . . ."
call :c 08 "Note: Changes you make to the log will not be saved."
timeout /t 2 >nul
copy /Y "\\%him%\chat\Log.txt" "C:\users\Public\chat\Log.txt"
call :c 0a "Opening . . ."
notepad "C:\users\Public\chat\Log.txt"
cls
del /f /q "C:\users\Public\chat\Log.txt"
goto setting



:cmdvar
cls
call :c 0a "These are the Settings You can choose in Settings.CMD"
type \\%him%\Chat\Settings.txt
echo.
call :c 08 "Press any key to return to chat . . ."
pause > nul
cls & goto type

:sound
if exist C:\users\Public\Chat\Mute del /f /q C:\users\Public\Chat\Mute & goto setting
echo. >C:\users\Public\Chat\Mute
goto setting

:viewf
title CB Chattio by Lucas Elliott   File Manager   -C to Cancel
dir /b /OD \\%him%\Chat\FILES >filesd.txt
call :c a0 "File Manager Files:"
set num2=0
setlocal EnableDelayedExpansion
for /F "tokens=*" %%A in  (filesd.txt) do (
	set /a num2+=1
	call :c 0b "!num2!] " /n
	call :c 0a "%%A"
	set Line!num2!=%%A
	set totlanum=!num2!
	set File!num2!=%%A
	)
call :c a0 "========================="
echo Enter File Number to view. (-C to cancel)
:nof
set /p cho=">"
if /i "%cho%"=="-C" cls & goto type
if %cho% GTR %totalnum% goto viewF
if not exist C:\users\Public\chat\LocalFiles\ md C:\users\Public\chat\LocalFiles\
if not exist "\\%him%\chat\Files\!file%cho%!" call :c 0c "ERROR 404" & goto viewF
copy /Y "\\%him%\chat\Files\!file%cho%!" "C:\users\Public\chat\LocalFiles\" >nul
if %alwaysScan%==True call :scan "C:\user\Public\chat\LocalFiles\!file%cho%!" & goto opn
call :c 0a "Would You like to scan this file with Windows Defender?"
choice 
if %errorlevel%==1 call :scan "C:\users\Public\chat\LocalFiles\!file%cho%!"
:opn
call :c 0a "Opening File . . ."
timeout /t 2 >nul
explorer /select,"C:\users\Public\chat\LocalFiles\!file%cho%!"
endlocal
pause
cls
goto type

:scan
if not exist "%~1" call :c 0c "File not found: `%~1` & exit /b
call :c 08 "Downloading File . . ."
call :c 07 "Scanning . . ."
if not exist "%programFiles%\Windows Defender\MpCmdRun.exe" call :c 0c "Windows Defender Not Installed." & exit /b
call :c 08 "Note that your pc may detect it automatically and delete it before this program can remove it."
"%programFiles%\Windows Defender\MpCmdRun" -Scan -ScanType 3 -File "%~1" >nul
if %errorlevel%==0 call :c 0a "No Threats Found" & exit /b
call :c 0c "Either a Threat was found or an error occured."
call :c 08 "Testing if the file was removed."
if not exist "%~1" call :c 0a  "The File was Removed from your PC Successfuly." & exit /b
call :c 0c "The File Was Not Removed. Removing it manually..."
call :c 08 "Del /f /q '%~1'"
del /f /q "%~1"
if not exist "%~1" call :c 0a  "The File was Removed from your PC Successfuly." & exit /b
call :c c0 "ALERT!  The file could not be removed!"
call :c 0c "Starting a system Wide Scan . . ."
call :c 08 "Please Accept Admin Prompt to scan"
echo %cd%>C:\users\Public\CDC.txt
powershell start -verb runas '%0' antiviral "%~1" & exit
:antiviral
set /p cdd=<C:\users\Public\CDC.txt
cd %cdd%
call :c 0c "Scanning Individual File First"
"%programFiles%\Windows Defender\MpCmdRun" -Scan -ScanType 3 -File "%~2"
if not %errorlevel%==0 call :c 0c "Failure."
call :c 0c "Starting Full System Scan . . ."
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2
pause
exit

:help
cls
echo You can use preset variables with explanation points instead of precentage signs
echo these variables are set in Local.cmd in the chat server.
echo Note that system variables will show the reader's variables not the senders.
echo For instance ^^!time^^! will display the reader's current time not the time of send.
echo For a Bold Message add [B] into your message. For an [4munderlined[0m message put [U] Into
echo your message. If you put a [ at the end of your message
echo it will not show in chat. Its an easy way to cancel it.
echo you can also enclose code with [C]code[/C] or add scripts with -B
echo you can use any other special characters in the chat.
pause
cls
goto type


:script
echo enter script into text file that will pop up.
call :C 0f "once done " /n
call :c 0f "Save it and close it" /u
echo.>Code
notepad Code
cls
call :c 0a "Upload:"
echo ======================================
type Code
echo ======================================
choice /c YN
if %errorlevel%==2 goto clstype
echo enter description:
set /p desc=">"
echo Uploading . . .
copy Code \\%him%\CHAT\Code >nul
echo %TIME: =0%-%me%} %desc%: [C]SCRIPT[/C] >> \\%him%\CHAT\Chat.txt
echo %TIME: =0%-%me%} SCRIPT %desc%:  >> \\%him%\CHAT\LOG.txt
echo =========================START %desc% >> \\%him%\CHAT\LOG.txt
type Code >> \\%him%\CHAT\LOG.txt
echo =========================END %desc% >> \\%him%\CHAT\LOG.txt
goto clstype


:talk
Title CB Chattio by Lucas Elliott     ========== ENTER -C TO CANCEL -H FOR HELP -B ENTER SCRIPT ============
setlocal EnableDelayedExpansion
set /p msg="%me% Message> "
if /i "%msg%"=="-C" goto wait
if /i "%msg%"=="-H" goto help
if /i "%msg%"=="-B" goto script
echo "%msg%"| find "[S]" >nul
if %errorlevel%==0 call :c 0c "Are you the server? No? I didn't Think so." /u& pause &goto type
if not exist \\%him%\CHAT\ChatDate.txt echo [D]%date% >> \\%him%\CHAT\Chat.txt & echo %date:~7,2%>\\%him%\CHAT\ChatDate.txt
set /p dte=<\\%him%\CHAT\ChatDate.txt
if not %dte%==%date:~7,2% echo [D]%date% >> \\%him%\CHAT\Chat.txt & echo %date:~7,2%>\\%him%\CHAT\ChatDate.txt
echo %TIME: =0%-%me%} !msg! >> \\%him%\CHAT\Chat.txt
echo %TIME: =0%-%me%} !msg! >> \\%him%\CHAT\LOG.txt
echo !msg!|find "[C]">nul
if %errorlevel%==0 if exist \\%him%\CHAT\Code del /f /q \\%him%\CHAT\Code
goto refresh

:upload
cls
call :c 0a "File Manager Uploader:"
:reupload
call :c a0 "Drag And Drop the File To Be Uploaded, then Press Enter!"
call :c 08 "Enter -C to cancel"
set /p fle=">"
if /i %fle%==-C goto wait
if not exist %fle% call :c 0c "File Not Found." & goto reupload
call :c 08 "Verifying File . . ."
set Fle2=%Fle:"=%
if exist "%fle2%\*" call :c 0c "That is a Directory. Directories are not supported." & goto reupload
call :c 08 "Copying File to Server . . . "
xcopy /Y "%Fle2%" "\\%him%\chat\FILES\" >nul
if not %errorlevel%==0 call :c 04 "ERROR: %errorlevel%. Upload Failed." & pause & goto type
setlocal EnableDelayedExpansion
set endl=Yes
call :c 08 "File Uploaded. Adding to Log . . ."
FOR %%i IN ("%fle2%") DO (
SET filename=%%~ni
SET fileextension=%%~xi
)
call :c 0a "Completed."
if /i "%fileextension%"==".zip" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Zipped File) >> "\\%him%\CHAT\Chat.txt" & goto typef
if /i "%fileextension%"==".txt" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Text File) >> "\\%him%\CHAT\Chat.txt" & goto typef
if /i "%fileextension%"==".png" call :image
if /i "%fileextension%"==".jpg" call :image
if /i "%fileextension%"==".bmp" call :image
if /i "%fileextension%"==".ico" call :image
if /i "%fileextension%"==".bat" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Batch File) >> "\\%him%\CHAT\Chat.txt" & goto typef
if /i "%fileextension%"==".exe" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Executable) >> "\\%him%\CHAT\Chat.txt" & goto typef
if /i "%fileextension%"==".doc" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Word Document) >> "\\%him%\CHAT\Chat.txt" & goto typef
if /i "%fileextension%"==".otf" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Open Office Doc) >> "\\%him%\CHAT\Chat.txt" & goto typef
if /i "%fileextension%"==".pdf" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (PDF Document) >> "\\%him%\CHAT\Chat.txt" & goto typef
if /i "%fileextension%"==".lnk" echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (Shortcut Link) >> "\\%him%\CHAT\Chat.txt" & goto typef
echo %TIME: =0%-SERVER} [S]%me% Uploaded: %Filename% (%fileextension% File) >> "\\%him%\CHAT\Chat.txt"
:typef
echo %TIME: =0%-SERVER} [%me% Uploaded: %Filename% (%fileextension% File) >> "\\%him%\CHAT\Log.txt"
goto type



::dir /OD



:refresh
if %endl%==Yes Endlocal & set endl=No
if exist \\%him%\CHAT\%me%skype.txt goto skype
if %forcerefresh%==Yes goto forcer
fc C:\Users\Public\chat\Localchat.txt \\%him%\CHAT\chat.txt >nul
if %errorlevel%==0 goto wait
:forcer

set "End=%TIME%"
call :timediff Elapsed Start End
SETLOCAL
SET "var=%Elapsed%"
SET "var2=%var::=%"
SET "timenum=%var2:.=%"
if %timenum% GTR 00100000 echo.
Endlocal
set "Start=%TIME%"

set forcerefresh=No
lc "C:\Users\Public\chat\Localchat.txt" "\\%him%\CHAT\Chat.txt"
set /p sts=<new.txt
if "%sts%"=="" goto type
for /F "tokens=*" %%A in (New.txt) do (
    set "line=%%A"
	if "!line!" equ "!line:[=!" set line=%TextColor% "!line!"
	if "!line!" neq "!line:[C]=!" call :CodeBlock "!line!"
    if "!line!" neq "!line:[B]=!" set line=%BoldColor% "!line:[B]=!"
    if "!line!" neq "!line:[S]=!" set line=%systemColor% "!line:[S]=!"
	if "!line!" neq "!line:[U]=!" set line=%TextColor% "!line:[U]=!" /u
	if "!line!" neq "!line:[D]=!" set line=08 "!line:[D]=!"
    call :c !line!
)
echo !line! |find /I "-SERVER} Full Chat Cleared">nul
if %errorlevel%==0 cls
copy /Y "\\%him%\CHAT\chat.txt" "C:\users\Public\chat\Localchat.txt" >nul
if not exist C:\users\Public\Chat\Mute cmdwiz playsound tick.wav
set "End=%TIME%"
if defined types set types=&goto type
goto wait


:say1




call :timediff Elapsed Start End
SETLOCAL
SET "var=%Elapsed%"
SET "var2=%var::=%"
SET "timenum=%var2:.=%"
if %timenum% GTR 00020000 echo | set /p=""
set "Start=%TIME%"








:skype
cls
color B0
echo | set /p=""
timeout /t 1 >nul
echo | set /p=""
echo                   #@@@@@@@@@#                              
echo                @@@@@@@@@@@@@@@@@@@@@@@@@@                  
echo               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@             
echo             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@          
echo           #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        
echo           @@@@@@@@@@@@@@@@@@            #@@@@@@@@@@@@      
echo           @@@@@@@@@@@@@@@                  .@@@@@@@@@@     
echo           @@@@@@@@@@@@@        @@@@@@.       @@@@@@@@@@*   
echo           @@@@@@@@@@@@@      @@@@@@@@@@       @@@@@@@@@@   
echo           @@@@@@@@@@@@@      @@@@@@@@@@@#    @@@@@@@@@@@@  
echo            @@@@@@@@@@@@          @@@@@@@@@@@@@@@@@@@@@@@@  
echo            @@@@@@@@@@@@@/               /@@@@@@@@@@@@@@@@@ 
echo            @@@@@@@@@@@@@@@@.                #@@@@@@@@@@@@@ 
echo            @@@@@@@@@@@@@@@@@@@@@@@.           @@@@@@@@@@@@@
echo             @@@@@@@@@@@%  @@@@@@@@@@@@@/       @@@@@@@@@@@@
echo             @@@@@@@@@@      @@@@@@@@@@@@*      @@@@@@@@@@@@
echo              @@@@@@@@@       @@@@@@@@@@@       @@@@@@@@@@@
echo              *@@@@@@@@@        #@@@@@/        @@@@@@@@@@@@
echo                @@@@@@@@@@                   @@@@@@@@@@@@@
echo                 @@@@@@@@@@@@            .@@@@@@@@@@@@@@@@@
echo                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%
echo                      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
echo                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   
echo                               @@@@@@@@@@@@@@@@@@@@@@@     
echo 	          			           @@@@@@@@@@@@@
set /p caller=<\\%him%\Chat\%me%Skype.txt
call :c 0b "INCOMING SKYPE REQUEST FROM: %caller%  " /n
call :c 07 "Call Times out in 15 Seconds" 
echo | set /p=""
echo DO YOU ACCEPT?
choice /c "YN" /D N /T 15
if %errorlevel%==1 goto acceptskype
del /f /q \\%him%\Chat\%me%Skype.txt
color %color%
cls
echo [S]%TIME: =0%-SERVER} Skype Message from %caller% to %me% Denied>> \\%him%\chat\CHAT.txt
echo [S]%TIME: =0%-SERVER} Skype Message from %caller% to %me% Denied>> \\%him%\CHAT\LOG.txt
goto type

:offline
cls
echo it appears that "%him%" is offline. If that is the incorrect
echo computer name then please press C. To close Press X.
echo To Leave a Message for next connect press T
echo To Leave a File For Upload Press F
echo.
echo Attempting to reconnect with low CPU and network usage. . .
echo.
if defined fc echo ======================================
if defined fc echo (%fc%) files to be Uploaded.
if exist LeftMessage.txt echo ======================================
if exist LeftMessage.txt type LeftMessage.txt
:wait67
choice /c "qcxtf" /n /d q /t 20 >nul
title WAITING FOR CONNECTION... STILL NO CONNECTION %random%%random%
if exist "\\%him%\CHAT\*.*" goto topreset
if %errorlevel%==2 goto findserver
if %errorlevel%==3 exit
if %errorlevel%==4 goto talkoff
if $errorlevel%==5 goto fileoff
goto wait67




:update
cls
call :c 0a "Checking for update . . ."
call :c 08 "This Version: %version%"
bitsadmin /transfer myDownloadJob /download /priority High https://raw.githubusercontent.com/ITCMD/chat-batch/master/version "%cd%\versionDownload.txt" >nul
find "%version%" "versionDownload.txt" >nul
if %errorlevel%==0 call :c a0 "You are up to date." & pause & cls & goto type
set /p nv=<"versionDownload.txt"
call :c 0f "An Update is available: %nv%"
call :c 0f "Downloading . . ."
bitsadmin /transfer myDownloadJob /download /priority High https://raw.githubusercontent.com/ITCMD/chat-batch/master/chat.bat "%cd%\chatUPDATE.txt" >nul
call :c 08 "Checking Notification Updates . . ."
bitsadmin /transfer myDownloadJob /download /priority High https://raw.githubusercontent.com/ITCMD/chat-batch/master/Notif.bat "%cd%\Notif\Notif.bat" >nul
call :c 08 "Installing . . ."
echo @echo off >update.bat
(echo title Update Installer . . .
echo color 0a
echo echo Installing Update . . .
echo if not exist chatUPDATE.txt echo ERROR ^&pause ^&exit /b
echo copy /b/v/y "chatUPDATE.txt" "%~nx0" ^>nul
echo start "" "%~nx0" updated
echo timeout /t 2 ^>nul
echo exit)>>update.bat
start "" "update.bat"
exit 


:cleanupdate
cls
call :c a0 "Update Installed."
call :c 08 "Cleaning up . . ."
timeout /t 3 >nul
del /f /q "chatUPDATE.txt"
del /f /q "update.bat"
del /f /q "versionDownload.txt"
if exist "chat-listener.bat" del /f /q "chat-listener.bat"
call :c 08 "Cleanup complete."
echo.
call :c f0 "changelog:"
echo made the mini-chatter more transparent.
echo BUG REPORTING NOW IN OPTIONS MENU.
echo Removed Herobrine.
echo Updated the title bar to include script snippits.
echo Added a Hamachi Guide
pause
goto topreset













:fileoff
cls
echo Drag and drop file to be uploaded
call :c 08 "NOTE: File must still exist in same path on reconnect"
set /p file=">"
if not exist %file% goto offline
if defined fc set /a fc+=1
if not defined fc set fc=1
if not exist FilesOnConnect.txt echo %File%>FilesOnConnect.txt
if exist FilesOnConnect.txt echo %File%>>FilesOnConnect.txt
goto offline



:talkoff
setlocal EnableDelayedExpansion
set /p msg="%me% Message> "
if /i "%msg%"=="-C" goto offline
echo %TIME: =0%-%me%-LMSG} !msg! >> LeftMessage.txt
goto offline



:acceptskype
::live:ldelliott246
del /f /q \\%him%\Chat\%me%Skype.txt
color %color%
cls
echo [S]%TIME: =0%-SERVER} Skype Message from %caller% to %me% Accepted>>\\%him%\chat\CHAT.txt
echo Connecting you to %caller%
set d=N
if exist "C:\Program Files\Skype\Phone\Skype.exe" "C:\Program Files\Skype\Phone\Skype.exe" /callto:%caller% & set d=y
if exist "C:\Program Files (x86)\Skype\Phone\Skype.exe" "C:\Program Files (x86)\Skype\Phone\Skype.exe" /callto:%caller% & set d=y
cls
if not %d%==y call :c 0c "No SKYPE INSTALLATION FOUND." & pause & goto type
goto type

:setskype
echo We do not have your skype name on file.
echo Please Enter your Skype Name or Number.
set /p skype=">"
if /i "%skype%"=="-C" set skype=& cls & goto type
echo set skype=%skype% >>Settings.cmd
:CallSkype
Title CB Chattio by Lucas Elliott   SKYPE     ========== ENTER -C TO CANCEL ============
if "%skype%"=="" goto setskype
:bss
echo What User would you like to skype to?
set /p skyper=">"
if /i "%skyper%"=="-C" cls & goto type
if /i "%skyper%"=="%me%" echo You Cannot Skype yourself & pause & goto Menu
echo %skype%> "\\%him%\Chat\%skyper%Skype.txt"
echo [S]%TIME: =0%-SERVER} Skype Message from %me% to %skyper% >>\\%him%\chat\CHAT.txt
echo [S]%TIME: =0%-SERVER} Skype Message from %me% to %skyper% >> \\%him%\CHAT\LOG.txt
echo Skype Request Sent. On Acceptence %skyper% will dial to %skype%. Waiting for response . . .
timeout /t 20 >nul
if exist "\\%him%\Chat\%skyper%Skype.txt" call :c 0c "Connection Timed Out. Is the %skyper% Online?" & echo [S]%TIME: =0%-SERVER} Missed Skype Message from %me% to %skyper%>>\\%him%\chat\CHAT.txt & pause 
cls
goto type


::[========================================================================================]
::[                                       FUNCTIONS                                        ]
::[========================================================================================]



:getnir
echo -----BEGIN CERTIFICATE----- >temp.txt 
( 
echo TVqQAAMAAAAEAAAA//8AALgAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAA+AAAAA4fug4AtAnNIbgBTM0hVGhpcyBwcm9ncmFtIGNhbm5v 
echo dCBiZSBydW4gaW4gRE9TIG1vZGUuDQ0KJAAAAAAAAAC6Nu/j/leBsP5XgbD+V4Gw 
echo PVjesPxXgbAEdMGw+leBsCR0nbDyV4GwBHSYsPxXgbA9WNyw7VeBsP5XgLDmVoGw 
echo 2ZHzsONXgbDZkf2w/1eBsNmR+bD/V4GwUmljaP5XgbAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAABQRQAATAEDANWmQlcAAAAAAAAAAOAAAwELAQgAAKAAAAAQAAAA8AAA 
echo QJ0BAAAAAQAAoAEAAABAAAAQAAAAAgAABAAAAAAAAAAEAAAAAAAAAACwAQAAEAAA 
echo AAAAAAIAAAAAABAAABAAAAAAEAAAEAAAAAAAABAAAAAAAAAAAAAAAKynAQAIAgAA 
echo AKABAKwHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAFVQWDAAAAAAAPAAAAAQAAAAAAAAAAQAAAAAAAAAAAAA 
echo AAAAAIAAAOBVUFgxAAAAAACgAAAAAAEAAKAAAAAEAAAAAAAAAAAAAAAAAABAAADg 
echo LnJzcmMAAAAAEAAAAKABAAAKAAAApAAAAAAAAAAAAAAAAAAAQAAAwAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMy4wMwBVUFghDQkCCZLBGH1mbpCd 
echo Zn8BAD2dAAAAVgEAJgYAa93f/v9Vi+yLRQyB7AwDAAAtEAEEU1ZXD4TiCEi32V5u 
echo BugAg+gnCKItyAT/t/J2dFhIF4UnAjUUD7fIwegQUFH/ue3c/3UI/xUIEkEAaOxF 
echo DYvwD/gR+/bddjvwK/tKagW4Jx8OUFBoEAb9uzG3aCgEM2QjM8BA6QYAAl5r/xyB 
echo T6tn/zVEYA8Vhm22ZuxQLAzrtS5sz9bOLDlQLX0BUBCbkZu5TBANwABEag+4G8xs 
echo ORB/EHxmg33zTbZfBHUlZoXAO0FP9O1jRzZyQFAQMQB9ZoErP9s32+gDJxkz22Y7 
echo wzIOMFlqP93/9iRobB4ljYX8/f//vjAfCr1Q86V3uf3uiz0AcVP/14P4Bi/eAGgE 
echo NG/dLzcqvf5TUIidvAfoXvYQg7br3vvEDGjwABoS5Mx4jbUftju0DxF5i8YeVAz1 
echo zCRsa3bm9Pw4GI9THFAS4XYz3TfQz3V1mGj8fmxjP/YEIIDrZItdCKdT4Pxm2D3c 
echo izUEc4gRaOpJFjj3MMLWr79WVw0Dc7sXIlmOjUXEahMDB2An3NqhSEuIX1ajIvDj 
echo L9x1JFMgFN9Z3l9eW8nCEEeC2dx/fgwAdTpXaBx9MtwK3+3dw9iSLBBQiUYMkWhE 
echo G3atbJPuDIkGC1gYBAT7/7v2CF/DVnZSAmWLBjPJO8FedBn/dCQQA9qPde1RAAYc 
echo BST/0OsCc9taS+ZvLkD8LQ4iARmkuQhqAgwI+9hGnggXASRqJwArjw+/5BjHAmwg 
echo Iwxgs/b/7/6F9n4kiw0ICzkUwXQHQDvGfPZew8HgA4NChqn92QAYg2QIBAATYFMW 
echo du23E1eL+HQbWG8fVjJ1vmxw3IR2BFmvE4IU60tT755szBPR+BgSbNiF23627P39 
echo Jo1TAovHNxdDUwhATvfv9Cw/CmhgHGJbX12v0oYrOLRve6MM1Xb/rSHrVoN9FHUJ 
echo V4lfBCghLe2/P9amy/aFyX4UobGNUAQ5GqX0W+HbRoM/O/F89GYZdBKLAVfNCP/u 
echo MHAQ6weLDPDr6tJdwvTwX2rfskEIUWjdE0AAWVBwpTeHluhI99gb2yP6rbFGP8No 
echo CE1OdCctwr7kbv9JGUh0BBrrJF37DIsRUN/WcH//UgzrcrZsCxgBP5hmf3hQFF3M 
echo nbXxdSdru793CQwBdAkGAnUhmAZqdr60eXBbjkWERvTrCNuW3c2iMAN1HovOGG5e 
echo SS6Y6dxBLwEXMbI9YRitsOxYI/A5xm6lo/x1L0/kqhM2W8EIxQrgUFe99Kwx0x2s 
echo bSDoFgXZ/VvNstgEglMUOV4EdHlqRI5ILy0mrNqJXajXkNZ0+9OLCKONVahSrFEw 
echo m1VNS1v737AcHFlTiUX8hQVdY33tNvPG9Kso9ItGiwgpFIttt+a+aI1N+FEsH4h1 
echo /KFW54Y5t70MDguPCkljhhvbFmEQCV7Jf9BI37LdI1cz/9N1H9Lb4LZ3vyXF6zHC 
echo dSw5frsnZjm5fLxXfbh2BmPjc7dXhrhRe7sDVcCX9scfXGo5uKQ2AIb5HFY4bmy3 
echo xvhbOXX4AuDPlBPHBqVmESdM2o9tV7g1z/3gUoPVIDkf4fbMbBTFwhE+fv9ZBoFb 
echo j23oFLC5MvwJBTP3jfLk9flmibXgCI22f9/cReCLSAhSjZUUUmiAAEWJfheIUC09 
echo giw3XslvtCFwUmwUx4VcD3zbdhNQwynkAvwPhpdlne1CYXtBDux8ePCrVLbube7s 
echo UquvSVNK5krP7P823u5EBd+LxP52PGm1WGv2WY1zu/3utDVgCWpPjUYKUBYDUOwk 
echo Era1//bkAX1fRgZmiwOJfgK3CP+LZ8tCIRQH9HSlCEJD50q6WDOQIP/7bXvptxv8 
echo g8MUOykPgm8r/0/3X/q/jTOLwWvAWYPAL9I7znYXjY1mEwz8n20BARy9QoPBWTvX 
echo cu/xOYZsxNeZ6IGEtVi773ZhGNxa35DBZo4p4uEXYYO52wt2C0QODq7hbr1MgxRD 
echo O1hyqC3ZMWOzO/BfW3IJiCxw4SAFKhElOYP/CIVm2dl9/AtWCaI7yEE4etPaeNNq 
echo BBVp2ZVeDGfKF5cYynRmaWy9EMNcxA56IVYw34AAD4O1CkQlSzyQrVA4fAxWASBH 
echo NredEnWLKQ0odHtuiR3vZjm1My92b1d+CoVbbLdTRl7+Wfskcg3NBm9ma+8rMBTY 
echo /zYRN+kH3yA77Lf4VzxEmie9WiMZb3Qdy1dnp/udRDTDVz80m/8z29td/cZZOQVy 
echo mVsYLDU0cHiCNV5fNJ98NhO3CkObaOlvfiDdiQX+wQNdhVgOjhEMXO2VJmosJxn1 
echo mQzGKlA0YM5ezYbO1IYE7J4HqdQQJvIMDGwCZoTxCiQosFQ6dCHG41c4tu8nOu+w 
echo bdBoyAY3M9i/bTRhkl8sOWReD5XAwwLdA3NsT2YEAwzVliR+NlFUCdVolNoqezr3 
echo je50OWigEDHYPlBs3bexCHQDxivqSxpSDEe75d4Tg2X8gVD8UYD91WKxDogMo1OA 
echo l6P56FejCAI0wvLj3z4eO3Q793ReaAgCQPb9oYDQzVe99P09WNhaizcSmwNWV1/J 
echo gGmb+AdCFlEbb4WuV8MczxD33xuBRzXs0WgM5at9y/afiNZMyYkIiUgEAggMLMuy 
echo LBAUGBwgLRnhsigsw24KcPTusufpCyGtOT50BeRGOQm3wGjcHzvHjsU5hMqABOjJ 
echo 7cXT9fg29AsIISDNIM0IHAw4IM0gzRBQFGwgzSDNGIAcmNbKIM0gtCSZBp5wBu4o 
echo R+LxEMYLW2X7DxnpYHQdUYlN9AL4uNDGhfyc8FG7LANF8DKD22FSKOsD0ZkzJNrS 
echo x08FCSwbQXBYYkKsnqVm0YQWobSmK6jC4wjBKqIIjKQKExpsVyi8vNghWBCxe5W2 
echo D7U/Wl90Ho2hHFafmjl2Eg0tVQ7DVgwZXfZmtDm2GBtM2AtyACUjHCPW2+gN4Bfa 
echo iay0VWQA1lmZwEU+9XcU/ta+0CHpAP5D7XNnxy5+CUZOp3NPLTT/9bLz5CmkpV77 
echo 9vZAXFlZdRNCNdCwhfZ0FlBMFBsiI05gSz10EYwiNBwiQI5kQDRALrADuUxkI3Dp 
echo zFBAjBVQiumEp50TDjwaDIQMlYKBBdrg2fjcNeJUagwQ4w/VpDdqx7HQORh6g8j/ 
echo UJtog8WkNCPo9HSGs47a54sdofg6diaDVy5aafpzwd/Dt5sXdh8g9I13MMc23Dr4 
echo 240jDkOUTDsecueDy//rzt1uN6fza6kD9yoMpQA/rJTxfykuWYvDW+uJkjhsyVHG 
echo jxAVDfaEx00ADLf+UWHAunjA7fwb8Qw6CblbWnUbQJkO4xNazx6w8CANFR8+JunQ 
echo fJcQU0Im8kq6DLHPTNLwIAw55PAIdAFZOs0gDy3w7Ei3ahVKdRgI/FaLDIVYm9iD 
echo ipIilzBhklBYy8gkZK4dMvBUb1AzBtv2dWJT8qiEVMRAC810W1cy0AkSPg7AYLZL 
echo NLzGUFYdPA+Js3Xc2B1Ej3QViUl8EotTagIoFRYOmgFQW35N26EvHFEfjY/M9z0U 
echo gXZr0cH5g/a7UQR3Fzyti/L5VmiEIgwRqAUYTyW+phmdVrG+CKhQ22B8ulNzEXYl 
echo eigpWXrnY8JzDZ3iaskDkr2/Nw9okFEZwQ7Ytm3DdlDtAwIBG5w554CAcNgsGAJf 
echo LyCDQLaC/GvDGjtzWYzuIMabkZpTcyh+FIB83U5wKvFcdA0yitKPR6zQdp9DYB9s 
echo KdYQCNgxK/jDAt/f9PhZP/h/IYv3K98fjbpHDWaMy15gEVDEO11qRjuBfuN5xTcR 
echo e91g6/ZW70BE81l83HyF9wONc/8T5TsixgQ+UvsGbofHXt8wO9Z8Rm+At0s7+kwk 
echo EAEDO9GJD68MDFG17uVIwIX2B34baxAVkw4r1UFWLkNTfoDmYhdCB1tBTBn/N2Fc 
echo 3QHDigj22RvJI8HD/Xo6aIaiGlv4Kf135FrOVxKri/uKD4D5CnQJeOHtvwQNdASE 
echo yXVOOxR9P4ulK/C5toVKfdc78VYFA6RQdhhmmhH7eQgRxmLhfcaENQfKVWr/YYN3 
echo 1FjwA8eAPyoGGw1eObpH65zcuvGYJFyJx/R+5cfbl2ja0ryMiOnGQBUBBhYty9Ys 
echo FxgCGRobmECDS40caG8gW7i18CNawYKA+sMFBLDUv3AvdVJBAUGKEYTScMMcjR3b 
echo WQRWJWpcB44mgqalGwgEiAZMxvDGToINwSSwdRRtFclOrSGMXTy3E9jt+JEcgz30 
echo YkHXvvAGdRGrdO5bOgUIlL4hEVtv3bqgwxmw1YN4XA+UwZTgNmubEA4EBpRQToon 
echo eAgBLQCEggkKc44JPNssdmD46LILuFAvc4Ul6rQjE/KPyYeBWSPUJF26R8waWPGp 
echo EBScnXAz0z+Df0jbZ/1ORG61uOITX1lWwLePGDtOLGqDD3Q4/WZn64tNDPW4IHdN 
echo zB3pa9aKEg9lBOB11BniFc0KZVe6y5m+Hj7WFECmn+lILcTENMZqCDMsh/t61moK 
echo mdYcc6GO74vV4YFMLE0zF/6lRn9EK8ErTeyNRI6ZK+23cPTCi1X8NVwrxit18BMv 
echo +G+dEADR/9H4RlZBURx6HclsPVx0aNBNyh6DQXN2uhdovBNDMNdAWMO1rxkt/mK8 
echo iNQIxkQ1d6v9MHwNgkWxOUw9OPtvsHGLRF2KFiwwPAl3C0E7E7/7sbd87EVM6wsP 
echo vskTBHQLQEKKzeKupgpE7wnDahDt8TfePDBkw4A4MEeAeAF4dQvsWOO31wJzFfHR 
echo e4JZkEq0HvE0Uz9pZNOxrd6o20ZGjgEfHEeva4nSWPAJIbusEJLahOPWIob1joor 
echo fbrQGpcnfeznCkNNGFuB9n99wYXbigwHiE3f5dfM5NqDxWjUZfXGihOM/dbftO4g 
echo lHIFiAwY6wSIGCAPtsGIfcvcKOBo3BRQa/8DLYSy1BWMFFDP8CTtDSjQwSdDSDlk 
echo CvwtSoQWFHVmjUcD5obE/9958HMTi9Yr0FKNDDhqIFFLV4ru5mRdNwBhAByJov1H 
echo AyWtV/ZFHAHDCl2blScOChACF5mGZi5PEC/kXNAWhgwL/2/Zg0UB3n0PghbmeBbx 
echo QYtsB/Aix0B0iEDBB0B0ee3EkntcCv490SISaBGjfYO8+gbDwkB8W0MochgcEDwU 
echo +/DgTXmGQnR1AmPQRmjiUCL/jzmJ9q03fh5+Oh8ePCCTRusniEku3Nb4ikQeAQAI 
echo /VX6b1gY48ZF/lVknvgViAQ5R8m2vYNGM/R8yoVsDcT4CLeLjksIu4k46lTYXkzr 
echo KGs54EALJ6uFRqgQer7TkFjYPFdWn1cTzWyTNck8GdBWFigAkaDUVksHk4pFy2/e 
echo 5JIOo81sFvwR6KB8cyTbRwRqBlgU7Acj2V5I8AJAJ/TJ5siaAvwUBAQjNEfSDAUM 
echo CBTwAcqRCfIZTixw1cAZ4CLhS7/BRs0t8UYD8IA+YVuFRnzNgH5VEkXWdy0G5EeB 
echo Af/GzKW+VhuhW0IUxm5lp350BS1m8Gp8KNLb6MKIqBxf1RIvq6MgBDnrBpmJsoEZ 
echo 6/CEOFoQmyy+9AQLxk731iPGgzwaD0MzkKMDdGwdLdha1TUKWC6EW+INhcCj8mOA 
echo ff+BEQVtjY+bQAtGRg04POmjaeJvCf4r+bj+D4T4+Cq1SY9+fhJXA8shiknAkmM7 
echo yTYNM2EHho0WrQcY4XcKCwFe6npMPIlTAokykdA2ZsCA6/iq1mitLW3/A7qFIGRt 
echo Q7v0O4A8oHUHJFgbi8aotdtKqYI3gHQmExtHHvhfGDxwFIOpAStbbmujI/SDcfQE 
echo pGttbPC3HCsxLBQSBVq7BiZqb/6uX+jArN07M4XJfBFJT/0Fbhx8CuaNUQFIiROq 
echo DJZtU+5IO/Dey35TMhwau213BXULR4sD4BCbECDCuqUucE5Ac858LgMXL1g82FoD 
echo BVY7irLVfWw1F41O/2EQ/QisiVuBajUGSUF5nuntLUIfLHQBR+WJO0BaVuwwNPM6 
echo ag2d6KZzo9ZkEscPhK3b5hY5VRzkEDveEZqlpRY0OdktVnDI1BjJBFbqWyBQA+05 
echo FcjXC2C4ncTZWRREMRAlaBxLEazoz1c1pXQKjxWrOtFdWFkDbN66GTWvtGx0MARo 
echo IEE76UBXvscxGXEGfR51SF/nmmuYo3TWMqPANocVmdbHdHzSy63Vet90bVAXzldX 
echo V6zlaiVaWc6BBmOtVymhkxmBBhdA4w2lVi65wAZWoV5ffVaYH3hsJAgi7XRKsOIn 
echo tfVVuI1YAVMCnhVLMZYqBlNVuUmRjHn8uBLat1nRmPfeG/YDCeHCx2nGau0sqyxe 
echo YjPbwmPULObUHkgPzJi5BaXcCRZYwuDgxv9oCEUUsAcMOTSyFIEOgUMnbQgQ7dSP 
echo Bl3tQBRCBoyYEa8Yp93apG5kahwABXYQvk00IlsHDJzWBkY0ohGXgnnFGtGIWJeM 
echo /88gWJjPi14EjVQDAYP6/xK37VPARhQzVhB+EExQgELs/zdGsych3IUfdhIatVYc 
echo KINr5ZJtWSIMDDNc1AAtWCNrlwNcyU14lmURtBB3t1KVNWiGiw/RiRyBDG0Fuv8K 
echo dhQ4/3Gmuv2BH3cc6xlqi88Uv6ShFqpqDApOeeTpZiBDCEgi6/j3Q7/Avw87QRx9 
echo CotRAQSCA0EQPkG2hrqcV+VHvgwlJv9crZ4BjUcE2lLEghT4H/en1iLQWRqbGFu4 
echo 3WIA+Ep8JBV0M0m1BQR42tbWP4K9rjkPGWVHiwdHHd5fFIl3CKFlS/jthabmBWEI 
echo 6w9zO8N0CVDDZx3Nmr11VI08GHbuUZE3WNeLxiEc4FATCiw6uhaFCH+NiX4IXyW8 
echo jLXwJUqe2IP7/xs82ddmNQpTHP1HPVAmi3Eh6TZTRUlTjdQk5UpvX3Bb6ACMjVdX 
echo VCGkeAwcN2W7Q2bKgcbMVpiUA07uPy7ct0k1UW2rIY2GSCljVhuF72lQAau9I8dd 
echo Fw+VwX3H6xuNjtEhVeogY/CJ6YRYwf+ga2VDj2duQ3xXjb6I3p50KnBW7yecBDjo 
echo KUQoAT2SdoTWglkErIgUTgyndlCAj6tdW1TsdluAXtIOz4P5wgpR48AAXOiDpcOh 
echo NLvBdgThM9J+fnI80XSifX9/fEI70Hz19QMFECD5t2P0/90oWqMs9+IPkMH32QvI 
echo ehxr4iMAdsHhA1HNo0dhTY/E+8HmA0k1D5jQro4FHGMHV37dKMEBn4PqDAY1VrSP 
echo C1+JXAaikovsDaBtj1SvfIkUCJnIGAvbHAgq4poOLcU+zBaZWU+8BtpiXDDQugRA 
echo vrU916ASDrUWgSeTH0h0aEQjxyRoUCO9GeR6EQTQO8CI1oY0EA/MKsGvRkyfaDwh 
echo rvpeWi8zSGhMHlSYBgFevUS5D4zBH3EiYydVrVALEGTsEo24NXQMEBxgZJBlJBQU 
echo LBdvrtQosQ8M99tTB2xHxjoSRB4gPGYwJK16I4MkNCxzZ9Hv+/hSaFwezBGFfDYj 
echo 8DWZKiUY6ZXvtQbgGqYYMBNM5ip9kQgIXxhu+NvSG3kYA75RrVZU+bkgJwTR+N9u 
echo 0AmCahsPOJ1hF6f4Do3jqL4HMXcsi3K0IqmPIEc4slIw4h915EKSQtbR4sfHBwEb 
echo xBkVZ7ybCyYJ6Pxw0AbV4dlrfw4UaGzIPkFHj2I5XSC3EH74/rEk6E7rDyD90xlm 
echo TxQoEEldGA0uBjcYJC9TDwoc1CRcdswiSCBfChSqJAsnqFfwoNmIjGF8ExwRLNgF 
echo wgl8aKJIFjKCq9xX2Ka1LJiQ5wzsCFcw2yBZtOxznCYjh3C6uQFoJplHFrjpxoXo 
echo nHwBMOx9vnQ7OqWlZqVQui4ie0v60imCoxdKj078fjazylBh6b80K/6KBoQaJdAI 
echo GLmoOIJ5t7ftDXIt6wUeiAdDRjs1fNUi2bdTq8FWxoQdb8ILDBE2atqvxiCEO2iA 
echo fkQYd1HkJ2BwBAIB67Zz0UlTvP38/TejRAa7GZ71NUhOQCeu2ovKC7tFA7B17utW 
echo zRBAUA8DQnBqcLLrJKPtXot9M4s5zUozJi2OvSmYcVeNt8QAch4TmUsu2QqkhGhW 
echo K0JSEExYVwQ6N77jbgi8WxeUGkiIxpgMkYKzBRiAwrawLNR6m42Qqpw7hTagoV0H 
echo jsYriRb+DY7V86tmq2p8qmX0xvjbCS1HfMx4g8BIUGa6PrutWpxygBJfdAs8smzm 
echo LcuLRUwFQATKsizLRAgAGATCxbIdTAUUSOzRzwZx9aw4g8VwG8LBISpMOaS4UDJb 
echo uRW9uEhkePElXBe4tIuor4XbfD6ki6UyUx1X3zacxd3lEEyNc9OL/kSN+39vG4g5 
echo iVl9A4/7a/9MAz5qExUwzIJbRPOlOXZwrDrHqGwHovSRAE10vE83N0CwU62I41gJ 
echo 2ObGFN8avqTKuwhnl4JA+hYNmPiXcI4kQ4O9hTxSsW5zIQWUGY0L6BKwOYJ7UHQy 
echo c6+BeO0B+40hG1HW1jo7UB5qHgKJXhkZ2cr7Bezw9DnyHBn4APwE/PvIyMjzCPwM 
echo EBTPyMjIGCAkHF1u47W2xALAo5uOKBE9NxcLFVnlEZT40K99O0PAu+T7GVAWjiC7 
echo 2R+xpGr+FRMI/NhMhdg5d4uu2vRBoQsxgfZADE1R7dRLTw+OgnQZwd+NuHB8EkR9 
echo DR0wA3Ul3koLNvSzGfSL89MXysYdeohdyHnJQSxQdXnaBK59yK/wLPzx80RNH8eC 
echo oHUdi/hul8CZqARZq3j/o4uI2Y2taMAvxAF+FRaC5j2BSkzJt+Vb2HR8gd7slX77 
echo GCCJuEABYsMxCIP/Wm2X8UlIFmrX5FTB+AIZBEvjvWSjR05Haf8fT9gmPHC5+Xy1 
echo JHHwTkIbacg8dQrrhRUdhA64bsTAeCBqqyVoTdgr+xRb4L5pR8ssLIO44FAMiw3C 
echo 0N2IuAiD4QHzJ8CDaOB1B0aY2BodQt2cVABopCNGoIId5Hr/6ogqE0K4TFzQKwos 
echo CyVkAyPE/wZXcwD/RgZmtNVdAQ78HvQCdxiYHmisCi/8gRFkmnp7IH5DdI1LFLNb 
echo sWOhgL1CNXQWLu9kLUdLA4F0IEfeuz1hEQ5HO0J8vbv69DY4t23r9rCL69jUbivk 
echo y7ClO8p8Qxy+hfatyUM899gNxGgQILe3BXpAGXwUOVcgFWCJsxfexlVwSsLXxnCN 
echo T5XYiLABob45dpWz0cJ9iktIg/QGbEx3CVsQNWQiBxQRZJJmsOXExeSw6+M9i45O 
echo Y8nf6Jz/05Ub2uwgpEZGPItVaAPCbZ9max2n8HZ2QJFgOZaluv5sA57EZNeuGco9 
echo Fme9Nq6x7WZY4jtHIKtCN/heUgBw2OpiHxxf+HQdgDH+CyoOO0EMfQlpwFoBNR8C 
echo YCldVseFBOmam82ICfgUJEH8EwVkObIcAP4kBP4GRpqRZgg0DAcQZqQZaUQUCBhp 
echo RpqRVBwJIGSRZqQZJAoodBlpRposCzCENJqRZqQMOJg8DaQZaUZAqEQORpqRZki4 
echo TA9QZqQZachUEFhpRpqR3FwRYOyRZqQZZBJo/Ob7RppsE3CVJRN0aUaakRR4IHwV 
echo kWakGYAwhBYZaUaaiECMF5CakWakUJQYmGSkGWlGnBmgdEaakWakGqiErGakGWkb 
echo sJS0aUaakRy4qLwdkWakGcC4xB4ZaUaayMjMH9A0Y2+k2NTlE9jsSDPSjNwh4Px5 
echo NiPN5CLoDCbsNGNvpCPwlRP0JEgz0oz4MPwlI8uxrxBAEwT/Jggz0ow0UAwnEDQj 
echo zUhgFCgYdEgz0owcKSCMjDQjzSQqKKAsIUwz0iswuLrSjDSbKzQsONAjzUg3PBMt 
echo QOhE5tmMNC5IACdMaEaakS9QGFQwI833zYMJJ99cMWBmpHk2SCdkMmjzjDTPXCds 
echo M3AnGTsjzXQ0eBN8cuzvpzVFgKQQRYQ2DYi8R44cOYw3kNSUOJjsyOeRI5w5oAQo 
echo pDocOXLkqBSsO7AotDyRI0eOuDi8PcBMOXLkyMQ+yFzMP9BwI0eOHNRA2IDcQeBy 
echo 5MiRlORC6KTsQ2GOHDnwuPRE+MyrcPAqHrodDXECJtHZQr3qJS69CINYQXzjTkPw 
echo ihvY6/nLsqjEJeA5fZSL8aAS2wYWnioQO98HIpML3NUtNvgjIzA8QfSHFZdamIEG 
echo xKQTf6vm9vUDJMwCVpLKi/LB6QJEgf/bg+YC4Q/2wgFXWg+VwtGN3v3fPUKD+QkP 
echo t9JmiVAMAwJzCYvXFN1buOCniblAH2j33hvArbMoQA42DAPSCdt27bWGLDMDr9EJ 
echo CA2Br2J3eBCB/B2ZNMZXzJZ6/ih18TKFwtmgmW2JO4dEE1ZXrrbSFkYHZARHVM7A 
echo 7W0EBGcGCCvPEx1Rvt8MIAUOAQsQAUezl+3bEgEDFPDrme7XB3dw47lh72Vd5gH3 
echo XTLXArbfKIvI0emoARNYFW+zLJsrnekEwEc3l+RJRwQpGs/Bib+3ZrpP7Uch2INn 
echo ENIx3CVH8mx3z09uMiVDcs8HkZ4Fsx2NVse2tjIwkOfCWhMyGbZCa/UNx1xYv9/s 
echo 0t1bagRbXgI7y13RNHerzyC+g/pddwQVvTk4chSVFLoAQi6JVwi1zQX5FI00afnC 
echo FwiFE56hXw54jXUiq95W5hRgxw0H1xmEYVCEGL+y9kB+A3dyahR0WQ+5kIZNdMa/ 
echo 6/4E8zG3nZNdqAS1uHcEEHYcGkykcg56AQxBCqWhReD+QA93fzPFcEUgB4DrGSv3 
echo ZxNOdMLteLoJEVcHg+wdggxEM7WOLRWeH9Cj52AcbjcQA9ymIFW//vjJ8SoOhAcY 
echo OeQbAgQU+/sW5JAB+flFQQ75ygcZ8fEc0rkSgNpHyclCbsiA6QhpUBNtfj34EEFI 
echo Oanw+KOvHtARu7t0GlNo9gGBjlZW/9cPQcYMZXYqHvtOlmeQDPv4EPmXZ5BBEPn8 
echo FHRkkO7FHmhuIskUtKToGcn0SydoeAeUdEZotKlXTIhSNBAJKD9Bo5pbslY0rhtV 
echo A1Nf7fjzchymHtCZD9IolAGRoAmTV6qBZoGb6hdkVTkaAfhWdCyRaJlDX6rTc8AX 
echo dBVouGEnVFkoXrRlXrIZahTq7gy49MBwICwb+qIRiAY3+iuCu9PFvWvI7gWsY2Nd 
echo 6zbMExsPZQEQHcQ9NaEw7pOIYgtcG2bkjOfbEJmFkWhWbaG+LMvWXWgCXGBkdIid 
echo oCdQ3TAxIqlbqAL13CQYFiJXckhheGjMOWCgEcRmUxsVJ8kmxayESWJY3Fdb2xPl 
echo vlMhTPrcKIJugNm/pF1FWGtnpcfMjU10p/M5pBOjtqdgnIJ0sHBdhU8WXNjMwPt0 
echo MyHQFXXtbFBXBNNspdXuc83SNRhwbBUS+ArLd6oJcYBTcDoLhs0RzU60gUJYVnDn 
echo JmMwNh5ZBcRtAw4Kcph0JWNGDsjtsDmjeSd8EmpAbtUs2GO0K5hdOIUv4q2EPKur 
echo n6tPL50lzpb7PrArnZT7HGZMCFeU8CXFE4oXUEBFOA3SzS4MsFAfxnCm4PtZwwpL 
echo wTvzdX17+EQS/rCnDOs+aOxLaQq2HbB0aR908ci2sAVaXeZW5D9tWcYWvkhMq4LF 
echo sOeaSPSSAJ+1RhaCBkJoaLlt5Zq0SWgMnvd4qnPpcKF7nIABQ7gG6G0DpnAOf6Bh 
echo 26CCfFdg2bB09ICTSmr9ro2oESyLzbUXnNH3yv9g1Kh1I4TpUbWiRHWFzgWzmSKz 
echo JHSQAK1ZH4Va5IySAfEb4Z7+JFCSfWwDahidbWsTYmoClyCXLNv2trkGMJRIJQz+ 
echo zwUEAz1FbG/ZtihFjAU0IH5upO/gKoKSIQCwES0PLkBEGpALpbgtrnAuTI0jqVPd 
echo tu1sNUhhSCBUXVgECoZI97d988DDlY0CpdgnOHS6v/+/+28JPH4wi87B4QKeAY1U 
echo DUCLAnVei0QNODtuJeACGX0DbAf0ftxbI2j0bGUCfNNs7NxS5nJvaUgYczNmIC6g 
echo W8Ooc2uuB6VkqWljBgOtRPlu65oLA3WUi0zkFFixRPwFg/AB65ahkoRAKVa0oYHa 
echo 1EkW2GMMKjRQDlZgWDFYV1Z7+lScLp486nXEI7ijBocDC2ggKkb4wi45CigUBrgI 
echo I0eymd0WMAQ4RzJyJAU8AzJyJCNIBlByJCNHCVQCkTVHNly1BWgUDOAZwQfSFgJ0 
echo cMIkELSs8kEbfYsCieLBA0UMwhBbCH7wA00Qukc7wjLCHTV3t2p9DDvKC8qFyclW 
echo qo2uKALAEBAIRE9OIjOYgQj+AI4hJyP5+OlSlKIUmqYbp4J744087yuL1xe0jAm1 
echo Y9EJWaJ3GUIFwmOFIvo9jVwz+opgUYnZz0u6ZzNmMGhw81DBdgfaDIHPhvQ+oSLk 
echo QgaQdAJ8ALmQAQGE8kIuZAiICYPIlRzYKx+QIBzIlRyUDZyVHMiVCaDNhRzIG6QG 
echo LfNXMtjrZRyoLutIgL0j/KzAZlAIRnUhitosjxVM+DE8CHcV5riDwG/hazeACbrr 
echo FSkUACFMgRt7Zg++WmYXrmZUvg3YAg2LMxrlAp6TIHpmkygFLSzsO4u6dQRS7Cv1 
echo AE6qBbikDPRyAIkcwJ8IFGnb6BF3IxFbVKBGKn2VLaqZGEYOj1r+201XdeiLDY0E 
echo HztFGHYHGLZoUTfX6wzK84uhaKINowPfRUWtW8pQWWX4hux+LcoUmZw5uo7MBv90 
echo NzlNIHQXUajkMaEjBOVN5P+k6xaW2YR7nTEUGBU4FiCtsF2oAZ3rCzbgPFkO7l7U 
echo FAEJeg+CcxgJvSERhkVjYo4m9FvrCahpfogGAvYVE2Ff9AAVug5qIPAUdz2jEyAo 
echo LznedAdoCBj91Kwq6WjAKjWaUesXK2r+XusC+w+oP6AGDgM9w42Cy/YbZddiiTCJ 
echo cAQCCAyh2rIsEBQYHP+HXLI9HfEKpMSJEBnZzLJYBUhMVbWNKpQnwlkqt4GOpx4E 
echo MzW0pW23ELyp1AMSdBAHG7VZngQIBXURHdbB07VyL3gMBFdVtXJJB4ysQ/Csyp5x 
echo 7Dg8Ut2gX5hrdWJy1CrH8GaJfqVqCaTNicxT86vm6IJmErvwQwViod7FyOHMhVBA 
echo z9gBYPbZbMxWUwBtq+iC3CdYFCQYkej9CF+JgWI+nW2uqfYYU1d4LwE3ZOyuCdSy 
echo AvjoQstArItY1qu+Ibiw8SKTrwk49YSX3NYgHgnSyFroFcFCUSrhwTGalm1rhsQr 
echo BfBoFBAWHew3nhrGBDAAVH0NTN8c8MaD6QSBwk9860M8Iuo3NkzIWAGA7Osyhdui 
echo Ra1WX0XQ/dXbBm13iQgXfZY4gfvuvhXgZZok6IoMOVOIDDC7awXudn0BQ/RpfUGA 
echo PF8Aji1cHSlui7bSCzRRyMcMA8vrfTFL7N6Zq1gIIZ5Ax+sHu4axm+p9CIsFblt+ 
echo Fi0wsE/bgLwp8NkHSCFj1JPqLdtQCd18C462oIB82PYFPt9tm6EGBw5+eA0JikYB 
echo isj97f/2itGA6o/6GXcDgMEggPlu0kZGxgMNxsp2bS/MCkOJO0OySMAmiu1bYXg1 
echo PQKIRWQFAxCgzzv8ZY1FZGYABCWfK1SjPz69ZLB2O3F1YAMiaCC/l/+Xp3R1BQnr 
echo 3TwldBw8JHQYgOmb6r5sHvkCBCA8vk6NiANeKBrA670RtFCL1gCw1Qy8a0cVm3K/ 
echo kH1ZD4ctIO2sVu52o2DLUEQ4qgeJCLkBOW4VaOS0AT2sB9CE45QkfmWxyhNwq9eF 
echo IOEhu2dJAAIUTbMQToXVzNRUydY7FepuBpjavniOvxYr/rgBtWrYBT01D4Ot85V2 
echo ySjrRpAlgOw58mawewxnaP8AKP3R2R7yKf1qCg0o2Rt72giLgPNAGKwWe0q2jmDe 
echo 9n1B8hxyZC8o/Qj4lYtRQ2s4+Q0zO8pKPiH7/IA39VyDGOu1UFdXvOyZTlkwwBf/ 
echo O/ew51LyAxEogTw5hJwEKyj+Kf5HjuSQKP4QKP4jUzIkPSsoHpLnkP4EEFW+gGEu 
echo 8nCC/wV/EnQ0Mv+w2nCt5JHdYNvRAmu/AmFIJmT/GHTtDRk5YwNp9/flog7bX2hM 
echo LArhWQHvdU5sUiqQyTZhvAt1WYhIedeSTTY104pILmoGjlYt5CCl8zMLbFskeBuy 
echo OqQcYFui8B7Ugvl8jo5RqhPxb/GfKMBtVwNoOQJ0LtCCI3lAcYbLAbnVoTHnSyV4 
echo uL22zZXKiMxlQ0gCPFmWZVlARFxQVHQBWmFYWxVkeCBX9ZUdSDhmd2LKqF0uQTCw 
echo BDtPiy2wncElRgW/L7IzhiTZDkIxOVcLxEYP7CUbdhuZcw3SIrZ6yFMD3npQrN/J 
echo dpEHPFVqAyT0F5KHViy6KMJAR5tQs2MMbNAVQ/gddU14SIHBhCmGZW7LGh63GIYk 
echo YQ4YyaYAT46O5OksdgkfMFCaikOi5mANZFLRAMQLND7tI7CnYkMx+RZ1KgybWySt 
echo NVBoKSGKDARsI/cCVUOLwzhBFDe2AGZwfwxBJvkW1egAzsa43miiE4K2U7G+mqXo 
echo P3d+IYveU5MQCjh2oEdHgcOHIHzh0N9FvPWdi8fr94OIANAeFygeq7hMGyoeCrdE 
echo SzzxtbCsymwv0pYAHybFZzgITOB1TQY7siNVAPwQoAtXhhSd6gf4WQHwvmObQIO+ 
echo Yom+cF9pIsDsRLUqfe49RvFp4/H/tnw7C5ui0ElNRqHB4CxEqtpPagaP99hZG9m4 
echo CDfmzZUgV6KkegouA4HGosZgIwHsXhcv086RDgxBqN6NjRXuBikOtwirdBHF0AI2 
echo xYIl//JywUZd4rJdELe4QOlC4KiL8FB7KllrsYjqQfhrRjHZ3VlsB7QCaAjBrAPg 
echo 0g0p9FFbV2exofYWE3VIOTspdkDWuYpSY0MCGDoj2GawnRAFUyxkFH2uoAnz/OO4 
echo Ba+Ng4EtYllyxmAWMKE4z+ZmQ57CDKyqpyOa+VF2CIX2VzdTpSLbp9YCJ9GyXWg4 
echo OVd2M6YICHC2y5h8Sg+JCNb9/Vvb/HLi6w1p9g2LRD7T+JlT8XBurpyU36hIUYvw 
echo ySgY4RqaV/i9XyxVb/EKfHlWI14yj8NeoEUKFkMDUAxpVoCWAgYwHCkLLfGbEgeA 
echo ewoghVhoQEuw0EK2GO75pCtPcmD/yIP5B3wsA9hHCIPDBkvFy7pTEApERwzPXm4V 
echo BDBrsmhIYRKgPfHp5hwUnbWzdOhQlrz+DPSgEJ1Eey0+nWFTUSFuS3+2KvgzNjMF 
echo GiAt+IhC8FWktNB6PCB3EFTk+GpTiho3CszHFFBQ0gZm52RFTCCcXLHLl222GhQc 
echo UBR8JBgYgqWANCQMIGcuU5tesPiVSrgYcKsdpjRiE4vlIRQATdGRX3soBBwEjthz 
echo c12S+4O7PBW93Mes4ljHGyQExzOaDMMMMaSgFC8CgKEdfyyx2CtNQgzKQTe5THJz 
echo vQ3f/Rjg/iwW+SccjX3hahBbWHWZw3wkkAQjqTFmnKLLk+iHROekGOgQIPEVG+B2 
echo Xov51N3GTbln9TkAbIdEvveDkRtVx8cscviaFWBZlTuraY8oXnKKN9HCWV0DCVtz 
echo E1cKxCQ/ZPD+CBO+w9HFEP4u2HGNUAPB4q5FbbeK0VIIBFIL4dnWXpkOFVA7UFGq 
echo r0OA4Yj6k5i/jAf18WhsKw1hBWoZWBQVoN3rCQ9PNWtcdgWolJ833xM4B7K3wVby 
echo 6xZUMzFBNkbqERRXiKyPQy7sU2hcIQ7MfCEWL+zcaGQeIVe0AKqWTDTeRTiCbatf 
echo 1Uh59+uwIjgxqqzxNropwzB8N5057BImvgdqFhHwaJBRR3KyLRcXoBByciQnqAu0 
echo ciQnRwLAByQnR3LIGtCiFnJyIdj+yFpdVut4ahQI62No7P9I/kgY605o/B/rOWgQ 
echo LD4hPyQm6yRoIHTraDQKuNXCJegFXyuOrOWJYj1AmWteWHFMLMUAQFgW80ieKYBk 
echo gADBDirJbPNZJVXgiQ25WQVqw3xn6USwVQx9E7fZ3XiBRhkEweau91BHzpUxBr+B 
echo A2pDgcfkIPMA5ghCl7U67s+udRLAC9B4Bv+HUCXIIAdkPy1UnfUkGDqgCMN46Qsc 
echo yeQ+xjw0WWogWNayLP9tRAJUjUUkUIl1PEhAy7Isy0xYUCQoLCzLsiwwNDhoXLHp 
echo 37JgZHKlgD8v60cBXlqiHKPm6/uNXSSpMhXsDNLlyOKbW3T7ODv+CesA7v4H0vew 
echo cicAQNAIjie36tU+x9D3fBPEjyoUV1Zq6hlVglf6HfDkkGqwzTkAdSY0JD8UjUV8 
echo 02G37ReO1Am4VxA5TXRODQzZUcHUVnV9ZgnXohjejM0URmC62dBQj058SsIe5agE 
echo j1ALGPXcH1IWDeXCZHkkdAwkUySNVmQ7FXcHPB/yBQ2jcRpAcwlaLdbijslRykEf 
echo UNhsaPkO8lY9EaCJneBoFEmqJ8cXzP3I/WBTdCLDaIzkC2EzqCViSOqRB9deoMPc 
echo aJQaFASDAmicQOl8yxEm8GnuhR/9i8aNiO2AOeISBQEJ91b8CORQaHDfQP5RaC8H 
echo AsQee4kdZGE/zU05CrrSMzvqhBfbDAGvhxsStYB/diZORsQ2JPLZwfzMJkcAfcD8 
echo 73sWwDN/EWZHA5OGYs2Em5aGmSyHPUcApg/4BSAKOYokrVQ/iv0i6wUbMUXs2ztY 
echo 2ZD0EFb/tZzAhNhHlifLRYR0GWgYvDUayObI/YhheAD3IBxTiHAvAUuUKBkCNMHn 
echo DNkN1EDm/nx17FdZ5KgFuzM+tMXHC5RibD/OKR7hLNDv9EBRxIe5SSOxoq56rTRX 
echo gvBWA8SKHgYBmC6KwwMb9AS0CenDj9+l+25Z0BBBPBl27wdhdw0YZjJ4UewtIAAc 
echo ZTy+sAqcWaWa7wq4oCRH8mca02j4oUieHNl0TREELcmQnGSiEC2jJCdHMnASHMmR 
echo THKkKKVkJ0cylA2gFydHcnIbkCA0IzkZki0oPDk5kpMmQCVIOZKTIydQJJKTIzlY 
echo I1yTIzk5LWQu7CRDwogqIrtsLRo5kkmGvHS9m+RIJny+hIM5spMjW4wXXJKTIzuU 
echo L12ckCM5OSGkIkhOhmQqCbBOjuTsahe8a8CO5ORIbcxs8uRITthv9CIpoSdDA+At 
echo FZH8kZVtFBPrWGj06oVt8BTrQ+QuVriQc2QFOmRZ/heRlqUW8kFoEAYsK/lvjbY2 
echo AocEA3UKgPtGdA7sxypVWWUZTusLRi5VAEp1gllJZuRkDMp1lVCkS+IZHLT8UrD8 
echo nv1j3dUzyQWKBDmPQkGD+QF87mqs6xn/g/ipMAuC+zag19MztIUHqFAscC6E7zrs 
echo 8Iy9ZvfMXet5Zlz+vyRMAreza71xWP7/WLQQ7BB4Ph88difAE9t8BpvyfS/ZZEOC 
echo 7hIcNwpu1tpDOFFLPhyC2VaurgYRccSjGoRpalnoDIKTfwwF6ZDYUeWM1ZQVn/x1 
echo oEIOHBbMN4FWErJKDllVRoh6VPIlXlXkHC5SFh0cAcyFPlJAQKg48uTI9hw4dFBX 
echo A/X69Pr24pAT9PqIcDxq1gpY0h2W7Ga6wJuz3gBfXgw2SAxRYPW19DYQiIBfCLKD 
echo laIvHcq4RJuYPdxmP2IZfosfone/nxpoJNqDwwNXrEnIADF6Q3gojXMBlqmiRNAb 
echo od1mW2xFDPLGNBGY+1gES+s2aCw7OO+9hAwrkjZeqgvE7QLB4xbfU+oMUGgPhNnT 
echo EeoEP4a7U47JEzRa3F/GhxsxQjaL2ImGshc3MlWfOZVsocDFCl6Gsb0nloeRL01U 
echo u9RTrTX5pgP/8XXYxoWswVseTmxqxr0Ug04BI9XH786OxA81ZQlQUGphRkcOeRb4 
echo rDQKhFclZOxBuBo8SAbbdD0IYCcdRPxCDuQATBiLNXC72Cc4XuFqBQYuZL8bXcgg 
echo WHLe4BaFMAW+dbpRIzjb4NoQvTeA17nX3BQkmI2GIPSxQ/MNg33oADdROwW7D14L 
echo GAttTKIM1Z9eJEHclkSb6JMGDqwB0cHcVYhgZJMcEg7TAWQaGRJeMnRALAsJB7uQ 
echo A2gjz8aD4C6K2M//u3Zq/l9k1wBRnHxQOWG9zhQLGXSZHlkXMshjm3wOL2BhB/Yd 
echo b1nRiCS/kMFewQHrQBqQA1DrJsFcyGBZmB1FHE4VZoQGxsIOzGykbGioM4N6WOcY 
echo o4Xe2b+QA6EFFbQtIUWsaw1q4WoKWfiwigpiBH0gOEjvtAbs3Ve0WSxuozlqAutC 
echo QwaSCxnAOQMhx55JXwPCcBGb5JBwzOLnA9RqnFrgC1KLTflB5tGAtgp4vTB5NqPi 
echo APjpAKUFNoAjMy7OqeDxDwbSiUS98EeBxq9TM4rf8wR86WoEv4ULGWTH8C1iqdxw 
echo zRGbMovIdGpUZCxF3jWNPDHoh/3IbtaKiwdIYyESIRcy5DsLG5IRHsTsUWNHmbFZ 
echo JJCvdQYhidxXgY9MBQiRHAWbRNbU7MDlrW585CvWagUrVwMKtFWwzVdi0UKdbdvW 
echo HhDoAvAS+BFX5kIG2cFiqvQk0RTlAifKdLO+ERTqT+8fSIkHgV/IgdAlH8n8hZ4A 
echo vIZPKneNDDCymfKFWU4utY4C4OS+YcJGzfkBsLXgRoHHg0BhRv58FQHiKXjdTuwt 
echo uABdYSvsFANPffy8xgJMCkEOof4IPtMQTnDe4NENgpebA03kBlZRSB5cc1MNHmPA 
echo 2ZALaywsF3xtQg7Z/C0ELymYy6DBgxCfGtmQwb6SDAzrOj8Qm8EQuC5q3zxbBmck 
echo uFbdhAu5kAkcJNaEimVF05wGm5IHKC8YGjCTYPZCElCbQnKFTdZq8AQ4Q0QKNyQX 
echo KuyaWCEyN8oZzkupyGBdwdTVeUBQUKkEXGIbsGYXXWt5AgX4FiH8+jZ2sD1WRdhX 
echo iA06w7gAsO0CpTZSV+tmAWi7BG2bOTd0bYkQV28hTcX2VfgQ9KT0oidkizQMZNhf 
echo 2LFEw0/hBZEkJIPQWbQL3laVhLP9C8MkNdsXXCQYxg08MN+wCGweNBCTkbOxiANs 
echo 0XYIcURrx6MESnyoDyOOOuAkDJh3CHUZADNXAR1JpSURTzBTXDbXjLndRomu6wMI 
echo NWBXNg5zVTI1m4NTjL1LAFgENzJoIRXskBZTLzFhQ3LZfCtwRZQ0sLuxzDvFWXIx 
echo cmvt2En0jA0rTB/8hoeGZAh4IPywnQoeK4khGAEzjFWEOS011CMYknxBT4TNFCzC 
echo LZYGNIluSR2WGCyBDSGXDYQoTlaEKiR1a66mAPqS+tqmfoNki0QQIin+9f6AOy91 
echo H0LvhDgBMA9SjDA2tmSrXrshgZ16dER3q0EjjtQWAyxnWVMX3AKN8BNGTHyQRq0z 
echo Roy1n0wRI8eK1OaMBlyMLxrdARuQQDO9dCZ0GN1tGRGbDSArETvuFR/vxn4MVY0D 
echo B0Y5koVlQwWfjuEAm5QfxlNukqjTK2ik1xdGLmRsUBSsO7yxENhCs/4lLMmPxBWN 
echo QyHfDaoRiOsTiw7DcVkgelAPz1zLoWKkajHRBE9FgIcDu6VT1BW0rOLhTc6MQM1w 
echo PwW49AZawEHr5LAJIYyKUYeF6lG0iBIiz5is2z2IR+sQBFcTEVoDWCjbfWusH7bd 
echo K9VjgDi3DRI8fYqNogSbaAg8EIQEPidTghzZVfrx/fD9u0fNimCV9YuE3BtF174Q 
echo xQN+AVNqK2BvRSukoQP+V1TgrdSyL9DXNIv4hUYUK/BTYMKBZcXIL5g2MRMychBN 
echo wTQ4IQcgD+sNKBJCQisKQk6Y4KsLCVYd/lqQsZOMhwwMayoLG1pWDVb6VqRMIJyg 
echo UUAN2EzJIYPexxSQhWUQDwzthGuw5OyFfgkedBerjUYGt0pXcVZBBIJr+LW5AGga 
echo B0scOBhMogchU6IDQImHCxHWejJRwDonzs6UfHSFS0EJPscuvibb+FsCtj46SybA 
echo +I20PgEguOy8CN0W1BUEU/UYplbGJZHsnHkusply84KVCB5bQJbtEmtQEPQFDQRZ 
echo wykhAY1GVA+xIrqqUOWNJBMB5MmL8IX2wBWwDILfZhBs3feAPjsQU+IwCD4I11bV 
echo CwIGwaxIIlUSol7+HRDpgJ472RElBY6yFQLEcgODVbAZ9PGBFaVHriBV/r+O4BkU 
echo 41lWqphA0bpX7fw3gQg2FZ1xQZ18bwC/l0fGBDulEnkwXouDUlB4FeSm++TISU70 
echo +/T79PcUPECHObMXu/K8pMD6+fT3+NBgQC7GC/yygvcJ9VqLs3FqJEdOcvT39Pf0 
echo +7fkMHO7bxWgVJOC2VZtP+0LQzaiJDh09gWEah312AtFHhiDDQlo3wlG+ud2UR2A 
echo C1/4WWj+Pt6TG9Qj+iTc+o4Rn+K+/hAU3em23OkcMrZNfiExx8c39wKCcCa/6C+A 
echo GtAlMCzZFnyRmShQG1cl7yw6qHLWNoV1yv0OFY8ToXCdve3YNz8TaPQ9psfyDaMU 
echo UecgATXc+r8rcDeBD4UfwIBICGvJPCu7gbv0SBgDSPZAEAvRAUM4/90qfn0HBYBR 
echo 8gu5BjvBfAIrChUu6MFpwFoF3oBZIVmX34hd9IP15tgC9Q8LDHR3VuWmesiz/v3k 
echo /gcCLSGwkJPd3P6CTVK5VTW1JeUQPqAN+BvMHnIMqCwB5P6hbOUZkMP74GwVxUC2 
echo AjH/7KUqtqGST6F0M7ignkt2NgQ+dAOokRBoIMc4KKRblAXWYHy+XAOX64pt/A9k 
echo UgkauAs3ZIFO+whxNkpsJcdc2aPssyQAfQwwVRK1ZwezU9b5BAD8GAHxmzUOUBwb 
echo biOIxhPQkMnJCBZFs9qR1nBEmgIQIaN6vHEHqBd26TlFkAmjTNLqbFlBVzBWY1Tv 
echo WfewJR/tGkwfAn1EVlRo4oD7VsEbCUyhJVG+WpQraxXboEnI0G1oEM9WTRLYUPwR 
echo uzgedLviCATE/ja0VgcgWVAOB28l+L7qLxQKuAgGH6hoQSLjGZnJ3VFtQX5oFFET 
echo UArAyH4BRmgcE/8zx0LV7C1Pdck/ozp0UwvqgdlFFFETCAPU2Rx/HNg1tfvz6VCL 
echo 3wfxAuA1CHEPtTAsayQsJ7frZcMglg71OE3ga7EM+QbV2hIgZkAraCbiBMMbGYnq 
echo q0AVougalIg2HCLTKhcFOZiE0zsgQ358V7/GGB2JuOHItIHBCJvE9zmDdgRlhen6 
echo 6IDnKi3pBxDWyhK0aoYCEvKnosHMTBeNIbWxB8UfnyIJ/1rg/d2aZAU7iHp8i1+/ 
echo fIoovLhExXQCYQIfL4hTaCydUxxdK4oFtAdW5pNg9hAOEP2L+eXi0K4lhv8Qfjek 
echo LcEE6rTHfe4IDT+7NRHbAusMB9wNgEOWXBW3EeKd8ENGOzZ8z7N3FF2cu5E7N31t 
echo pO5/5Bp1oUVGATsHfRAGF7jYE2TDWBZKJfnicfNoPHZufMMQ21Fj6ylDuHY9WsMA 
echo 7wledgpBhDC6wD0ywpuiFA+fwFDw/KwEsiHt7G4NcxGJmARYNc2EJlxFbKn33084 
echo CPUeExj9+7/8+whn6SXrDtj8KmFRaOEeOfYY2220mYjZFBtTSlZox5FNpxqByovv 
echo sfQGsWi4HfARuxcMOTIUFBhCXaSoKWdFjwXwmg0nG3389AIf+nzk2ZMAd+3nnezn 
echo auAaEcKgG/HeNAHRWesfgL0eCREvth0WnAsaZi3ah190UmnxFkE0wpMjGgSOyYwu 
echo aNHY7KjH7EKzMDDWfhBAPUEG5JIM7OwZGbmS7J6+ohFNTibsDKgnnDoKwA6F2+jd 
echo EFUFUQYhnjdTdHdYCYZBG0FSO9E6q4W34wh9OcT7YlbAe5+lk/BCgAqLFIyujar/ 
echo RklZt0Es/lPaWXzQX4OmYj5I0SMJdm9e7oy4tHPHEhWE15F8JYz6jXj5iX1w54Yb 
echo aEwwQfYRvA8Kx4dD31gahXW3Ep14DxRkL0T9bsAjPzuHgH0Y4hHMqOKM2mELbay/ 
echo Q9HfbDPZ98lyDwMPjFJTdB+FPIdMAqOELF/Id7WTkEiNc7cKh42OPWr1h+ESERux 
echo g1PPQ1RR+6CasFVQnxY4QrUViJkuGFspF/ZDA57eHBpomFgS1tjwJQdoJHrrohS7 
echo Ic8hUwGhrM8V8l2pH7T+vIV8Vwg75T/EwSusebIQzJ8lEWxlQm689DDjIwS7LLmD 
echo jdQOVGx7AgY+okZgSFRwaFhqFMcgKNPdpu2tW5reaIJOORR0HYsvTlTXwQ0fCVAx 
echo ULzNXCqWEEhk1bM/kWlhGCdCMVCMAwEK+oxYe74WsncoMTUZUmFYbSH7FrIpuTQi 
echo gbDcYFPyFjzDmA2GEN6epcMYAsNoRDE5m0I2p0ESUDH0HyXNK+SgvxOoU/IcMgTF 
echo tANdYc8h1MCfwCHfFfYfzH+tH9gzhWxeIRQcMkHIrlfIZGcVHnQyvkPyXaEUgKsV 
echo iTIT8pxC+hUzDRHSfXY9E9SjFh0s3SmEz848MyWLFx9I8hwyJQN9WF1hzxVvZF9b 
echo Ic8V8h+MeZznCmleKBioJ3kOmZK8ASzMrpDnClHcQpDvCnnsW5/4M4X8rk0fBDRU 
echo Ib8L4xQ0EIp0JDTuFfJNdFQ4gxkfCnmukEj8aHxXSPdXG390cB+QK6R5hUQcoH5T 
echo yNOyHNo07T8oNRXSnUJrHh9g+aawz7GUNd/tH5wUwucK2xQ2tPtdyOZNIDQ2+BQw 
echo K5SQrkUKz1SwnEJ2r5glP/g2wiWQbwrZADflH0SdQnav4yZfhDeiJyHdC9nUuDdm 
echo KDTEzxXyXWMf2GH0wvhcIe8EOClvCtmcLSkQOGEfIele2Bg4tGUqFCDku8KedCxp 
echo bx84VsRJLmh9XfwsAMxyBAUzFkAw93CqIy+/zJ2C5UA4GbEbGljQmgcQaEiNP0eY 
echo MFs7gH1KlQvt6U4hCyE4LSu4lK6Q7wo0H5wnsOcKeayyvH9zhXSvKCwf0MaQ5hXC 
echo 5MJvLfBzhXSvAS4f/LtCvinsDDlf0h8cIVPSvDAvLAL2XCHPdDzEUF+ukO4VDzA/ 
echo YFmQ5wr5H3CjgJApea7bkAM9V0jzFjGkw7iFbHqFv3YyLdA5/a6Q7gczlOTxNFg6 
echo 3JdMWOY8MWhcG0M0IepkV8bqqFozWUBd4Y0YO3pRvdHbaZA6KeRzYYHxoDoevUK+ 
echo 5B+w+DQeL2R3yFQxNRQAOwM2JM+QNBAJIPoMyTMBLFM0O0I2pzDndzZAO0Om5Jtp 
echo P0QC0rxCnlhQLDhYKiHfFRMfkPuusA2SoLCoMMAfV0jzCk061GQBGJKGOyXg91DA 
echo BuWqw9K7O5mS7UDHQ+QD8kI2Dy49FCNjPgncWPBDO58DfGjsjIpTRd8JfcBPwhR9 
echo 6Y1LA8tRIU4YsAgC1Iv3BEEMJLjf68iJIL5kKw8PAoNlfFP9LdhwWPRgdj+NtJ/S 
echo 4O8FAN+Jh1gIBgOHh7hVuZNai8/XgoZobxpYSDkeOmC3zgFw0wcvOxdyyJaboBBF 
echo KSxofEPmP6zh0O3yAkZDi4SfBD/IdGdRVqVQQOvGbFtbYDFPlTwCMFLRVbA03cOd 
echo gxHfbRDHRfwAMzHD9u+xi1OJn1yzXTCF275gO9oBd9C3/3UFu3VozqvNqA0wVyjx 
echo ayeCFkQs3p7wxYgwArnNGmpAAAc7qUNDpf+3YEEsGWcnSMFkO4R0UQgBGXGqZUt1 
echo zmHIs+ol3ckk3Q8jGpFkDNpZbvYhnh3gagUMToSxINioEHRkhs5iIUYx0wp8eyCB 
echo qd43AyEUDg14Vfn5UPsCLgk1fKNkGy47FzYZBq1WskAFwqzv5DhQW1w0OTjuQrB1 
echo tD0aZpsQVyI2BbciNFDEXXDb7extZlNWAEMz5UdWx+ALaimeRH0saI8Z+yzGSuyN 
echo NDjtVhA2gAXqVua5EhLZVuSSCPaDYAr/gIgaPuEBQiFWJWhjoXvIk5sYwYzAjGpj 
echo 9MAg1G7BEkXAdiSKPtRmuBdN1DCENIT6u9x+LBeMhLW7iBk5SZbqNQNjmjCoDb7Z 
echo EFYUqyACMS3GAWhwcNlExVOBME3/BFNMMFERCFZdpVfAh5TWO0fbTjIIwIvfSXw4 
echo 9gLkyEk49ijtRGSB3igLfBPiXCqBf8z7heaWNUh/BJqhn4K2c1N/4CmKlBxoxKQF 
echo LViffwyby2zlF7bGV4fkmwTs6OdQfIPABOLABU4uy1wfi54EhMIOut/gQrplJeAV 
echo U1/XGQwoYGhs2YpTvBuq+z2NewGzNlSnWIo0fDFUro4wcJdRLGSQpTA9MHxYNOk0 
echo GVhIRHYm+kxMFde2zmGLRSCH0BOyYLrncshgfBn6WNKLgnPuHX/SeNzViXDGy877 
echo 1HUMf8PIIc/2AWfcWFh8p6cbcnzSfFGuIxCx0nYO1zymbBuDaHsciByrXuryXI4K 
echo WC75fEKMQWIyQ4/ljAdCruDs2w29HLLNGAFsCAQDsw0hmnPCdG3LvjAuVuvXCwzT 
echo XbaE4DXHVQImmwiWFpfHRWEsRA1tZp/MjDy4UhgRsLguZLjt9ThK0qw3idnhh6xD 
echo sMINf4YCLsynvw/p21VFnuTHoPD3kngGh6rPm7wgBNkhuwgRGPZDTcc7BYWJAhg9 
echo BHQlIPQIHLGtiyHpXHWkwPiCWINe3Fv+gAeCLh++SMe0QXCEnH8U0hQEnPAenELM 
echo 16tcIphMZIWqEHGbQSwXdxv4J+QbBjgcBBz5IkoyIQXCLrndSA9bHx36aLqpGbJb 
echo oYvYoBgWM/JgW8WY/6RTagDmwgSCUjO89hjEsonO647fMi2gZjFraXeBC6g5PHc4 
echo ZjC4N5pDibVoCiJLUsRrUL8LA94kH44F1P0BiZ1wCWZLVETWATWi0nqGTkGYJEj1 
echo EY3LNh52cN7w8ImH8x6g+lCQWT9K42Rsi2gSfHGf38MDwALxWxDXB7G7QGyx0CSL 
echo l2iMxycfLoYUGQ3jrMCzsWcWjs5RPRTgMhiZJiJKpwEJBxU2cAUq62v3Ny4QywJo 
echo xHwI+RnAbjRo9BoCGWj8VfOyIQdcE9QTRSeAstE9tsWuaqO7JkiZCDNeiggZClV8 
echo BOvchEAumQAEFuzsWCVwmdwR0UJQy6owh/f8LdR9H1Q7TxRgJ1OJhSBS4s5Tasl3 
echo BsDifEhEqlDKDK6tcgFwKnaxoeAXdjCHXWgIFnyWCZc7nzsBR0hXJGIqTgFJ81le 
echo xs8QNPS3OVnnEIO4T+jzL1qRI1ZE2ZfN4hhQaf2ZEWjrjGORywtrC/kF/grZGAw1 
echo Vr7NP/WQoWQReyAPh3DzbLt8FIwzZZVUWKsGgl2aZWRoXGCrQ4vBg9i3UJu1smxb 
echo AGY1llADZEZottZU6VYYV6DwYXqzTSUPg40o9Vkt1LkklOEPU/ksZ3Tk0gYA9Piw 
echo 9wcgHdg3/FLrJvaFcD0QdR1qAWONsxPBiySGJkg42E18MoHby421DiEZnHSCRgyJ 
echo TJNXpMcAbji3+DcUclm6A+ysUZwgRiG0pAoFZVncbO0hamr1+9tcaMAiVDyDeqSF 
echo 9Ck2zIUlnxkb8vFRXlas0VGviDX2uDDghEVVi/BqFKWqNgkIM92sLUVQbWtZWEnC 
echo hmwDEXg7CPYlbFBYkhEm2kAuDN18yGCsCq6N/I+ryABbpIm/NKQVrQEHD1TNQuDy 
echo b9CLRTQDweupNqYYF2t31cuNJPH2U17kSX1qaj/6Sf/hSP+BbdueB1lWaGZuBGwG 
echo mzXGYmlWvDTbZmQwoVuLJTfCXVgf9252QzYk6zsYD1ViZoU6mYD+W0Q7dAFGg/4P 
echo fSSGCcHAhkE/cxtsUH3BM9u9LRFZ9tYdfN8sDotMXY9lMABJ5qp4+00sahznKEBR 
echo ePbqFlvNrEN2fFhe/2ANaAkXMPE2pXa2ckQyRSydPzsLbKIoPTA4S3nT/6BdFgoE 
echo KnBogf8RxIIvY4i70AhOckucNK8VE4JQupCG2Nk6l3/s4iACuN1wZRF17HYI87bV 
echo NFbx3XA7M2zDcn4S2M4QmUf1agJf6ykSwr0ASCbRm6AhexZoPBJ0wmv2nQoBuBzA 
echo p64mmVrst5jjC+tFzCycbfZQrROF24KE11yps4Gr2NpgoSrsQgAOax2VgIyqvqz6 
echo yL2EcezHebaKVjBchxgua+KvjphfVoNWHAr2ArhpIEDrfdoaJuQ3QwIE62JoVDQZ 
echo KhgzKprCUFvBJIukOMWwAXshKSciQLYvWdop8DkDIb5O+PRoXGUzo0de2JlDuIl9 
echo fGEIDusyXtXmSlEF6xqMQ0FiwhcHWFBZMERwjg7ug3N0ujmJQnkDrE918RC1JExC 
echo bz6E1E6O2AAQARql7AqHtg9grac4lTfeJwsATQOAaIi/C2i9qoB/V2BI4eCYQvMG 
echo BpctBQN9D9jrA1Yj4ZaCix1sUaYIUJ0VTPH1pYWN22yFInRxG1befZ81F9C2ig+I 
echo 1Z13y03fHuR/aJgEI3loiXXTdPu3d/VGD7ZNY7ZFfgNNTANHO84iAN0AU2pkWmIB 
echo 6ADUmG56xuqd7VZJfsPhnAJq2s5JiD//Rmxk6yNuJg+Gendo6/CZ4kU286Ts/hYs 
echo IYisME0KEXOtu9blzbHCENt6fQrpOkswuALqjRsLqynZdhB8Vp9gifniRfDsbI2Z 
echo +bwaAFwlIBC5AACXZdkCDAQUIIlsBeET+SekYpMAvwp+dtgqUIvLUbErElQ7EbSN 
echo Kovuq/i9Xbbl6+5ah4QaCQrSwD/+14OAUyTdFwJDA0eRgwG1JIqxzldzuk0QKzwv 
echo 1gUIG1CWk6BuWddDrIiJHjWkQ6jfm7FdUZETjKycbXxvSKaCGkEnEPjsmhKyA0wE 
echo eDuGErHlZ2mwAAAcLCIsQgGtsZcoa/G60tjkFbUTgsMpQHM3vT1wwn30gC0Pgpj0 
echo DBsV5nn44AGLRgQhlw9tCYGyzDQz24R/WPcSaNgPQw4DaglbgL0lUPJAdXQ8w79b 
echo RQPFUwWIT0gKSxGT/kQLqELMVRQgjTaS/Yim6lLqcjR0DDUnUKReaaNigFkEfxCk 
echo L3Ujm3U0qWAGhxYIVBD6Ozg1WZhUUKA/IFdof2FAcmIRzMIjfrsLdoHGEFnixCwy 
echo ZUlzZCh4sOlsRzKyHLo/UFCcH9AmW3RTXGwrRxOakzmGpEkiQcMxDTGL1DD1Ku12 
echo 7KKRC/EAfEz2Uglcq9YN0otdRsgFq4QEFKE/XGSvgOcBZoQZOFf2MwJMaNQzAyMa 
echo wBZr4E0BilVDAu/oGWsBEE0szFIXGFi6dGFLWfgVBNDr6CH5Ids/NhQE69NoDDtB 
echo LEBvFLoULDBAAcRpZoHKlRFH3IhJ0FqCiMezIBnonSDn+iRxRl/I3RmhuGMr7++k 
echo AkN2pTUUBViOAOMYNnNassEQqsZuCwPPoL5fjUsEUYhQX2ggZjYue70tFsS4JsiU 
echo XMgDKLAAmJAHoCsZNgxq9gUm0qjR4wAwV7piSZGCNPh8g34npG6+5ApoeD0k9uYc 
echo A1xQWNE8NiQKDotvGhGWJ5u7zidZKKImNh2wCQOpIiui5iNHKlllbR0IaKa6tLBI 
echo MzY8AkMM2XNkFSZcXyN5YM2AQlZgHGZHMpC9lE9oaDQNGwEZkpOPdBPI3qrK2OXz 
echo k2h8JGJIPhmzo2iIdIpaUYMKMAzGYLAIAJYIn13nYGQQHKIsDEZ1G0tGuDqbtTl8 
echo GwHO8eBQS8cRz89O1tAICg0VBww6jXULQIbshETFlKp7JYOAZwgCKiQchC0iUqMd 
echo P2Iku7OFUIYPO0NyFqF4jKAXPxAmUbWICFLrK8xcWNhoqCivXeQsNntArwZIP14Y 
echo 8lasSN6CQIgTbsASqLn5FeTUCdShOLXY0XbAthUKpzic2IsHKIW7UZIEHh2gUcGj 
echo kYBTGdBm4YJICvQgH+RkVBlyAYoOgPkKCwVsIkCq/ryxhQQC8yhDCaiMFTrkyKUE 
echo AlpY+mELaAOGpG2rhFlemSt9JzhGAkPPSPoAaxHbSeu4cu+YEdChFrE8u2KAQY3R 
echo tsi/CZkpOAFasaOh4v5TNhpqE2x0XWBN+CTp/Q8RW5hyzNPLVCALneGNfAAD83ww 
echo WEZboYcNfK41V9vL2jY7aGo1MgNSkc22FxBoplONCN4lEUNT07EVkaagDTxGBLye 
echo UFfrPdFDmAxJEigXBLwHV9AaxiQLzRhIGEyaOIoVezZK4jhXUWhIpQy5qfgtGTCH 
echo BZRM+Uh0BXzI/eHkNmhB6AQqa0HpO5dAk0D3BBe5iiPQ6k1wEJhH4EjFbNs+vgA3 
echo 0lH9WP6lpWj2ABJSqhcUO2alS8sb5MiPxCnxKPFWFMkBGaTt7Tn2M3o05Dj2JFqX 
echo LUpGFDrxDDdpvtkkQCMa7TDI5pIlF1EyOJoZ3g4YVwCLPZxuTxNBBFoz1307Zkdw 
echo s0gTEd5TGlY90KTD8gCz92aToDkwYTCwEcKsCWAYmg15ciH0IPTdSLkNmmQF3VCm 
echo W8xJeDMkKmoGXozfE1p3PAG1CAVmgDhcqU8JW/zUF2g6V7ldfFmyYIoZLkkNQFTB 
echo fm93MyT7EuE7xXvU6ykeUyhMww/zJEw/vd8+WPAkqI+LZC4QAgUutRVVSIj5BUMN 
echo Uf9vDQgBcwQ7yXYFg87/LIRPCHWbEmiMM0MLAusoQbGF5GiQNzITcQEG7OQUFXNw 
echo 8Qp4ATUcEoRGtkTxLF2UOhPyAPlPoKw3ExxNMSTERMi4W7MIE8W3tgNARrHJYXdQ 
echo HJuLhgDNA1awZymEIVsdlNmYGVIYC1ob0DtUTIKaDES5X1IIxwQk5MUdot4ncwYB 
echo PS91RsWE9yVoG81zwACCHQd6pBhxstYIJFG7FTUBStE46ofw6AGGPGcCMm65g0nA 
echo 76lCx/xmL2pJwH0SgMFXhYlSgEPcGecINyEEBUZcEf5L2MsG3RiPghdnWzAXgLaE 
echo HH7BhDPgIOuInSlfAgYsGSi2j4ABri650atg1vuNNDtWuyOtz6Rbij1qQHlK2Atc 
echo SwQsxInEQnVqYKGCH9oSnECZgma5f0A1AK14r0h0CilgsIBWJqdXPSglLKY/WwZ5 
echo CAomkoNTCHRkSFeJfQIwBIZghH6DmgWYP0WwEwJT0H6AjLr8iv+hNICJgyiUjF40 
echo b8jZUCNZmO72xxUI9BA2I1br29wJ2oR6YBAkkLZGNTxqxrEzac+xm4p+qqFQOEEk 
echo oVQHi17xqCjvplzdR22B2JiOKk+KGcxt7AQDiD+NLmhYIs8ozvZHOlVqfb/+EcCC 
echo E+xxFh06R6I7UH3Hdhw45Fw4HbEegL0GGFvFnwdXEyTN7s07IUIo9GxL7xG4PN4W 
echo dNNTwd57C2ULVP+DF8hK2lgPTJJoYAtRIRIMIK+YEFCCjUwl5KfoF51BgpMEhes1 
echo bqliLIoxa4d8UAgIkkWaxSYJTIB6ix0QlI0Ws7982x0qIFomCay/CCxVyUXy2ALA 
echo Ud81mrYYxQyh4GYdsUUP+QNQU3v8S8YJUESHeqrKDK8gPdmYqs6cHdoYsK7klUMq 
echo AcmtBIwYAU8QsVNa7RaIDiBbhfMRUIoOOdaooqO+ftgCm+0yqM3+GGVTV2QRzkYF 
echo oGS9lEwAcmhowXbFiofKfS5yRbFSfOMDwGnOIv6fTjPSQovI0+IJVVjzfOCVOYhy 
echo x53XjGd0j3vJZNqucBzkIbyCINddABDmiSfA7hJqVrSRMEhW3cVRxUhCO84BsQhm 
echo qgYFkipI4DVVlf+uK2XbRXx9BtwFiEMg+5CKqZ7ZXVwlbrco0YO7994lYBtgVdsF 
echo DAFOAlZBQIguSIGFh8E2SPYPt4YiEBJRkivrwAvGZhJbdup8e8dJDTQIDnYhBTwh 
echo sRALQIMbL0oBFUtIFDsGQXNIHedZEa05fAQRrtCpaJiFfDr5SbDvZQ99DGDrBSAg 
echo dfaMN2xWdl16OSJ9sM0cyRQGOoBxycZcCvZRjGM0O0bQA3RGsRBBDwO7QTt9DmD6 
echo BLZCGGRdU1iQK/u63MZcc2+OIDRfKNoCjj4UCF8zCQNsEkECGlIsVOm05OtDOIlN 
echo fLcQSEMAIjT+5UK1CMey+EUOIvALYEl9B1KpGQLeTtlFYEtgtmExfsXKcU0SaQjb 
echo KBaaVmrbsBbAtGXfmMSHBGFXHLODcbIAJtVN5pwkAI5s9wEq82khT07yKPNK/Uj9 
echo CL5gdBjpLVAOAFxDHuL9JWTkYBtI/QKBl82GFjmJ6cAmAVzZwECX7cj+6axhFd2D 
echo +JUqsEjXhgrMGEZymWDK7Kc8l7USBcfSYH0wwN6BaMawRbQLMwuOAYgdJCKCDgLg 
echo 8qkGJI4s4Y9XfN2DdQEJ/b0n57ECgrX3Qk7UKY6ZoMaznuhb8DwEThYr4eQLcmSQ 
echo QY5Aiew5aIJW4BgDsPEjSFIw98jwewnAAJURPpsygmHFW93iScFuUm63mRMPhaZe 
echo Qaa4r6/ANGSQ+/uk2K2cpCU/29N1DhLLWrE7aPSx6ySjEtEhL80EOhH+dRsogknF 
echo TKxTVUOw26smz3QRFCFSMKMCtYEXntsGmVnuKfpw3LKHNAC8fJQm11GIz0L+NAqg 
echo UGBFSW5BZDoCA9EEYPB9FAzYgsNg0AW3FRg2j1vpO7vDYX2IfAX0+Oe2hCTFqWjP 
echo RM4VF4TwtxKYSWhdfIVUiEO8FVjcBmkmK55ALhyAOBQ7YkTGZFMQhUEgLlhsbEfM 
echo iCw/WVMM0LBSDO5ZheAAfvIPe+B6QEyix1tpEJwI4YQIoZczJ+gFIYo8GgLZgj/+ 
echo hnZNj77MHn00pSpOgCtoHuSaKOiqpELcGSo/s/AKgPcITg7NKAPMionbEWCSrYdJ 
echo Vtg9vpeQVyfqNGgFEexHhdX0FHq+/WddKDvHD46G0zlqCo2NUfYMTaDCGEk9gM1s 
echo SHTWF5rQGMCbgWsAahpoGoKU/MqoLUj+h4MaO6uNn3migS+bsWxqHTKDGhXrmoh4 
echo guO1+7BMwUAuC4pWpmPPYkX0aooMLGGa2LELREMHgA7gVqF9s2fBVm/rCA9jGjhI 
echo 8dpzun9Q7AF17Ogxi7NFCTuPpoTFWCcU6/ZKNohXQgR0AhqgxTSgF9TsQ1EICFyj 
echo 2G0NH4Jo1PQjIBeG5CJRYMAHQwdngXKk5PPmpD+fAznIJp0knR8knQS2JSMCRmyn 
echo GIs61ZEOWJIjL6ONWARMO4hLqDxYCBIbMSM4LHYRz5Lt2waiiwtR/1JwJQRSQImu 
echo eJ6vYzCsDMspt7o45INP4wgChT48opeyiuQSLg+RjyxgOGxAPGAWBU+cGT082eAp 
echo SGmQBmoR7E7GHR9ZfRM3CVecLEHwoRixyHhlMTKvCbZSgBEIVO9jgt3fAtWVb2j8 
echo HV0DUvfQFqNPzAiZbA3bmNlcNCJtqBZWMVi63HcogipQTHcGERksCmd8AXrXInVA 
echo BrtbagYlECAHEfA5Am8iw/f1ewPrW6ipGAjEO1vTUZUX9mhwFAeBAPnKdklofCwE 
echo aITgrKhlCEfOnfEAHYyCiYWPizpAhSELfZlQngsBuQJ0qU6QbB1YPePp5qgO4kDs 
echo CJYccDU3w3CaETQQChAcqlkrNw0f3cugVoPELGoboCyDbV9FTRhwCk5oMt57g088 
echo CjdtbkJqR199R32CPSHLhGwQA2gEXAEzNEwoEKNmJLrmVKACTGUoOY5sY69ICzBI 
echo iYu1V/CzvDggAMy+QzxLsbMvcDiP/yQqOD3Lw2i0d/KSgEmQPYYJ4kISFG9aDl01 
echo NutWbGoILDErwIYAuFcoqiPTTTaXILlQakROhBADYMR44SCjcEnxx8EvNPh9PCu1 
echo SEArRThHckKEri+fbK07bFzIcshYWHw45GHhjTS6R1c5fMIPKtBw2TwDPQC55EHL 
echo 4FiSATlkfHxYDXlY2SM9WMUtdhExv+LoOPqLkRuNBARhPPoEmdEjS9Rh/B3xQz8C 
echo 9IZaKmsY9oWA++BmFTUPl0ADtOxV1SRda4kOYtk51Wx2kPtFfQWXTlglH3xAOChx 
echo inwDhwDFMzWdrQ2RCDP2g+D4UBFIvAVMxpoDwCY8g4koH3oscXtx4gS47DN1Oumi 
echo Wloo/v5E/B8k2k1gM9IPpMoQweujGwi4EjPbs8EL2qciNlX/wAET3jveEXVExhht 
echo 35lyXHcEonZHAXHGbnctFkL5XFbAaFFvVcUKYgNOTIlebGypFGlQKY1tHzNR/dmo 
echo NEVEARH7UYzdNnC0d0E8ORByqh7wjQXQIZWwxmOJWpUVYzJtQwNkGvjrAlQEHygU 
echo JNJFIHmEhwp8VHWyE421tPrx1G4siUDXJgZWhoC+KVDvMIAuuySFGU2ykvssrllf 
echo iLgBHjPJlgyIGEC7DB0SQ8g3XFNROHILVg6ZVBGLh2NzOAJgj48sFVflgHgsLEKA 
echo mjso8+1dNA84HgQACd/6LIu6UJmNRsVQsSAOfiXcSRStdBOFi0oyBA3QR3sL+fXZ 
echo XoFTYG/gNZhmRm5dhhqEbP94DDisNUyMK1MAD9bw+yZrl9Y+nCl1V+B27GwNsNFs 
echo 8mwVvLgCxCCWHFNqIZWDEa+iroP0hAp9F2Bo8Ayi0IcAPOsNaOofewErMisNpllq 
echo BV8B70X1EEJWomDIBs1kEj3Iy8oUBoM96F64jQjBAIXWUFj3fY0sEAjYsFxpoyM5 
echo +3239Wh4HTUMo8gRiJNLTi7MmNC55OSStNTQ2EtOLjng3PQB4aKR4KMHVpECKlVS 
echo H1MVk6LaFpMNolAkQg5WDEYBrccq0lcBis5QihfUbFkQTDY99kZnakB+J2gcPRAm 
echo PBBMdl8cBCBA8FeWhChcH1wTscz1zHxNVY2yDaJANFUgjd1E0UTaC2pqKFMnAYCA 
echo iyjrPHTRGBF1COu9SdAIUYn8wmbiM7cG+AIZ+6MwGXSiYlXyD7BD1MZs0yxoDqyb 
echo kEgVyxgDVniP6MjYVoRENCA/o+YaaIg9CgOrgK6nOAwk5BPmuiR7nCX/QWioPS+o 
echo 0J+L0IXSdCgQ+Zpte6PgBSFF5ALg59wQziDA3ODcJMrSVDeWEKrXtEi/LXnAXOte 
echo LmjAXNDnypd10Gg94CPhHbYD9qGAagQiNkZMFHo96wo2xpujFSwE5lxqvQL8VxSw 
echo Y1kEV42KxxgzOEifgvR3VhsYPkx2s3ti1kh0YU5oNBBsJD+T/D1oRGgsaFT7meTm 
echo UGAbaGRUCscFekN4sMP9hF51B6YF8kC2w5e0dD5McjLJgICUeCQnk5yocMCcnGTk 
echo oGLQfGG0JGokk7TXhc8NGgdVyLnIIUmIYguxOcvZOTvKIFDRMYkMEaDYIHA6zyuI 
echo C0DcajozrTYALwdIL8oquABMgHKDrzwkoH9l/HxuU7P1/h6QJ1RX9P49YGkoTfXr 
echo nL8FdQ2AzJMg1lB96I0pNb51k2YMdw6LW41EMAuqWUHMD3JbEqpY7VYSIQhFEIga 
echo kWAOtQfhX55WdEeFg+AIUDwClzaNibjtApBWxwUQKGZ1DaDD6noPO2N0MLtFdB4e 
echo 5mCT56AW1aRWzeKSoLqF08MdLNY2UDzZHEDr4NgMQOFWBEESiB55Bm6ED1k5HWNj 
echo sS7FhBTBEFpOBtM5s4f4Ofa/Fi1G4B4IN6hknn3SvbUXFnABQ1d36xInUHEQA8o5 
echo s9sKwlTFQ18+QMSwx6C4XESOhRehyopGkNluZnu7EVc5NZQLBZh4Vsz2VEvHbBmz 
echo Q9RnhzqdjRS8cLbefDOdRIvBbWgCKGTxmu0Ln94SeL+0pOjCEUH6OTadQTXkOO5A 
echo 90HoQS7geIuEnVzO7W2G2KWNGmw4/rNXBaerePyZgjhQ+ENXtWziHVPJfAxAyYJ7 
echo BSIkLSR8StBa0QzHxAyeELOm4FRv9s+fKyD3KmuxLuEIFXhoD4L6Rs05EFHgb2Sw 
echo vMxdeFMXET48mji4DqQABTtYA5v8vyT7UPiJvRMdwDbbK2zrdeCFMJ6d28wfx8E0 
echo /ciJnVs7y/cmJGossQgos4Q5MiG3Y9hZ6mC9dBS+FPBtBu/IaHWHDHmWi4IJVfLM 
echo a0QY8jhC/yT/lPke5qKW8JYVKgZCvRgHIyVEwKPIvefHK0J0iQTcAC1sNKD8vspI 
echo x72oRoiKHt+JmQ+3vdRIzAWkuG7CWShgAcy9Tqt6KHoMSAhUGwxAv0c7ffxyuD+S 
echo zpG1kD5LOLB6U8SQYibTIdTGB8iWTQoaQGhl2azkHlrcEh+PcmmShh0SS/O81oIH 
echo FAFDSVUsIxc0AoY0gQt+UMBuz4RsQChqLh8bJyJXpHMI65UVFITYYM2ZbNCwJUv4 
echo UUWZpPhwpioesuoD660dAwAdQFsIrgIAjaqeolT1BEwh21epmNzgChlkYUY1ZgAF 
echo WyEA5GoAXPXONqAwRcp1NFA5MLdIMnMIIc+RAxiIYYRAywBK0EFQSEgCjkV04ndi 
echo BnUlg34E9kqo4JdnEv9GCIWJwyJiXvkMWtQXXZCOV8X4CRYoR3Wp9FEWqlW1v+Q2 
echo svg+IChhL7ALCAQciA4/WhWbiQV0X0xR6FAs0EAriofRVxXAvBFXBBZyixaUEF+P 
echo inJjjBFsAzF9B2rhg8MoE/PhQQJKhnA/bw5oJHbxrBsMpAKO3hC8IBsncL4QMLvZ 
echo 2AGY0j2tGIuNKCPKEkTgV5Tj/6GAhwL7TPKIy7INAlxgZIkyIvghuIlNRHSkAExX 
echo raN0mTkSHQn9eAj9hh+rXi8OQ2zSZ4C9ATDxY2d1Tzk9eJOL4R5NqCpfdlgxudB0 
echo evRQ4Xhq6F7zLMLYfKEEIxF8/Qo8MidcUVeU0NaQJwu2PAj9rIhNF15zDGZ8R9WL 
echo Q25jpItOMxOJMF8U0boUG4vWWb9v52eaRgE5QwWL/mn/IAM7eBHh4GpMWQ/MNR2W 
echo UHpaUN4Pgpl7QAcPbSMQlKwwUdLRI1Lzj4tGEBOeAXhIEI2wEGqDPhKaEFoPUM09 
echo xrlE0EKIBiWUPkGawSaoCwjABJVBmhDQFAF9SF3JwwSDezQ4dr+44n5A4ksokNNB 
echo 4xoZ6xZIdwRHoCld1k0quhpQFRNE/EgFoDtDNHzAXgZ8WC7H6/ZJMAFYWARNEXsg 
echo F6JWED9PV9desjMHID/VOD9MP5LN2UtkP+EMcD9NhQLyiD+fWQYPBkNBqWZBBZwi 
echo Mn3aVjfgAg1eRayGSzwWBNuLKxh78I1G+FfRsj6pzT4BakC6AbSpGUW18l20bhb0 
echo jEFFtA4JmQdabBZcwBwoChZeujoCfmd0BbKNPwGFnjPhdj+FODjtngsoIwQ4I9fe 
echo WxCsZtFY8wfdFsABBnY5GnQnC/uL1qLHhMUcaJhPOxOuuQsbUh3/hGicJpEMDi4C 
echo DmSQIfkXsMS4GZJBhqXMjch3QgbUdHIT6DwX8lxe8EP8mZDPhS8AQBTe1SfkFHUr 
echo uAUA6xq4A2B+fv4GE7gADLgBBbgCIbEVdLCJN/gdHRIUpzYoFIoYr4oDE+aApTaL 
echo GSnRP6qIRdAr4kIV7pD2DCaNnQrmakIrEcoNGcxLIhAZ9tobCwhAJAJvRiAo0gwU 
echo XUW5RsH7fhgyAhq5wNXMIru4XZDq/PwXAUYPWQkiFW84isfWprBEKfR0BJdsNiu9 
echo oaJNfkueHGEhjyNqA+wAJMBEdkmQw86Os8EaQAABMtKtQRn4Q7xZi7MAYF7hzHYi 
echo jUEEC5SwZ1Q21iNVbxAtBPEIskgEdCYEtLUJBAkE5UAxBChtDAOgIE5TYQgIUE0C 
echo qhZ7QawScgHDHKzJAP+NOCAaULnRycFaVHocLEBDKOBsGQSzsCGyZXp5PFzdXsC9 
echo I1d++cLnQEuJN/ajIhFX0denH5akgt5f8cMHjCrahWA96CiVe1WH6ggfQy02oGib 
echo R/gfuy09PYAup/CKImiSwR7iqvDWEAFQdId+T3XbXl9sOoNquhldIlP4SPYpDRQ0 
echo APvTYcOabiPgPw+2XgI/m6A4RDwC11/yFA5MoBYRjNuE2qShRnSOfAUFCCLuHahO 
echo 8U10luWLIBPPKRMv8huAHQ9qJTVqMsTY0sQ6otxqJwwnxg4TQBduDYpEIjxcDm5v 
echo G1QEai8XK8FIUX4emQDq7iaNHDkk2YEXK8wM2Tk3NxLaCGiD3HQMv2AgCuZIaqSF 
echo 1AWSaArxAHZElweoK80rxp7BYVfdj8LsCMAUBEoRoCGagECcVEC8Xqc7AmPeB6zr 
echo ahzMNM/IYBoMuE/oSDbPlNQ0FECQbVHzAEAZ6Pw1xAqKwA+QjIKmCVXIlFd6eHP0 
echo vp4S/3AEE5MtGgeDwAr/ydMjHKxiEnZfybiLFtwngPcK2LVVOwVFinAli3IBxor6 
echo gxV0Wmrw/zfWqVVvKxoKIAsJEBT0+EwcB2iJGafoJ0/Z/mpkeMmCxkJ7dA96blwV 
echo 8LkIjaGmDgdUVOQoW0xehsCPqiUnKqO46Yw4fDbueNVYO/RnbtAYaEAfo7xi5OSy 
echo GJYRwJBOLjm5tKSwuOSSk0u4yMQuObnk3KjsrMzmGkXIhQykZ/u1heNBDYF0OQe0 
echo lmd5ljGwKbghxHuWZ3kZqBGsCfFsmFFFY5XDU0CRfgSVQUFJTD1Bz5FhwFH4A71C 
echo nX++Z+rUuoPAK1pq/xk4BTSDDM+He8xiTib7DueG6xBTX4FcUcsRUtP7hj0aKDWA 
echo Q7xN8VlwFe+PwGp0O9B7UZyBkRbV6yFglGoQXX2q7rerHVB0Zg8ChthQM1ANBC8Q 
echo mJZZ2yo4X6xYYBDZuqJyB3YtePiKdG+GPDchpDVwOwLA3AFGXB5gR7BW+Mly12kU 
echo IyedAbRIrAVWugwgZtww/GjJd6g7FF61mwX62clSxHU7aHSj0FsGGRSlekaeJw8c 
echo QTRBxGPoLfOLk8BjJBZ/TNu2wV8RSEh0OIPoriwHIgoYqd1vLwN0DAQFdUhobDjr 
echo bOLPz89fBmVoVF5ojFdoSFCtbc/PaIBJaJRCNRdKQldiW7YuAiQaDQcHXPe3oSAw 
echo aNggIWhcBvPz8/MaaGQTaLgMaMgFaKhApWhWURjJ2BHv73MO3gyhrrlqBwiGsB1o 
echo wNAGimJljBkBKKyg8RasHeG4JFreGp8Pg/4ZuAQXdBQWg+cwUNPxRiWCVtEXvN/3 
echo aAN82aCb51ty2DgKBXUWFfjiEOkrUwqRPdTAqVT2FBUSVBKI98TGoBDALoYH3o5F 
echo X6slWlBB/LjhDoQBU9JnmECwZJQjHBCtHF0COB/vKVHUQINk/L1+O0VhonhHjAgo 
echo CpxlCAw3EAlepKgiOa10gkcXL6xWW0N9nASiaLopOAwMNsxsGxQZNAMc0OrMI8e5 
echo w1YqYQdoeyp92LLDVkQCg0TtIVS2MGZki/E+E0GElhQrZ+n3wKOi0oFqCrZfALgE 
echo NWogDBTGKKLZPoBe03uikusWg4EGBNEolTmsq3IElPhUV8QL7otACOAI/WLLSVOo 
echo x6EfiY2fZiH2ooneGRQQtRwiSFIEy2FGxLf+rGo/W0P4dFRQaGUq+1/PbCBuY6hb 
echo dOwEUbQBaglDPDPSa99ALEiIH4kRiVEMAsPD2tl+IF6JcQgTGAgWzf2FbBAoiRCJ 
echo kDgSBUaZkZE8QETOku0Q7423LS8KGNtsOuQIXvsYZ1e/BkKcisITwHug/VCqCgG+ 
echo yGQVk41iTVVmmfjfjwdE4FpYPSdZRMdoq3yy/g00ALqoXxZVZoMkPiFeFTwsCjNq 
echo EMAjoCWwURebwQUDcDVQPQTRVNANyAi49apj+uJAFtgTQeojzMs8HAbXTeqCt7UD 
echo QVE4gJziUriPDhAe4Oj5FhxLABcMyeRXRC3mEVMynH5f0zWCcBBeD/BFGItOugbc 
echo dWi8uSz7cUcMOfkS0P32/AoaRew/t+ibh/DZHBNv5I2DVyPxGAZAgIguoYIHQjgM 
echo YIn+1hq9VfxSag9qvlAYqaKnkviOTWOl4C6hVfRSrD8MDgmgtzkIdi9TJVZIUN/n 
echo E7UVYF3N8tYo2bNsiy1y01u8pmEvD3IyVz2A64JSM/bxHTMNrwSWSTebQeBh1p6Q 
echo FDiIfkTRxBG/6YGVadjI0HDwnVpxR4ePXSFLCImOdAVujIVmazIMQIsljmN07VM7 
echo fCVj6y9yMARcyYGMPEQIE5IlwS7TN3uRD1WiPAhDV2rYzEJ00MxXQPA4xjajnaUD 
echo UfRRVio2Ci7E3QXtwWzNyGYGzOIDHN0KrZn86AxbBXQzG042yHHE90w7ZjkTmyuK 
echo OAMd9OHWZi0q+BgSm7SOp1tE+PhCgyaPrXwbFm0S4A8c4ETwaongJELjnLlyk9cG 
echo z7IcRPxA35AviCqa+LmFvarYHkGu+TVg41yg2JPI9+lAeoG1ZyrSsUUEZvvRGQiW 
echo RMMV5iglNnDuAinQ4LlQ9gzBwPVAWxQkVB3WhjCqjh+Px4yxQK2qKITxE1DVdFJX 
echo q6pgfLSZrTNMv62dUQhNEBXeF5lNCBYl4xlU5K6iiIMlhI2yze1zJEQLSFi9E201 
echo R7HnQgWDmlREMIrNCV7sCrhNtUT7IWm3FC/UhhN3DQ+OCcU1jY83CBpWOum7DG8j 
echo Gx05AfLY7KXcUlNU2WYs3PPS3K9F+2KV1VZpqmYaebZh3R/0k+BzGw5poeDgE3Z1 
echo HxcWZk9w5FLV5Pgl5JaxZmtQLujoEyDoEVBDqfYRMNB4ON/3/FJohEIkFECHuYXQ 
echo M88hMAjkHiyIJnvgcot3hxzmdBzc8Pc7hxRJl6E2D4wGD+w4BkOIKwDHB0yimmAk 
echo XiohQoEhYhxhXvcB1zE0K4zQ43YI2gfaAMfP1OPpJzZ7h4JrCq5jkkMmW1GklOMx 
echo ElWHFREQUYdknzUwPv7qozpfSBhjsyhZt7sFV34nbI2LL5qMih6/VxdpEyo61vwn 
echo fNnlg6L3kviLgxolGHgANS+18b/fGQ2TGYHDV4XSi/e5g4gvgCL331UgT/SFgnxO 
echo g/oyEUh0+/oZi4cA2jjbDAI66BJMojhPjUfn7HeSO2n/HwM7UrWYVNVM0nddHlSx 
echo gJbxIhkFlk7HCaily1pwPiraECQQJ4BiJ2pgFPQXnMPr9yBFFOjunzQZVn5TbGOk 
echo xy5hEzsPfQuLOwNOehkcQCFpx/BhkirsFQeGCCwstcxiFKuBhBxmtWcNYkNDfLBt 
echo AiNjJoAcahRH2oBFan5WrfBMaamAHRNhI75skQloFfPy07UDLysYOYa3zF4UUY3N 
echo zrldzFHYwFYwHRT5dYQU2YIOHhvh333nfy40qFQLkYV8POEoVUyzsRRtdVmgfxQ8 
echo g/8BU0cqohBaUDiFbrI1eOxliw4TDFFVL4EDcjaPUt9+frdlYIFLbBD+ImBJ3wtU 
echo hbHOg8cIUggvdE0Xhgw0fotN2QSYf+N2idjq2V0C6NgJ3+D2xAV6dQ/2uwUO6xDd 
echo 2NnuEkF07Q1FmSh3wz9q2R8IG6Ja2p5GLENXBI0MdDHbUM+bfJ2abBB5li32JONg 
echo EBAQFZBDJhAQpfnczUqHWAgI1FoBqWrnkJ5Y0dgmebafVgS4VAwMDNdekkMMUZ22 
echo b6PXPlYMmLnfH5yzxb6BLJUQfLTrQKShFIAcMskUFBR0z3DIFBSNS0ccDrMCcq/J 
echo 4KgQDKKN0dhqT4je7SfIAYkhVN2dhgj+dC3zxJZjyQgAdw4F/eJC8PhTtosRim8M 
echo vmsUW+sYkNJBVwahX6k+GQhSHkZPA2UMgwjEtH2p0kGRCBEhmVCveJCkpKCzB3Sl 
echo jQMkCMQHAYs9kBRvmIwUSQhydQh0XcBlAC8MdFttVwgFHRhsVmGJ2AV6yrj9gL0a 
echo 5chk1Gb/xlBzFlOGTnIMdQM2hIErLgkMKKIeQYwQDweIj1HrE0DwMoNVP+x0LCYE 
echo WWgKQSc+Rg0Oj6FAg5APbavCDzea7KQ86xra4YMUe+w9PjtWns8SETcA7BIC8J9D 
echo RkbE8PDpASWesSdo1BzgETwcEkGe4No0FEkXI4O65CrkPDGyceSxmfQgV2U7ckgh 
echo EHR3Y/jxRZCR5PhzVkB0n4gytHUKLTyzdSc2busiyg04I9wpHlZVDaTtLePkJA6d 
echo EhbUcPRkMSCcdRzq6JABCUe3mIxnLVtzc4aH4GsgAGeUBEPMyDfI3Nzgy/gZ+Q7N 
echo T8r4qugdUr+k6OgPhol05JZtwuL4Lmdj9BTZukFG9PQXRkfYMoV8p9jo2PSfbLIE 
echo zOTo6A+Cd+RCFiP4ROmYNCGHCuwIyRBw7WiDA5B1RDmnc3LkGSsmlwAMHJgsywwY 
echo DBu7LQhsgXqkCXBMAnUGDDCBKIGURQROyAJ4DHshc4DbwB3rJC1UPHdTciWDmQwM 
echo X3PFYLkICZQMYsm9gjAF8nUSAA+uw5dFqfHFBFwtLSLL5yDqB1DwOC88gLNVIjAR 
echo XaocIfbNP/dN8IADqWYdSB96LWBTSMqqdlzJm3UarAyf/7p1S2DWLN0yLQwMExO2 
echo ZgL5S1tT5ID2sNzxP4alO/63qaILM5rbcq5tMLCWsAhbyj00B5QwkljlnlbisDWN 
echo 8ALsBtAKhu4A7XZxGi4X9HsDkTILx/TrUHrgMKOx26Q2llQXMrESGtYk4EzwnhiS 
echo RbxBBGN6B/Byjx8MWHVSX1lTFQdQGwpqjI70dSfb69ftaX2NlsCEXRRiSH0/w3RL 
echo f1OZjLKMUFUlDPwXUWO8RG826wlPD8v2IlfbCpbn9JSESiALVPGLHG0A8oKoO2B7 
echo bZQGKGgkQ+vGwj14ahf8gzVu2qHUeQh0Gq/DG4i1RhDA4RJmKFGyd62Xc+IZMBPN 
echo PehyAq5kkAM7NBpJd27cRotVwgJTWRz2BYQsV34JGihOiGj8w9ruQuyC8GbFvuwF 
echo dSYNapAy9Acu7FDiVWxA68cpFq+CIhjimtCgRjCSRzhWWAWZP9MBPEGN/mA+FMQD 
echo TJjVEoJHrkGnvzqxsQfyDAIHUF5ZvEoOZbMMwIYcCDGQkxwcCAcCBHAqItVJtFAU 
echo YnGNSv0EOucJu/z+lu2FVL1QQ451IjPUAG57KyBEGr/H0Y8dCYo4TXRIiV449ttD 
echo LdgS3cOdNHY2ajTdtqvasGULPrwSVQWcCjIWt7/6ApNHDLR+NHLKBsnDM9xqBIRq 
echo JYi2BVTb92aEgz2QaoEGDvSAcmVT04xqEkGKcpD1+IS3bI9V0fXSBVlIw0OAjIyM 
echo jXwFeHRwjIyMjGxoZGCMjIyMXFhUUIyMjIxMSERAjIyMjDw4KCSMjIyMIBwYFIyM 
echo jIwQDAgE4GvfjABqcGgAFAbVrH5TbQp4PQiF12aBOE1aXuglCNJIPAMCOVBF3ohq 
echo I7ASrRg9C7rUbBuydB8GAgVa5Otq0w03ebmE8g528h+Z+DLP9qYkDoN5dA/i6ChM 
echo WyUsN+SG28OGaxMsc5QNUv8GkK6bajsU/PENPGCKHRkzEV4NOKHMANzP/gwAo4hq 
echo o6g5HQAY/XVPl5usCGvQHlkYlmjQC3qf3VlozBMnkKE0PxtRWYqq4FcwmYJmM+MD 
echo 2NRGV4DqRJOzNXcBYsi0MqHccQt9gYjSzIA+IhFG+bZbdwiKBjo6BDwN8hIEVLG1 
echo ASD117QLW3eMmJCf9kW0zBEoRSI+b4W4BCsgdtjr9aOBgK1PUEXXgaOtrfQluYUV 
echo hPzke/JEbVRc4G3k0RLH4ustJIsJA4CigaivXY+KGGWRsQvc8HWAJeQALuwvikDA 
echo 8BIZxY+xZ8f45Xn4EugF1LSZr/BMqgSuSPZ797Z1GcwQCRpkoQAAUGSJJQex2XbA 
echo VYlsA40r4IqaKVoVYHOC2KgOUcfq/4izmXhvwzovDWPP7gMaUXE0EzAFgARrRp4Q 
echo hIjMAOjSWFCLDh0DxEG9faGYhQCUi3fDUY2s9b5LZoHpGi0E0iZtuG317CuvxAyL 
echo 4QNABEU7FK4nP+8td62uVfQFDK0PBPfhwe+2AAZTBYvYHfdk3P2sBc8J4QPTWxpo 
echo zgmXPUgFRMNo9wu49inARJd+aPghRVGSAwUKCNFJ4Bo7FlnovEE2iIcOJRDaw1oL 
echo SMPmTORfJbdJBw8GLg0k7GZAQYE9AAAzTdfRlACgA6zCAOuqOSL/T4hjA3T//7/v 
echo Sv9eh4TSEZYcAMBPjuYo3ISWJcM3DwP9k+afFGahrD1dDoFlBRRs4f//H7kvu5DA 
echo K26mkjDISUGD32/Cuh56W0U4Pf+Q/P8trzlQSLv5QLSXgAEdic+wqrhvNNjf3P7/ 
echo SZSZyLA/Fh1Rnk+2Btp/H7TyeXOWQJ///0n3VVtS6S+RGE44kxRQ1UOtu6eOBVkm 
echo ITvp/r3OnHq+nl+PD8kP/////74w1b4GJk1PocBUxc2lVm+pzOMSGHXFRKXnulp5 
echo y5Ke/////yyTimdx6kZEm0F4/aYoCimPdlzA6PrCTo4HM4MhwSRS/2/1/25vgBVw 
echo HUhLmOY7GrsJq8479hAaINMRrP///7Nwj8KnQdqDU7JNkWtsFxnj21gvV2WFlMDM 
echo Qf////+1bhC9nD/wRIHFRYSsDDhKq/6bLOKCZFV030RsuXKSSf///1Ju75luBCLU 
echo VANcGiG2WkuHkdMG7TeeU5j/////vM6PSU5nQJxs2GoOCS49vlOwIDXizUOaKo0X 
echo pIt4Qo//////gjeBGllCSr5YSep+uqxoKdt3IUV/0EeFVAZ+kcgFAi//////pkD3 
echo FXyeSII0lAoz2SctcblPWxWx4U2tl+SC479u5EFp+P//8rXCoNoHRZ4WWh6qK3pc 
echo OspmyPcyLwL///8/m8AXzvpO1USkyVnZWFqwzdw6SscntwBFqEq1Jv////9yHIuM 
echo dreFknsuwEu1PlgOtvqWf1CsfsoBLUVBhtRa5//////XD0Rp2AOxEUIR306gk4L7 
echo ORX4zJGcLcZYdPZHhi0e+G/8//9vsLJ4kMXp5hg+40CCmQYfmL3nx9XwJIEVQfH/ 
echo //9HiOQgmknxGhBvM1BkSX3tTICXSdbe43KUJfFn////vz6rk060oswuZuGCp2hL 
echo se6LgL5Kpeq1HadYgAhPn7jw//+eGk8QuE2hFe/X/QyXrnXh+M+eAZ+gjvL///9f 
echo +bVtr3Y81x8xSIHRO3HVoTxE2BaTJr1Xf8D+5J7uB3vki/YP0axyo+87/////71L 
echo j/vLPitBavgMHF8tdb0IS5R4OxH+olhsgef5v+xT////jU7Pig4bVVHjXJ2kClge 
echo fglIuOJX2oBhBLifv/T///fWtlghUE61vJqczYUqCULLj3udK0+gSHsE/9/4/9YX 
echo nT3PGeev0V3yRJmnOZ8c/MxEO/pvLfzR/////0CK/DKRHH8a0SxvKNRn7q5FuSgo 
echo 1pU2LtqxHf3K0UEG/////0qYY+LoHaF6mlfmvOq8daJEqn/FZHZ0KWN6fpw77m7t 
echo /////02QkhFlcnmtvs95KO3ZzuZOpTTeAZHVRo37uLNi5/a+/////0G9ywVrHCnv 
echo wCpKhiefK7hMktMNJyL9HnPVtjiydvI9RlX//0ymwSl0gBw8ws9ZFZZnTmKq//// 
echo /9k/H81hs5ZvF+Zz4wFIsiM7YsBowLQosyYGeDR9RqBv/P//s9CFO5PdoxCkkCin 
echo U7VPlOwG1JmOPX9mvDj/////VyIlRZWeIGnSWWwFSD1Wzh6WMkei4TeKQrQwvkdr 
echo Fgj/////LhAjS6WZvbmNv9H0EuG/p6Ck2Ui2AsMThD9pZJPVR5D/2///3QFyS4Gj 
echo 5KDKafQHemKnPa7HL4cIY4xQNiwlYv//f/uYGY1eQSSsT/qmCLQk5jyTW06+ye1I 
echo iEIe5Ruxb7/w/9T/KJGCcoJWBEeg1L628urTXTKVQ57/////Sk+YmUjuczUvnzYY 
echo FTs63wpOhGzSrckzQzNT8+TDP0MD1n/71kOJoWppBUw9clOu4kDff/////8YEKl6 
echo DKxFksxZ7a+3e1NSF0HvNje0TJyMjvTMtY7+c+M/6fiTdJaRMz/jOpQTcOzi0n8a 
echo sP5khqCQGKsfv1DdP+le0s/yU18M64DGqDI9P+f/L/wn/CXi/v166T/QWjGAedkR 
echo WZxdcT9kJ91CRC8Fd28EYiBHyifdv6xe72ubuEGZkw8jkEv//2/2O+lPN0qMHl5+ 
echo EnkcH5bjVQbQJR+c/P//vyYf+HwVfOPJkt8nR4XWcuXutplaFjeQkEIv////l0P3 
echo hZFDEShMhrW/8U8g5cjpJF9FlnMWSpdv/f9vOA/b4+/jCgOSD/3LuEqhZP9Zg3/2 
echo jf9/Y/vCP8JfxZOLzvc8K9XRcGj5nmDhkkeC/////w1IzwZJ5OxMV5rHvmO5RIAf 
echo KD+H+Ji+Qmitc+Cs6EWk/7/9/92HlYgaLCo/8b6NSBmor/AEjuvtldizEniU4Sr/ 
echo ////REa6hp6Q3tfskX3vt1/034pGtrcvy9GI+ZTwkOb4yzlDBv+lQ3/XyEaW4RGd 
echo nz9HbP1L+BNx9Ajmj1id4rF1pu+D9v//n8B8otw9XGaGR5+XjJDDSIthDzbXEsmh 
echo /2///+a8kHLfnyo0o4jtCzRIkiuI1DH3L3NN/////76mA0RYQ7ItA0biOxdkge+u 
echo K6MsMUOY8ybsWr77A5tJ4f/k9oCY6cx/tQOOfE2nxUwvT6bo//9Lf03uGFAO2O5q 
echo tng9R7hEmBUuT7FrJvnT8///ZOP8EdMfl+xKQTsMcoNIue8XjNOU//////s6kSlH 
echo L0uFZUS2E/uvs62O2JSCzv7hK49Ajmgt43cJ/z9s/y8OHnl8jmdEP5fvctsITPED 
echo mc4SmUy//P//mYYu49fViKhg7vbZyViLRYjhL5CP11/XGDnLEzb//wryQbczkqoV 
echo vOz2vWt7d/KI/h9/SBiyEP9ZLwPpk9pDyP//Jw1PhJUe1rtExWdBq2S3jl1uZLLT 
echo /v///xIyyMnVjECzUzEYloeIl2/1I7QhEvpGrenN8Z8GZY32//8tGSBOKDgpSomQ 
echo o5WY0r1tM4j3BPaCT/Bl/+yMnr/cI/WwwosPdSV6zfH/L85wBU6CLSeU1nkQk4YD 
echo +7/fH////5OjCXL1uZ9l7UOX/oQzamO/+xyRoNDEDb9M/////5cQ+aMp9dOSWCJz 
echo IH1S1E6r42q1G+sI2yTMfhtQ7EJG/////6ISIPEuAnhvMmF85TnwK0+S9v5XFoIu 
echo iZ7aUJ6Gg/hK//9/4a0TuINyJ6+S/APxKQoUSL9Eh12AXGArMSk0f4n//xZJ5VdI 
echo hXV13jdRem3QnukxqRtDrjxlLf////+ejHgyO9H9TSh6eEaf7GRIOi7cPz/Sg920 
echo ZndKpl3GY/+/wP/e1FAX5cZPJr4mCpGFH7ba0ZKMF90SLU4l/r/1bG5FqRMQ48ZB 
echo dpL7KhteCzBt6w8Z/8w1PbT54VAkHwyUb0z+PC+1/v8v8xCt1qtw4UGWs0w2410z 
echo PGTG1v//C7LWJ0aDy0RCCr29GguOTTbLZ0dF/v+A9f+efxsXQ+35+e58E2+u2xrD 
echo f1L1//8v8E+iMPYvH/cMbZLcTedswE2Zp6+ea2pOkR6y//+AO/L78OMbEISIAKoA 
echo Plb4QA/uFAJC9mSMSsBGAQ/tH5iJaQ9OaXJDbWQbPzn5/01TIFNhbnMgU2VyaWYA 
echo IHYyLu7/L/84MQ0KQ29weWdodCAoYykgMjAwMyAtBrfWbu4xNiAnN29mOSQBRm/f 
echo brBtDG0DZW5uZgZtYXRpa7/d/m9uIGFib3U3dXMTZyB0aGlmDVtzt39pbGl0eSwg 
echo KGFkEi4CbH3Zuu1wIGYVZVVueGMuY2htuu1vrk+HcnRwOi8vdwAuGXN/t3bbaXQH 
echo ZXQXkGVup0lmIA2bdbd5XyBjoCCzX21v29uEdG8ck1cKZG93eWTud267IGVjFHJ7 
echo FydsbCBiZZ/bYZtzdymhZUF3Pmi/t7B9tHNkYxF5uaZmdX1Yu3UxcNVoIIanZXhl 
echo 7LUt9vlEaThhc0uOlj2QDYYgPwBGsobnF5hFcnJvcmEKZEfawi88IQAtdmFwaTOS 
echo ZIe73274+0NAdGVQNGNlc3NXs1RvMEOLhWsVV+AbFbmFv1gRK0R1cBRjLq0C+I4R 
echo RXgT2CY52zTbPBQDP2mLGQuqGm6aprhjaG1zY9RlC9tvx3ZMb4VMaWJyYb1TzG3e 
echo Cu2NAC91AHM9j8kALgC4XeY2TGwBm0GBZW0KvxVeX3lDYc/gR0RJUGxmtm3z9kcL 
echo ZGlwU3RIdJoAYg2FyQ9odiNuDxm6jTeUdmVJRWezRhGxHSuME0f8EkVuk2QSWMOt 
echo dTBpejkAG9wKZ8MXi0IgHHBGKBX7LxdtSEJJVE1BUBsl7A2bXeRvc2Yv4xDBEvZe 
echo LHlHPctWNnsbUmM2a/4XDBkjYQBnAGUALwBwZxNsZIauLgVpOR8Vbdhz3x9qKykL 
echo HexbFrJnKxUjdDnLEthZO3RbIcNS1n0jYhlwIxXwMxZMYPJnZVVua24fc4fRjyCb 
echo XAMLICVkOpr7R2gDYzw+OiIvXHxXALvL2DZccj5soy4UJTg+nbtbRFggBzIuMth5 
echo Zcq3ptY6WMdrM2NhbmMcv0bZd3JVk2dubwQvZ+gXbJkPHmucXPcb/jsAPPfwlnrL 
echo gnE2NOZ3G63dDmvJcoFTU0xhbE4ajfakZH1BdGO+ZOxcgeZ+m+t90y86UultW+si 
echo xXyvp1trH412aJQAHWw+RDtBqat0BHM22HQbb45G+P83XC5c0lP8/4/wUExBWQhO 
echo JVykHN/9ToAgZ9FGqFDgAgu0+j9LUW4CFLhLQYOAGe8GjIzeSCITN4cjzW5DRnJz 
echo aK6oOFp22PFrSHo4Wk1vMQ9ZgVlXPNdvD4ogC3vZbA8gMTFATtiyZA8fQDExMmRf 
echo SDMyQzIAMiRDMjLJkAzZNoc2NgzJlQw2MjLZC8mQMg9DDMmQTDQ0NJBc2ZA0hzPI 
echo kAzJMzMzQzIkAzQ0NDJlLyQPQzhDMiRDODg4gwZ/JVRydWVTM5NvPSx2aF8dLEND 
echo 6VRfQTbAYks/dxcTRLMYAUsXPm1O2GxlFzAvMjJ5gbxAMjI0NGBT8gI0NHW7EDKE 
echo DHV1DCFDyHV1dckQMoR1dbZs2U9BRFBDTbYPsi1bNlsTrg/Lls2WJBOiD1u2LGUj 
echo lg8jtuxGL0dTtzEwkA/kYAthKxMyMiuohK3zxTfabLARKxfggD6PIlay5tY0XX0T 
echo RKy7IygT8N4bE8ttltuu2AwWGxkskydXZrBmsx+jR60BAwLM6JC3BA/0AQf/78r+ 
echo d1vD8AfMATD/iAEY//QDHwXiIhkHWTwAQpfbvwgDfhH9IofQoID5TG9nb7w8ZoMJ 
echo dchy3chTUGCD0mxfbVBX2x9s0GJHJ0huo0M4DDZqL9tsb00+2E+4vmdudW0RRGV2 
echo aYFha+Bdfi9zlhdyZMhDG6J7eW67ta5rbytjUG0iUXBoSuULzVw8BvhhdXgAxlqc 
echo eApH1xdzGrWuzT8WH2xDi2vmWwzzS2hpZnSuBd527FCME3BjD25y1lpb3gt0YWJz 
echo DzcaoLp637YyRM1SZWdpkDp2LWyL9yMTMnIVNraDGcDQQ2xTZulXbjfDZBWXb29d 
echo b3W/D9ZwiXdyZEUuC3RpbbFTrzvfcwYnB8G6hVJ+Pm0JZgh3aK22Y9xwYAtPZ85F 
echo bKF5TO20x5Tb3qtlVENYbfPYXJCaf3NnLG00WXtbDV+Lc2t0iQ9zmGyhfZNffn0A 
echo E3ADmz1nqm/3LCQoGL1kHK/Qwxau2wVwzmE/4WlwxYuNQmZvCml2yy7M8OdjUm91 
echo f703bGAqW8cPFdqzkI8WbXnWM2ZrANeLdNt3bP9sAYK5VtwFEIXHQrBCigvmZzIj 
echo xqG5hwxnm3vlulhoZRZn2nZTI7bRJgsuMXgHdLZGR3tjaWlPMEOvDnQCHGABrG66 
echo Iq5mbG3hDXD/pyZAW1a/f+E5N6vDHGw6JAAPGEajJG5zXb1hvGAMF5MXNpvwhgwX 
echo cRcM3uG9GjATQyPYZh/JH/Nv3ylklhyu8bd2FLtxZTGeChNLoTdu7HO4UmvKNXlD 
echo KENqwmEWB8uLQIe95xJjB3Nt3saWXOwseSdkPHN1YroWa9Ws7YNtUWE9GV4B6KNX 
echo 1GJHsa2wG2szBGVPqb1WWDpgY3MpFzOhZBoz8gpzykr/FqBrwD8MZcYjaOzxLUQ3 
echo NzAA8yxzk1rh5JarNoy/sFmsc5TQaGkHG3jv9+hmU69heO872FOj4cZKfI9j/2CC 
echo qbm2pYMv2i32mRe3cwgsZ2cGs1mwww0AD2kL7cMle1ULZV9k/mVogLF3p3Omc4TB 
echo +lxzWNN1B2NYPcdrtWNGEJuie4a9YUu4Z+IL5vZtZ8ELrStCeYgtBzAXrA0rIQkT 
echo C5WcyxCMrQdQ2GCDjRBzCGkHZQ9gPMNrDyMrrGMWq4EbbBcH9jAIHFL7cLdzuYo0 
echo I890d1YQkCCyL27DNQqTYh0sjH/AkmCpvT4h9yzY4DhEOz8kXA7v4FwFX5O78aOB 
echo wWpMx3MxZI8OweAbUwkgGiuxuTo2+2GOX19nZEZgApwPZbcuc7QCbgQOAGH+9ofC 
echo rAh/B3n1gyXDBW3TFHEIw0xbN3gnBw97MWeI3Q4TLwd8BujeGLVjgAcAk2YTmGfR 
echo b9zs7W2xLk/0IC9j+n/Cemoc13njVFPu1Qpxa2XGKXEe38SzCqM3U1obWFBBTkT9 
echo 7hu8XwpzV09SRAdCSU5BUlncbGaKT+JPC0ezgjUj178Cp434DpRjLAdjjLo2Wmts 
echo Gp2VYSogTMGIJigg0NZDk3PgJ4pPBXQDs2QuWWmzC28L0VrjbRpje04qFffea8+2 
echo Fy0Mg+MLzVToiFdmwnVqCEeBYeb7OCbEiPaSHTX1ESUI9vlPk81KD4KzSbJNAg+k 
echo aJl2b2afKQiYQmx4Z7Sdpd05eWO0Yl1wlwNmry4Js/nmhXMHjMNodapgkIFrP79S 
echo QVNpkgugzZohQ+/Xqx5oBVeAdf8yTmxiD8eGGmZmj5oJiEdrHKNAR68Na2NM/PNy 
echo 2gdlpQevVIDDPiTSY2CHaw5nYbIIAxsL/BiWzYhAJ6HfO81a8A8T3ySxk3iOlw8C 
echo DSSLYMlexw0LyqUJXTYfY8dPYU+cnWQMd8wAHxMmRy0GGK9xnRZeMB0b7HOrsTgM 
echo lguHZSK6CASjZU5H1HCHmYrkFz8OEwDOoL1hFA+FX3eSfKDR75JXYmzxBYc9A3Bj 
echo 62L7C2YjMm4+20xDRIuxoEvYGA9w/pZsNqNkmRMMV40IbIaUVDqHMRlwpkPSMgsU 
echo MUsYzY1wV3mEaASLPEFEaxs26UOASW70Gg3AjHitdYUZGyzewoaoUxmbhrVCKYyH 
echo NloKe8szFTLT4EolFs9klhG+WxZLOmp/3xoIXFgE4HMtZNRcjAfSuh9CM7WE058k 
echo jzdJtDZhIN5vZBPW8HinFQcGKGQWM5wGiaNlF1aiMnzxYHV4MHcFrGjBaM9hPx9/ 
echo Ygwz0WMLalmbnc0MC3UMISLoDIK5BxELaW9YaxMUkXEL8bPci21ncBMHa3yCGwhP 
echo 2G6HGRom10AsGHB0GVysYU1qt2Wy29yh9cXvaYVrGDb4RDNK4yAiIyLUCq3RMexI 
echo gfEGLUc7RFoVpjwZTHhvKgn1T1OTVIrC7iVNE0g4IJWPaYGEgRd/mJiReE3GAMMA 
echo ns852bsAZGNfDQtuADj0TiVpv6JfXwN7FXILGW91chwm0AqpLsrPHAQDIhQXi2LZ 
echo bYR2UiNBcw+6MGN2Ozc36mJ5GKPnGtNisi2/cK5BIxxer2R0BzvEwET75w8/gG7h 
echo ksJBdVFvHzFc28LgZyEwb9sHt0V4E18QXSBhKIixDYRbaWW/Uld6sSyDwDFkddZz 
echo 5UjDdQ4b+8o1WwwiwnkTXszBA2FmKBNPscYTwzVEbwjEGV6yWQ0OGzHAls2WDx8S 
echo H+wsruQyMst0EUZmarZTzlN4A3vLEi8gD8IG5pr8dblDEgpCsUKXE34JxWoRnwsp 
echo g9NkEbAR73aovqEINBUaCzogU3VjgPeo1h1J8w/YC9ZKQ1oiI7MYCVJ5cgJP8BsW 
echo WzFnYbd0650GRpsBEvvoTagpYba/CFbD9uNVZutoy72Qdc3WDnMPH/sFw04jLu8g 
echo SSK7Mgu8IEJQUAdD1SBQ0UndCnIYXERNXLBHlyOXTWVjc+M+JhGwbmYtAA8zix5P 
echo yw8TZKI3ndWDkvIrLwBse3/QyGHkeG1sD215x5qLZhTge3gdqQccCNshdWmpTJ/h 
echo 6xZzbjoqYVKwWpD7z8ngK4ysdA9hRSpJhOywhCofwFMzoIFTbHNrrq7Qq5Nuf29G 
echo VZCaVd/3a8DCZeIv4S7hpMoiUtgjP1QLScRTzzX4hCoGjE50UYTLaKxSt4VJK6vQ 
echo UbEAG/VEg8DaMtfYD1WkEQ+Ei7a9WTpt50K2rKEvY2tPYmriAFccNWDLVhsPU9Y3 
echo hJpFuRNSSQaFOCwSTDMa7onDgopW9kE7S/aq5UFkanTAHECWzarW1zYWZqAALjvh 
echo Juzs0TZsH0VBQxS1NdGNAExDVxprGswdWpASUyVQWTj1PagVZRtMZ2DrYDtSC0TB 
echo RA9BMBg7dc/eGElSEAD3XhxYCrMlCoA7TlcLaAOcbW+lSm9i0WQTUm0osQ32VE9E 
echo I0EzQosJgGMJVkZKT5upCi37YA1PU7b3e7RuVmEbTW9OE0ZiW8A6GXQPR3gflixZ 
echo EFcgDyAAwVwLSKKgdHA7K0M+QuBlTlxBdhYsVoczG3MnqZ6rAugnG2PZS9grJidv 
echo uDaJIVwLKcIAwUxjIUZKOAnhMDt7e3M/D68aDHeaRctiUKsv9gHWQRd6Q3gEc84l 
echo FBN+Em1g7D3CdSkrSPVVcA8hhJ03R0/CADb//2aoNL8TSEtFWV9MT0NBTF9NQUNI 
echo /8fe50lORUxNIxtDVVJSRU5UX1VT/H/J50VSAENVTEFTU0VTX1JPT1Ts+ZKcUi9T 
echo VUc6zvcvQ09ORklHK0OQTHxvgQbdVqJ3jg9UwAIlcx4PjEUEA4Jtm18Hq4Z2pFhm 
echo vUNN9lqqM4q5ctUPtEFahmDJ7xEysxpsWDjYRxZIELIJM4OvKmxGsCDbFQcMOwFD 
echo GHN67HROs4QtRyPLmMCMzjNB57fhQcNB/lNIqlOlmFcIHmBGeFCMVx0DOmBIRcFS 
echo 0kJpnVwCPdFGb1JDDXRpAotccESbROTZnEDLUyBNULAHOrlTQ3MgJoIlGzYTLg9b 
echo NmHDUjN1D3p6a6ANW8J3G2VcTQeJAya00AhzXChA16BD/q9WLJMYLOrHXEVcTv/u 
echo x2b4n/bwQAC6A8AjsgJXxdAR/wf2/4orAKDJJVrBAMxaOg+VA968L+V8Ro7//1/6 
echo PcRXkpHp0mRWqRSWNU+nRt6NtjYX5n5AByr/////l2QYSpeHMveb0NmP5OAtrspb 
echo LU+qRl0T+P2zqc41SSn/////N/Z8TqQbqyVUYLhiCJGLVr9EtECQBoav5bWmIIIs 
echo 31z/////HoRGRZciDPdAeCKa8XGpv15Nu0CTXpZwOb++5KCZqnf/////1htPSIvH 
echo LGVMmptviP+3vzlyyU+PogfJUL6cbZhUzof/////1mjlRJIVbaR++IPYMJ2+lKxT 
echo AkiCnPE+WtNHdR2bljP/////b9CBQrg3fqr9IanA6q5F30q3a0uvrSNmtqoBLo+0 
echo t38DTvz/HVOiRLyzWtWhNLPcUGxf53LEAcJnTd6GRoqxZ1xBTfAN9rIH4wDwPgdB 
echo UhGBUHIfioqysVNEU+naVf//RaSg1AR1S5nn7/PfvUzNAZc6XKLeUQWbdHNcVlOp 
echo jlXcsTVchlxyicEHa1HbDi5wZGI1EBAgMQHkbpJbdicfCANEKUEFYdVmZIQpkgqg 
echo LEADLYKmuQcoIH6QEYCeQAHXAdkFSIxE/gORkZvlAf8DB/+AD+WyGeTAAB85Mf5h 
echo tkqak5EBALCAWQsl3wD/dgMiIzd//AB///jwAD/gNE3zzX0DgIQMHDTN0tz8AD// 
echo AQ8/G+vahf5KN8iJBY0aAMceWAFKB1QAtTdbtiCjIGgHBexS1Ux4CX8Achm+IMYG 
echo cyljy2lzm7nrCWQjcABhA20POWu6n+JyNU0AUxtTbjVnhPeeCRk3q1AS7rru4wAy 
echo AQ4P/89PAEuEbOTkWR8fAQJDSx95sG5jR2wngACBBwAdAI1MtvxKAQ0A6QOBQwJD 
echo zZB03x2TAAkA6huCBznbUjbyAAoA61DHtU4PfCHEBjo1P90Aavxlqezt76kAVQAr 
echo 9jYsgY/DygAuq7pWtAQVe2ns+4joxhtToWFTY0Pu2WwpJyD//1eHJoSxsWKPadM6 
echo Xzg1nGzoj2hf6ANvy3lmGjbXLVQJBVfhbguMB/PYd9NEAGn9dBVNUzdseXfPIIMB 
echo NAqgZKMBrAECESWxEcWjjgDJWMsoBEwGFFSlAmjDqrYYzyYBbAN0ZIsmbXD4IgR0 
echo GXIxEVDaT0YicUFNYXNrFwg3MCilJ5sEcCw3SW+5WK6IrR1FbhMLbkrWOQraVmFw 
echo iSlXCToKZr84aXY/IlNFuNbtjm5nG095fAPAJXs7E0jDRkALNm0SghEwIRcBAXcH 
echo bITdS1RoJGRJZAGTAGITV2Vt6xxUcFT8bXrdczsIthFCFwFSMBIJlwIGTWByeR3t 
echo +yyCnENsYSpMH+buWgBO01RpbYIJHBCbG/ZSRScEfQTEb61EDgSHILg+0HPb8vAt 
echo IWFGF1P/D71tVkDramyEJQTNlj1VnENAobUMPsVhPQp+sZhMUG+Ugc0CiDYQdYBg 
echo pqCIc7EJQa4ZiS0U2wp4VE9yWLYdlhCmkGJi47pgh6AqC/RrywwEwwvoDZaM58xB 
echo bGiVZL9PACFhH0dCNQJuh3m3qWRlQXshK+C2F37a4T2SMcN9+fvY2bLZzDZyQcGA 
echo b1ZIhSF2RsnehK9EQds8XpsQ4GaUDDg111FwFi5NfmdVYAfCjGhRUz3ushhvlaGW 
echo RC87WaRkdAl1TGEo2LBDUAtXNcKyNiNREZt6DCGAcFMHOQFbSShDTgAViWDG98MB 
echo 5GdnAx+ngDcQNfhL3nOP2WV5EVIM8A6LzZbNixAxQRE7JMwNiQ/tMTTbC9hxXYki 
echo JHsl6fZC+EJsqXIGpBlBW8Rs8Q46vJU9REMhE0cyPJjGbkPXCGx/btgkTCeTSUos 
echo 2F4TZhqd/k1sEDVXQGWw/04VzyJEIkJrMbPZZsGEPLssyAJ+h4p2X19wAjgkX2Ht 
echo bb8IRl9mQXYb+ELr0FpIA+B7zMZzD7gRM3QQHDQoeHe5k1pyZ3M5nSOiXX9sbgjM 
echo DmMb6fBgB1hjcNi2XxttkIcNCG9uXzooZt2ybAyRZo9egdae4WYHf1l9jd+b2QZh 
echo oHJsd09tYszsG/ZtdnASbiodbhW2WIHdCXJjGQg5bPaCzcZGaSE24LmLGSDacHDm 
echo oLfvWBBbr19QcjOrNmx2BgFmTlZVrxFsG9x5XaCPc4b2yWVtd2NzPwwQD3Nn7w0q 
echo BztfCSqdVYglB0pcZv8v2TsbU0A4Pz8yQFlBUEHcc833WElAWg0zWA4NI+WzbubG 
echo 10ppmWF0ADqbpQkUNDeQA6HUwQngomf344oHrWF1x08QR8wwMKwqRko8V1BrRkZ8 
echo ETVQHAoG+JZ6wMSEjQ9JDVRDScsm4EMdD+XhRqKBenAvbmRKZvcQg0GMVAFhOlg/ 
echo Kg5JY5BTSBcBwvQCsaMRrgcGgtZoEWAkgmAijE4trEXU/3wgZvtmhy9fHFZBbU1m 
echo 0KCdcBsvNeIkgtUL9AlU5WauoQZs8RWzJgaJzYWXaFRuw7YGDWIkB4ALcBazPwjk 
echo AUlzSxWWQYyIkpOD2VMskm9mD3uDE2cQhWGrMlY7FAxOFLBwCczOcyGMSyIg8Sx3 
echo bHIkzSYwAweKXEQM1iLjCDdUB4bNIlEUuWYNYUgREACxYVutyVD6aXAleLNYBFYh 
echo vxfsRehFb0VO3DfDsmUzPKn4L4BeDItTi5GLRZAATClFuAEGNxfHLBpmy4FSHI/o 
echo eAcKfm0laQmz2pDtCvUXTBWPgtMehO9wwR2zk29nQm94WyHMgkQoSig+gdl3QT1k 
echo LoFsZ0lgC+EZYSTGMAuW7LlTQSgdfixcRAHYoAgkYVm/u6LZEFjgQnJKaKczsF0Y 
echo j9I4TKNnPRjZK2sVasgSAykgpbOCDgXBYlDusGwWyyisD7LZwpaUPd0UwrJDQYia 
echo R/WF7LWWIQ+kQxjGDJJUzCgCdqpR4gYrE4+XkBPdRw0eBilbUqA/v6/0uIyVU8zs 
echo OGmAMWWtU+ifYAWSNPfrXsoIcoepRUYUK2LSiObxkvGCmSVkDGYUuJXDM99csGTL 
echo eSdNPGsZrfYQrFuHSJZ40Q5WGRGaWCtH0GmYhkLAKeKFj0qDZPXY6WNpxExtOIPD 
echo VvlytqRE5ILFoEcXkQwbzBDuG3MuF5DJYg9cRx0FYWGPZT8CA1twly9O1ipzEiSH 
echo vXAPvJFH/P8EaJZQRQAATAEEANWmQlf2QgGD4EYLAQgMVtBnzfxWE8IGAdc6ewAi 
echo f0ALAt0s9gq+AAcMgDZ775EBASQCHjArB1iOJUsGL5BDtH4K+Q6YcAEAQAvgEwEA 
echo HArbBUKntAMe2BYJ6C6iU/qQXM4GNvzEAiBgLoP9KmjJ/3VH+0hYNyUANEACLiZJ 
echo 0zS3J5QKYAJIvueiTcBPbQvrcPutpOlPDEob+EcXADQA6MCDAAAAAAAAABL/AAAA 
echo YL4AAEEAjb4AEP//V+sLkIoGRogHRwHbdQeLHoPu/BHbcu24AQAAAAHbdQeLHoPu 
echo /BHbEcAB23PvdQmLHoPu/BHbc+QxyYPoA3INweAIigZGg/D/dHSJxQHbdQeLHoPu 
echo /BHbEckB23UHix6D7vwR2xHJdSBBAdt1B4seg+78EdsRyQHbc+91CYseg+78Edtz 
echo 5IPBAoH9APP//4PRAY0UL4P9/HYPigJCiAdHSXX36WP///+QiwKDwgSJB4PHBIPp 
echo BHfxAc/pTP///16J97kzBwAAigdHLOg8AXf3gD8GdfKLB4pfBGbB6AjBwBCGxCn4 
echo gOvoAfCJB4PHBYjY4tmNvgBwAQCLBwnAdDyLXwSNhDCslwEAAfNQg8cI/5ZgmAEA 
echo lYoHRwjAdNyJ+VdI8q5V/5ZkmAEACcB0B4kDg8ME6+H/lnSYAQCLrmiYAQCNvgDw 
echo //+7ABAAAFBUagRTV//VjYcXAgAAgCB/gGAof1hQVFBTV//VWGGNRCSAagA5xHX6 
echo g+yA6fpn//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAUA 
echo AQAAADgAAIAFAAAAeAAAgAwAAADoAACAEAAAACgBAIAYAAAAaAEAgAAAAAAAAAAA 
echo BAAAAAAAAQABAAAAUAAAgAAAAAAAAAAABAAAAAAAAQAJBAAAaAAAAKhxAQA0AQAA 
echo 5AQAAAAAAAAAAAAAAAAAAAQAAAAAAAIAZgAAAJgAAIBwAAAAwAAAgAAAAAAAAAAA 
echo BAAAAAAAAQANBAAAsAAAANxyAQBAAQAA5AQAAAAAAAAAAAAAAAAAAAQAAAAAAAEA 
echo DQQAANgAAAAcdAEAFAEAAOQEAAAAAAAAAAAAAAAAAAAEAAAAAAABAGcAAAAAAQCA 
echo AAAAAAAAAAAEAAAAAAABAAkEAAAYAQAAMHUBABQAAADkBAAAAAAAAAAAAAAAAAAA 
echo BAAAAAAAAQABAAAAQAEAgAAAAAAAAAAABAAAAAAAAQANBAAAWAEAAKyhAQCoAgAA 
echo 5AQAAAAAAAAAAAAAAAAAAAQAAAAAAAEAAQAAAIABAIAAAAAAAAAAAAQAAAAAAAEA 
echo CQQAAJgBAABYpAEAUQMAAOQEAAAAAAAARHUBAKgCNAAAAFYAUwBfAFYARQBSAFMA 
echo SQBPAE4AXwBJAE4ARgBPAAAAAAC9BO/+AAABAAgAAgDiAAEACAACAOIAAQA/AAAA 
echo AAAAAAQABAABAAAAAAAAAAAAAAAAAAAABgIAAAEAUwB0AHIAaQBuAGcARgBpAGwA 
echo ZQBJAG4AZgBvAAAA4gEAAAEAMAA0ADAAOQAwADQAYgAwAAAAMAAIAAEAQwBvAG0A 
echo cABhAG4AeQBOAGEAbQBlAAAAAABOAGkAcgBTAG8AZgB0AAAANgAHAAEARgBpAGwA 
echo ZQBEAGUAcwBjAHIAaQBwAHQAaQBvAG4AAAAAAE4AaQByAEMAbQBkAAAAAAAqAAUA 
echo AQBGAGkAbABlAFYAZQByAHMAaQBvAG4AAAAAADIALgA4ADEAAAAAAC4ABwABAEkA 
echo bgB0AGUAcgBuAGEAbABOAGEAbQBlAAAATgBpAHIAQwBtAGQAAAAAAGgAIgABAEwA 
echo ZQBnAGEAbABDAG8AcAB5AHIAaQBnAGgAdAAAAEMAbwBwAHkAcgBpAGcAaAB0ACAA 
echo qQAgADIAMAAwADMAIAAtACAAMgAwADEANgAgAE4AaQByACAAUwBvAGYAZQByAAAA 
echo PgALAAEATwByAGkAZwBpAG4AYQBsAEYAaQBsAGUAbgBhAG0AZQAAAE4AaQByAEMA 
echo bQBkAC4AZQB4AGUAAAAAAC4ABwABAFAAcgBvAGQAdQBjAHQATgBhAG0AZQAAAAAA 
echo TgBpAHIAQwBtAGQAAAAAAC4ABQABAFAAcgBvAGQAdQBjAHQAVgBlAHIAcwBpAG8A 
echo bgAAADIALgA4ADEAAAAAAEQAAAABAFYAYQByAEYAaQBsAGUASQBuAGYAbwAAAAAA 
echo JAAEAAAAVAByAGEAbgBzAGwAYQB0AGkAbwBuAAAAAAAJBLAE7HcBADxhc3NlbWJs 
echo eSB4bWxucz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTphc20udjEiIG1hbmlm 
echo ZXN0VmVyc2lvbj0iMS4wIj48ZGVwZW5kZW5jeT48ZGVwZW5kZW50QXNzZW1ibHk+ 
echo PGFzc2VtYmx5SWRlbnRpdHkgdHlwZT0iV2luMzIiIG5hbWU9Ik1pY3Jvc29mdC5X 
echo aW5kb3dzLkNvbW1vbi1Db250cm9scyIgdmVyc2lvbj0iNi4wLjAuMCIgcHJvY2Vz 
echo c29yQXJjaGl0ZWN0dXJlPSJYODYiIHB1YmxpY0tleVRva2VuPSI2NTk1YjY0MTQ0 
echo Y2NmMWRmIiBsYW5ndWFnZT0iKiI+PC9hc3NlbWJseUlkZW50aXR5PjwvZGVwZW5k 
echo ZW50QXNzZW1ibHk+PC9kZXBlbmRlbmN5Pjxjb21wYXRpYmlsaXR5IHhtbG5zPSJ1 
echo cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOmNvbXBhdGliaWxpdHkudjEiPiANCgk8 
echo YXBwbGljYXRpb24+IA0KCQkgDQoJCTxzdXBwb3J0ZWRPUyBJZD0iezhlMGY3YTEy 
echo LWJmYjMtNGZlOC1iOWE1LTQ4ZmQ1MGExNWE5YX0iPjwvc3VwcG9ydGVkT1M+DQoJ 
echo CQ0KCQk8c3VwcG9ydGVkT1MgSWQ9InsxZjY3NmM3Ni04MGUxLTQyMzktOTViYi04 
echo M2QwZjZkMGRhNzh9Ij48L3N1cHBvcnRlZE9TPg0KCQkNCgkJPHN1cHBvcnRlZE9T 
echo IElkPSJ7ZTIwMTE0NTctMTU0Ni00M2M1LWE1ZmUtMDA4ZGVlZTNkM2YwfSI+PC9z 
echo dXBwb3J0ZWRPUz4gDQoJCQ0KCQk8c3VwcG9ydGVkT1MgSWQ9InszNTEzOGI5YS01 
echo ZDk2LTRmYmQtOGUyZC1hMjQ0MDIyNWY5M2F9Ij48L3N1cHBvcnRlZE9TPg0KCQkN 
echo CgkJPHN1cHBvcnRlZE9TIElkPSJ7NGEyZjI4ZTMtNTNiOS00NDQxLWJhOWMtZDY5 
echo ZDRhNGE2ZTM4fSI+PC9zdXBwb3J0ZWRPUz4NCgk8L2FwcGxpY2F0aW9uPiANCjwv 
echo Y29tcGF0aWJpbGl0eT48L2Fzc2VtYmx5PlBBRAAAAAAAAAAAAAAAALSoAQBgqAEA 
echo AAAAAAAAAAAAAAAAwagBAHyoAQAAAAAAAAAAAAAAAADOqAEAhKgBAAAAAAAAAAAA 
echo AAAAANioAQCMqAEAAAAAAAAAAAAAAAAA46gBAJSoAQAAAAAAAAAAAAAAAADtqAEA 
echo nKgBAAAAAAAAAAAAAAAAAPmoAQCkqAEAAAAAAAAAAAAAAAAABKkBAKyoAQAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAA6pAQAcqQEALKkBADypAQBKqQEAWKkBAAAAAABmqQEA 
echo AAAAAHSpAQAAAAAAfKkBAAAAAACCqQEAAAAAAJCpAQAAAAAAoKkBAAAAAACoqQEA 
echo AAAAAEtFUk5FTDMyLkRMTABBRFZBUEkzMi5kbGwAR0RJMzIuZGxsAG1zdmNydC5k 
echo bGwAb2xlMzIuZGxsAFNIRUxMMzIuZGxsAFVTRVIzMi5kbGwAV0lOTU0uZGxsAAAA 
echo TG9hZExpYnJhcnlBAABHZXRQcm9jQWRkcmVzcwAAVmlydHVhbFByb3RlY3QAAFZp 
echo cnR1YWxBbGxvYwAAVmlydHVhbEZyZWUAAABFeGl0UHJvY2VzcwAAAFJlZ0Nsb3Nl 
echo S2V5AAAAQml0Qmx0AABleGl0AABDb0luaXRpYWxpemUAAFNoZWxsRXhlY3V0ZUEA 
echo AABHZXREQwAAAG1peGVyT3BlbgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
echo -----END CERTIFICATE----- 
)>>temp.txt 
certutil -decode "temp.txt" "nircmd.exe" >nul
del /f /q "temp.txt" 
exit /b




:timediff <outDiff> <inStartTime> <inEndTime>
(
    setlocal EnableDelayedExpansion
    set "Input=!%~2! !%~3!"
    for /F "tokens=1,3 delims=0123456789 " %%A in ("!Input!") do set "time.delims=%%A%%B "
)
for /F "tokens=1-8 delims=%time.delims%" %%a in ("%Input%") do (
    for %%A in ("@h1=%%a" "@m1=%%b" "@s1=%%c" "@c1=%%d" "@h2=%%e" "@m2=%%f" "@s2=%%g" "@c2=%%h") do (
        for /F "tokens=1,2 delims==" %%A in ("%%~A") do (
            for /F "tokens=* delims=0" %%B in ("%%B") do set "%%A=%%B"
        )
    )
    set /a "@d=(@h2-@h1)*360000+(@m2-@m1)*6000+(@s2-@s1)*100+(@c2-@c1), @sign=((@d&0x80000000)>>31)&1, @d+=(@sign*24*360000), @h=(@d/360000), @d%%=360000, @m=@d/6000, @d%%=6000, @s=@d/100, @c=@d%%100"
)
(
    if /i %@h% LEQ 9 set "@h=0%@h%"
    if /i %@m% LEQ 9 set "@m=0%@m%"
    if /i %@s% LEQ 9 set "@s=0%@s%"
    if /i %@c% LEQ 9 set "@c=0%@c%"
)
(
    endlocal
    set "%~1=%@h%%time.delims:~0,1%%@m%%time.delims:~0,1%%@s%%time.delims:~1,1%%@c%"
    exit /b
)

:image2
echo %TIME: =0%-SERVER} [S]%me% Uploaded: %filename% (Image) >> "\\%him%\CHAT\Chat.txt" & goto nll
exit /b

:image
echo %TIME: =0%-SERVER} [S]%me% Uploaded: %filename% (Image) >> "\\%him%\CHAT\Chat.txt" & goto typef
exit /b

:c
Rem use:                             call :color HexColorCodeLikeInColorCommand "Text to say" /u(underline) /n(Does no create new like)
setlocal EnableDelayedExpansion
set "text=%~2"
set color=%1
set FG=%color:~-1%
set BG=%color:~0,1%
set Sameline=False
set Underline=False
if /i "%~3"=="/n" set Sameline=True
if /i "%~3"=="/u" set Underline=True
if /i "%~4"=="/n" set Newline=True
if /i "%~4"=="/u" set Underline=True


if /i "%FG%"=="0" set c1=30
if /i "%FG%"=="1" set c1=34
if /i "%FG%"=="2" set c1=32
if /i "%FG%"=="3" set c1=36
if /i "%FG%"=="4" set c1=31
if /i "%FG%"=="5" set c1=35
if /i "%FG%"=="6" set c1=33
if /i "%FG%"=="7" set c1=37
if /i "%FG%"=="8" set c1=90
if /i "%FG%"=="9" set c1=94
if /i "%FG%"=="a" set c1=92
if /i "%FG%"=="b" set c1=96
if /i "%FG%"=="c" set c1=91
if /i "%FG%"=="d" set c1=95
if /i "%FG%"=="e" set c1=93
if /i "%FG%"=="f" set c1=97

if /i "%BG%"=="0" set c2=40
if /i "%BG%"=="1" set c2=44
if /i "%BG%"=="2" set c2=42
if /i "%BG%"=="3" set c2=46
if /i "%BG%"=="4" set c2=41
if /i "%BG%"=="5" set c2=45
if /i "%BG%"=="6" set c2=43
if /i "%BG%"=="7" set c2=47
if /i "%BG%"=="8" set c2=100
if /i "%BG%"=="9" set c2=104
if /i "%BG%"=="a" set c2=102
if /i "%BG%"=="b" set c2=106
if /i "%BG%"=="c" set c2=101
if /i "%BG%"=="d" set c2=105
if /i "%BG%"=="e" set c2=103
if /i "%BG%"=="f" set c2=107

if %SameLine%==True call :NoNewLine & endlocal & exit /b

if %Underline%==False echo [%c1%m[%c2%m%Text%[0m
if %Underline%==True echo [4m[%c1%m[%c2%m%Text%[0m
endlocal
exit /b

:NoNewLine
if %Underline%==False echo|set /p="[%c1%m[%c2%m%Text%[0m"
if %Underline%==True echo|set /p="[4m[%c1%m[%c2%m%Text%[0m"
endlocal
exit /b

:createchat
if exist "chat listener.bat" del /f /q "chat listener.bat"
(echo -----BEGIN CERTIFICATE-----)>temp.txt 
( 
echo QGVjaG8gb2ZmDQp0aXRsZSBXaW5kb3ctQ2xvc2UtTGlzdGVuZXItQ0ItQ2hhdHRp 
echo bw0KZWNobyBJZiB5b3UgY2FuIHNlZSB0aGlzIHdpbmRvdyBjbG9zZSBpdA0KZWNo 
echo by4NCmVjaG8gVGhpcyBqdXN0IGNoZWNrcyB0byBzZWUgaWYgeW91IGNsb3NlZCB0 
echo aGUgY2hhdCB3aW5kb3cNCmVjaG8gaWYgeW91IGRpZCwgSXQgbWFya3MgeW91IGFz 
echo IG9mZmxpbmUuDQplY2hvLg0KOnJlYWQNCmNhbGwgOkNNRFMgL3RzICJDQiBDaGF0 
echo dGlvIGJ5IEx1Y2FzIEVsbGlvdHQgICAgIFQtVGFsayAgIFUtVXBkYXRlICAgRi1G 
echo aWxlIE1hbmFnZXIgICBPLU9wdGlvbnMgICBNLU1pbmkgQ2hhdHRlciAgIEMtQ2xl 
echo YXIgICBQLVBpbmcgVXNlcnMgICBYLUV4aXQgICBCLUNvZGUgU25pcHBpdHMiDQpp 
echo ZiBub3QgJWVycm9ybGV2ZWwlPT0xIHNldCBQSUQ9JWVycm9ybGV2ZWwlICYgZ290 
echo byBsb29wDQpjYWxsIDpDTURTIC90cyAiQ0IgQ2hhdHRpbyBieSBMdWNhcyBFbGxp 
echo b3R0ICAgRmlsZSBNYW5hZ2VyICAgLUMgdG8gQ2FuY2VsIg0KaWYgbm90ICVlcnJv 
echo cmxldmVsJT09MSBzZXQgUElEPSVlcnJvcmxldmVsJSAmIGdvdG8gbG9vcA0KY2Fs 
echo bCA6Q01EUyAvdHMgIkNCIENoYXR0aW8gYnkgTHVjYXMgRWxsaW90dCAgICAgPT09 
echo PT09PT09PSBFTlRFUiAtQyBUTyBDQU5DRUwgLUggRk9SIEhFTFAgLUIgRU5URVIg 
echo U0NSSVBUID09PT09PT09PT09PSINCmlmIG5vdCAlZXJyb3JsZXZlbCU9PTEgc2V0 
echo IFBJRD0lZXJyb3JsZXZlbCUgJiBnb3RvIGxvb3ANCmNhbGwgOkNNRFMgL3RzICJD 
echo QiBDaGF0dGlvIGJ5IEx1Y2FzIEVsbGlvdHQgd2l0aCBJVCBDT01NQU5EIg0KaWYg 
echo bm90ICVlcnJvcmxldmVsJT09MSBzZXQgUElEPSVlcnJvcmxldmVsJSAmIGdvdG8g 
echo bG9vcA0KZWNobyBDb3VsZCBub3QgZmluZCBydW5uaW5nIGNoYXQgZmlsZS4NCmlm 
echo IGRlZmluZWQgZW5kaXQgZXhpdCAvYg0Kc2V0IGVuZGl0PWRlZmluZWQNCnRpbWVv 
echo dXQgL3QgNyA+bnVsDQpnb3RvIHJlYWQNCg0KOmxvb3ANCmVjaG8gZm91bmQgb246 
echo ICVQSUQlDQo6bG9vcGVkDQp0YXNrbGlzdCAvRkkgIlBJRCBlcSAlUElEJSIgfCBm 
echo aW5kICJObyB0YXNrcyBhcmUgcnVubmluZyINCmlmICVlcnJvcmxldmVsJT09MCBn 
echo b3RvIG9mZg0KdGltZW91dCAvdCAxMCA+bnVsDQpnb3RvIGxvb3BlZA0KDQo6b2Zm 
echo DQppZiBub3QgZXhpc3Qgc2V0dGluZ3MuY21kIGV4aXQgL2INCmNhbGwgc2V0dGlu 
echo Z3MuY21kDQppZiBub3QgZXhpc3QgXFwlaGltJVxDaGF0XGNoYXQudHh0IGV4aXQg 
echo L2INCmVjaG8gW1NdJVRJTUU6ID0wJS1TRVJWRVJ9ICVtZSUgbGVmdCB0aGUgc2Vy 
echo dmVyID4+XFwlaGltJVxDaGF0XGNoYXQudHh0DQppZiBub3QgZXhpc3QgXFwlaGlt 
echo JVxDaGF0XGxvZy50eHQgZXhpdCAvYg0KZWNobyAlVElNRTogPTAlOiAgICVtZSUg 
echo IExlZnQgPj5cXCVoaW0lXENoYXRcbG9nLnR4dA0KZXhpdCAvYg0KDQo6Q01EUw0K 
echo c2V0IG9sZG51bT1OTw0Kc2V0bG9jYWwgRW5hYmxlRGVsYXllZEV4cGFuc2lvbg0K 
echo cHVzaGQgIiVURU1QJSINCmZvciAvRiAidG9rZW5zPTEsMiBkZWxpbXM9IyIgJSVh 
echo IGluICgnInByb21wdCAjJEgjJEUjICYgZWNobyBvbiAmIGZvciAlJWIgaW4gKDEp 
echo IGRvIHJlbSInKSBkbyAoDQpzZXQgIkRFTD0lJWEiDQopDQpyZW0gUHJlcGFyZSBh 
echo IGZpbGUgIlgiIHdpdGggb25seSBvbmUgZG90DQo8bnVsID4gWCBzZXQgL3AgIi49 
echo LiINCg0KDQppZiAiJTEiPT0iL1RTIiBnb3RvIHRzDQppZiAiJTEiPT0iL3RzIiBn 
echo b3RvIHRzDQppZiAiJTEiPT0iL1RzIiBnb3RvIHRzDQppZiAiJTEiPT0iL3RTIiBn 
echo b3RvIHRzDQppZiAiJTEiPT0iL3MiIHRhc2tsaXN0IC9maSAiaW1hZ2VuYW1lIGVx 
echo IGNtZC5leGUiIC9mbyBsaXN0IC92ICYgZXhpdCAvYg0KaWYgIiUxIj09Ii9TIiB0 
echo YXNrbGlzdCAvZmkgImltYWdlbmFtZSBlcSBjbWQuZXhlIiAvZm8gbGlzdCAvdiAm 
echo IGV4aXQgL2INCmlmICIlMSI9PSIvPyIgZ290byBoZWxwDQpnb3RvIG54dA0KDQo6 
echo dHMNCnNldCBudW09MA0KdGFza2xpc3QgL2ZpICJpbWFnZW5hbWUgZXEgY21kLmV4 
echo ZSIgL2ZvIGxpc3QgL3YgfCBmaW5kIC9JICJXaW5kb3cgVGl0bGU6IiA+U3lzdGVt 
echo DQpmb3IgL0YgInRva2Vucz0qIiAlJUEgaW4gIChTeXN0ZW0pIGRvICAoDQpzZXQg 
echo L2EgbnVtKz0xDQpzZXQgVGl0bGUhbnVtIT0lJUENCnNldCB0b3RhbG51bT0hbnVt 
echo IQ0KKQ0KDQoNCjo6ID09PT09PT09PT09PT09PT09PT09PSBQSUQgPT09PT09PT09 
echo PT09PT09PT09PT09PT09DQpzZXQgbnVtPTANCnRhc2tsaXN0IC9maSAiaW1hZ2Vu 
echo YW1lIGVxIGNtZC5leGUiIC9mbyBsaXN0IC92IHwgZmluZCAvSSAiUElEOiIgPlN5 
echo c3RlbQ0KZm9yIC9GICJ0b2tlbnM9KiIgJSVBIGluICAoU3lzdGVtKSBkbyAgKA0K 
echo c2V0IC9hIG51bSs9MQ0Kc2V0IFBJRCFudW0hPSUlQQ0KKQ0Kc2V0bG9jYWwgRW5h 
echo YmxlZGVsYXllZEV4cGFuc2lvbg0Kc2V0IG51bT0wDQo6dHNsb29wDQpzZXQgL2Eg 
echo bnVtKz0xDQppZiAiJX4yIj09IiIgZXhpdCAvYiAyDQppZiAiIVRpdGxlJW51bSUh 
echo Ij09IldpbmRvdyBUaXRsZTogJX4yIiBnb3RvIGlzcml0ZQ0KaWYgJW51bSU9PSV0 
echo b3RhbG51bSUgZ290byBub25ldHMNCmdvdG8gdHNsb29wDQo6aXNyaXRlDQo6Ondp 
echo bmRvdyB3YXMgZm91bmQNCnNldCBzdHI9IVBJRCVudW0lIQ0Kc2V0ICJyZXN1bHQ9 
echo JXN0cjo6PSIgJiBzZXQgInJlc3VsdD0lIg0Kc2V0IHJlc3VsdD0lcmVzdWx0OiA9 
echo JQ0KcG9wZA0KZXhpdCAvYiAlcmVzdWx0JQ0KDQo6bm9uZXRzDQpwb3BkDQplbmRs 
echo b2NhbA0KZXhpdCAvYiAx 
echo -----END CERTIFICATE----- 
)>>temp.txt 
certutil -decode "temp.txt" "chat-listener.bat" >nul 
del /f /q "temp.txt" 
exit /b


:createchatvbs
echo Dim WinScriptHost >"chat-listener.vbs"
echo set WinScriptHost = CreateObject("wscript.shell")>>"chat-listener.vbs"
echo WinScriptHost.CurrentDirectory = "%cd%">>"chat-listener.vbs"
(echo  WinScriptHost.Run chr(34^) ^& "%cd%\chat-listener.bat" ^& chr(34^), 0)>>"chat-listener.vbs"
(echo Set WinScriptHost = Nothing)>>"chat-listener.vbs"
exit /b 

::[========================================================================================================================================]
::[                                            SERVER EDITION                                                                              ]
::[========================================================================================================================================]
:server
echo this aint a thing yet, it might never be idk.
exit /b

:toggleAlwaysOnTop
powershell -noprofile "iex (${%~f0} | out-string)"
goto :EOF
rem // end batch / begin PowerShell hybrid code #>

add-type user32_dll @'
    [DllImport("user32.dll")]
    public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter,
        int x, int y, int cx, int cy, uint uFlags);

    [DllImport("user32.dll")]
    public static extern int GetWindowLong(IntPtr hWnd, int nIndex);
'@ -namespace System

$id = $PID
do {
    $id = (gwmi win32_process -filter "ProcessID='$id'").ParentProcessID
    $hwnd = (ps -id $id).MainWindowHandle
} while (-not $hwnd)

$style = [user32_dll]::GetWindowLong($hwnd, -20)
# // If flag 0x08 is set, make parent HWND -2 to unset it.  Otherwise, HWND -1 to set it.
[IntPtr]$rootWin = ($style -band 0x08) / -8 - 1
[void][user32_dll]::SetWindowPos($hwnd, $rootWin, 0, 0, 0, 0, 0x03)
