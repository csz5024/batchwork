:: Casey Zduniak ::
:: For comments, see README ::

@echo off
echo Starting SQL Script
SETLOCAL ENABLEDELAYEDEXPANSION
cd %cd%

:: Calls hostname command ::
FOR /F "tokens=* USEBACKQ" %%F IN (`hostname`) DO (
	SET hostboi=%%F
)

SET Instance=""
:: Changes hostname to all uppercase to match SQLServer ::
CALL :UpCase hostboi
SET hostboi
echo Matching SQL instances to your OS...
FOR /F "tokens=* USEBACKQ skip=2" %%F IN (`sqlcmd -L`) DO (
	FOR /F "tokens=1,2 delims=\" %%A IN ("%%F") DO (
		Rem echo %%A, %%B
		Rem echo %%A,%hostboi%
		IF %%A == %hostboi% SET Instance=%%B 
	)
)

echo Instance: %Instance%

echo Searching for SQL Scripts...
for /r %cd% %%a in (*) do if "%%~nxa"=="InstallScript.sql" set p=%%~nxa
	if defined p (
		SET filename=%p%
	) else (
		echo ERROR: InstallScript.sql not found
		SET /p filename="Place the SQL script in the same directory, then enter filename and extension: "
	)
	
for /r %cd% %%a in (*) do if "%%~nxa"=="DropScript.sql" set p=%%~nxa
	if defined p (
		SET filename2=%p%
	) else (
		echo ERROR: DropScript.sql not found
		SET /p filename2="Place the SQL script in the same directory, then enter filename and extension: "
	)	

echo Creating Empty Tables...
sqlcmd -S .\%Instance% -i %filename2%
sqlcmd -S .\%Instance% -i %filename%

pause
endlocal
GOTO:EOF


:UpCase
SET %~1=!%~1:a=A!
SET %~1=!%~1:b=B!
SET %~1=!%~1:c=C!
SET %~1=!%~1:d=D!
SET %~1=!%~1:e=E!
SET %~1=!%~1:f=F!
SET %~1=!%~1:g=G!
SET %~1=!%~1:h=H!
SET %~1=!%~1:i=I!
SET %~1=!%~1:j=J!
SET %~1=!%~1:k=K!
SET %~1=!%~1:l=L!
SET %~1=!%~1:m=M!
SET %~1=!%~1:n=N!
SET %~1=!%~1:o=O!
SET %~1=!%~1:p=P!
SET %~1=!%~1:q=Q!
SET %~1=!%~1:r=R!
SET %~1=!%~1:s=S!
SET %~1=!%~1:t=T!
SET %~1=!%~1:u=U!
SET %~1=!%~1:v=V!
SET %~1=!%~1:w=W!
SET %~1=!%~1:x=X!
SET %~1=!%~1:y=Y!
SET %~1=!%~1:z=Z!
GOTO:EOF