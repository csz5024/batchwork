@echo off

set me=%whoami%
set home=%cd%

cd SQLEXPR_x64_ENU
echo %cd%
call SETUP.EXE /Q /IACCEPTSQLSERVERLICENSETERMS /ENU="True" /ROLE="AllFeatures_WithDefaults" /INDICATEPROGRESS="True" /ACTION=INSTALL /FEATURES=SQL,Tools /INSTANCENAME="SQLEXPRESS" /SQLSVCINSTANTFILEINIT="True" /ERRORREPORTING=1 
echo Return Code: %ERRORLEVEL%
IF %ERRORLEVEL%==0 (echo Installation Successful) ELSE (echo ERROR: check return code)
cd ..

echo %cd%
CALL CreateTables.bat
	
