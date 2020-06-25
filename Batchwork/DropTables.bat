@echo off

SETLOCAL ENABLEDELAYEDEXPANSION

:: Opens a command window with admin privileges ::
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
	echo Requesting administrative privileges...
	goto UACPrompt
) else (goto gotAdmin)

:UACPrompt
	echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	set params = %*:"="
	echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
	
	"%temp%\getadmin.vbs"
	del "%temp%\getadmin.vbs"
	exit /B

:gotAdmin
	pushd "%CD%"
	CD /D "%~dp0"


echo Success
cd C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA
echo %cd%
del ADVaT_2.0.mdf /f /q
del ADVaT_2.0_log.ldf /f /q


ENDLOCAL

pause




