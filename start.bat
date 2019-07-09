@echo off
echo Starting SQL Script
SETLOCAL ENABLEDELAYEDEXPANSION
cd %cd%

FOR /F "tokens=* USEBACKQ" %%F IN (`hostname`) DO (
	SET hostboi=%%F
)

Rem SET count=1
SET Instance=""
CALL :UpCase hostboi
SET hostboi
FOR /F "tokens=* USEBACKQ skip=2" %%F IN (`sqlcmd -L`) DO (
	Rem SET var!count!=%%F
	Rem SET /a count=!count!+1
	FOR /F "tokens=1,2 delims=\" %%A IN ("%%F") DO (
		Rem echo %%A, %%B
		Rem echo %%A,%hostboi%
		IF %%A == %hostboi% SET Instance=%%B 
	)
)

Rem echo Instance: %Instance%

sqlcmd -S .\%Instance% -i InstallScript.sql

pause
endlocal
GOTO:EOF


:UpCase
:: Subroutine to convert a variable VALUE to all upper case.
:: The argument for this subroutine is the variable NAME.
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