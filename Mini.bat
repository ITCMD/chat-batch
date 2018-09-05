<# : AlwaysOnTop2.bat -- http://stackoverflow.com/a/37912693/1683264
@echo off
@mode con: cols=80lines=10
setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
if not exist C:\users\Public\chat md C:\users\Public\chat
::call :c 0b "^!<>&| abc123 %%%%"*?"
rem Prepare a file "X" with only one dot
<nul > X set /p ".=."
if not exist settings.cmd call :c 0c "Not in Same Path as Chat.bat Must be in same running directory." & pause & exit
cls
set color=07
call settings.cmd
cmdwiz setwindowtransparency 15
color %color%
:type	
setlocal enableextensions enabledelayedexpansion
for /F "tokens=*" %%A in (\\%him%\CHAT\chat.txt) do (
    set "line=%%A"
	if "!line!" equ "!line:[=!" set line=%TextColor% "!line!"
    if "!line!" neq "!line:[B]=!" set line=%BoldColor% "!line:[B]=!"
    if "!line!" neq "!line:[S]=!" set line=%systemColor% "!line:[S]=!"
	if "!line!" neq "!line:[U]=!" set line=%TextColor% "!line:[U]=!" /u
	if "!line!" neq "!line:[D]=!" set line=08 "!line:[D]=!"
    call :c !line!
)
Endlocal
copy /Y "\\%him%\CHAT\Chat.txt" "C:\Users\Public\chat\Localchatm.txt" >nul
set "Start=%TIME%"
goto wait
:wait
Title Min CB Chattio by Lucas Elliott. Press T to open main chat. Y to toggle AOT
choice /c "QTY" /n /d "Q" /t "10" >nul
if %errorlevel%==1 goto refresh
if %errorlevel%==2 start "" "chat.bat" & exit
if %errorlevel%==3 goto ontop

:ontop
cls
echo Loading the Always On Top Function...
echo this may take a few seconds . . .
setlocal
call :toggleAlwaysOnTop
cls
goto type
:refresh
if %forcerefresh%==Yes goto forcer
fc C:\Users\Public\chat\Localchatm.txt \\%him%\CHAT\chat.txt >nul
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
lc "C:\Users\Public\chat\Localchatm.txt" "\\%him%\CHAT\Chat.txt"
set /p sts=<new.txt
if "%sts%"=="" goto type
setlocal enableextensions enabledelayedexpansion
for /F "tokens=*" %%A in (New.txt) do (
	    set "line=%%A"
	if "!line!" equ "!line:[=!" set line=%TextColor% "!line!"
    if "!line!" neq "!line:[B]=!" set line=%BoldColor% "!line:[B]=!"
    if "!line!" neq "!line:[S]=!" set line=%systemColor% "!line:[S]=!"
	if "!line!" neq "!line:[U]=!" set line=%TextColor% "!line:[U]=!" /u
	if "!line!" neq "!line:[D]=!" set line=08 "!line:[D]=!"
    call :c !line!
)
endlocal
copy /Y "\\%him%\CHAT\chat.txt" "C:\users\Public\chat\Localchatm.txt" >nul
if not exist C:\users\Public\Chat\Mute cmdwiz playsound tick.wav
goto wait



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
setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
if not exist C:\users\Public\chat md C:\users\Public\chat
::call :c 0b "^!<>&| abc123 %%%%"*?"
rem Prepare a file "X" with only one dot
<nul > X set /p ".=."
if not exist settings.cmd call :c 0c "Not in Same Path as Chat.bat Must be in same running directory." & pause & exit
cls
set color=07
call settings.cmd
cmdwiz setwindowtransparency 15
color %color%
:type	
setlocal enableextensions enabledelayedexpansion
for /F "tokens=*" %%A in (\\%him%\CHAT\chat.txt) do (
    set "line=%%A"
	if "!line!" equ "!line:[=!" set line=0a "!line!"
    if "!line!" neq "!line:[B]=!" set line=0e "!line:[B]=!"
    if "!line!" neq "!line:[S]=!" set line=0b "!line:[S]=!"
    call :c !line!
)
Endlocal
copy /Y "\\%him%\CHAT\Chat.txt" "C:\Users\Public\chat\Localchatm.txt" >nul
set "Start=%TIME%"
goto wait
:wait
Title Min CB Chattio by Lucas Elliott. Press T to open main chat. Y to toggle AOT
choice /c "QTY" /n /d "Q" /t "10" >nul
if %errorlevel%==1 goto refresh
if %errorlevel%==2 start "" "chat.bat" & exit
if %errorlevel%==3 goto ontop

:ontop
cls
echo Loading the Always On Top Function...
echo this may take a few seconds . . .
setlocal
call :toggleAlwaysOnTop
cls
goto type
:refresh
if %forcerefresh%==Yes goto forcer
fc C:\Users\Public\chat\Localchatm.txt \\%him%\CHAT\chat.txt >nul
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
lc "C:\Users\Public\chat\Localchatm.txt" "\\%him%\CHAT\Chat.txt"
set /p sts=<new.txt
if "%sts%"=="" goto type
setlocal enableextensions enabledelayedexpansion
for /F "tokens=*" %%A in (New.txt) do (
	    set "line=%%A"
	if "!line!" equ "!line:[=!" set line=0a "!line!"
    if "!line!" neq "!line:[B]=!" set line=0e "!line:[B]=!"
    if "!line!" neq "!line:[S]=!" set line=0b "!line:[S]=!"
    call :c !line!
)
endlocal
copy /Y "\\%him%\CHAT\chat.txt" "C:\users\Public\chat\Localchatm.txt" >nul
if not exist C:\users\Public\Chat\Mute cmdwiz playsound tick.wav
goto wait



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
:c
set "param=^%~2" !
set "param=!param:"=\"!"
findstr /p /A:%1 "." "!param!\..\X" nul
<nul set /p ".=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
if /i not "%3"=="/n" echo.
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
