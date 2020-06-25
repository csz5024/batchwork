@echo off

SETLOCAL

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

:: calls ntrights command to alter local security policies for the user ::
:: to check the results of these commands, run secpol and go to Local Policies->User Rights Assignment to find ::
:: the environment variable username (logged on user) listed under Backup Files and Directories, Debug Programs, :: 
:: and Manage Auditing and Security Log ::
copy %~dp0\ntrights C:\Windows\System32

ntrights +r SeBackupPrivilege -u %USERNAME%
ntrights +r SeDebugPrivilege -u %USERNAME%
ntrights +r SeSecurityPrivilege -u %USERNAME%
echo.
echo ATTENTION: Please restart your system before continuing the installation.
echo.
ENDLOCAL

pause

