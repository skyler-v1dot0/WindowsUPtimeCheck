@echo on
setlocal


::Batch script to check uptime

::call :GetUptime
::call :CompareUptime


::GetUptime
For /F "UseBackQ Tokens=1-4" %%A In (
    `Powershell "$OS=GWmi Win32_OperatingSystem;$UP=(Get-Date)-"^
    "($OS.ConvertToDateTime($OS.LastBootUpTime));$DO='d='+$UP.Days+"^
    "' h='+$UP.Hours+' n='+$UP.Minutes+' s='+$UP.Seconds;Echo $DO"`) Do (
    Set "%%A"&Set "%%B"&Set "%%C"&Set "%%D")
::Echo %d%
::pause

::CompareUptime
if %d% GEQ 7 (
	ECHO uptime longer than 7 days
	pause
	exit /b 1
	) ELSE (
	ECHO uptime not longer than 7 days
	pause
	exit /b 0)

::echo error level is %errorlevel%
::PAUSE
::exit /B