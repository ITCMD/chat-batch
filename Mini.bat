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