***Installation Directions***
	1) Double Click AdminPrivs.bat
	2) Wait for it to finish, then restart your computer
	3) Double Click Install.bat

***Database Details***
	1) ADVaT_2.0
	2) ADVaTUser
	3) ADVaTUser!@#456
	- Schema was generated according to Steve Aiello's instruction.

-------------------------------------------------------------------------------------------------------------------

AdminPrivs.bat: Written by Casey Zduniak
	-Sets necessary OS security permissions for the user so that the installation can proceed.
		-opens a command prompt as administrator,
		-copies the ntrights tool into the System32 folder 
		-Uses the ntrights tool to grant specific security privileges to the %USERNAME% environment variable
			-Privileges are included in lines 32-34.
			-These can also be set manually and observed by running the command "secpol" in a command prompt 
	*restart is required before Install.bat can run successfully.
	-If this program is not run, the SQL installer will encounter an error that states that the user does not have the proper rights to run the installer
		-see important stuff at the bottom for more information.

	~~~Viewing the Code~~~
	-Comments should provide sufficient guidance
	-Lines 5-24 open an elevated command prompt. 
		-these lines can be copy and pasted to any application, and any code following this will be executed in an administrator level command prompt. Can be thought of as a wrapper.
	-Line 30 copies the ntrights tool to windows System32 folder to stage for elevated privileges
	-Lines 32-34 sets privileges for the current user that are needed for the SQLEXPRESS installer. 

--------------------------------------------------------------------------------------------------------------------

CreateTables.bat: Written by Casey Zduniak
	-gathers the SQL hostname and instance name (ex. YELLOWSTONE\SQLEXPRESS) specific to the user that launched the script
		-uses it to execute SQL Scripts that create an empty database for ADVaT with specified schema.
	-DropScript.sql is run automatically, and provides a clean slate for InstallScript.sql to run
	-If the file is not named InstallScript.sql or DropScript.sql respectively, a prompt will appear for the name and extension of the SQL script.
	TROUBLESHOOTING:
		-Sqlcmd: '<input>': Invalid filename.
			-Either the filename was entered incorrectly, or the file was not placed in the same directory as CreateTables.bat 
	
	~~~Viewing the Code~~~
	-Line 6 ENABLEDELAYEDEXPANSION needed for nested for loops
	-Line 10-12 runs the hostname command and sets its return value equal to the hostboi variable
	-Line 16 calls the function UpCase to set the value of hostboi to all uppercase letters. This is a SQLSERVER formality.
	-Lines 19-25 runs the `sqlcmd -L` command to list all of the installed instances of SQL Server. (run sqlcmd -L in a command prompt to see what the output is)
		-nested for loops are used to iterate over the output, in order to match the hostboi variable to one of the hostnames in the output. once a match is found, the instance name variable is set.
		-ASSUMPTIONS: since this will be installed fresh on a JMPS machine, it will be assumed that the first match it finds is the correct one, which should be <hostname>\SQLEXPRESS. If there are multiple instances for the same hostname, ex <hostname>\MYSQLSERVER and <hostname>\SQLEXPRESS, only the first match will be made, rather than the correct one. Multiple instances shouldn't occur on a JMPS machine so theoretically this problem wont exist.
		-if instance name returns blank, SQLEXPRESS must not have installed properly.
	-Lines 29-44 searches for the sql scripts to run, and prompts the user for their filenames if they cant be found.
	-Lines 47 and 48 run the sql scripts.
	-Lines 55-82 are just the UpCase function, see line 16 for implementation. 

---------------------------------------------------------------------------------------------------------------------

DropScript.sql: 
	-(clean slate) just drops any pre-existing ADVaT_2.0 table and ADVaTUser, if they exist.
	-DropTables.bat attempts to do the same thing, but is not used.

----------------------------------------------------------------------------------------------------------------------

Install.bat: Written by Casey Zduniak
	-Executes the SQL Express Installer contained within SQLEXPR_x64_ENU
	-Installation flags are hardcoded within, any custom changes to the installation can be made here.
	-Calls CreateTables.bat after installation is finished.
	
	~~~Viewing the Code~~~
	-Line 8 runs the SETUP.EXE found within the SQLEXPR_x64_ENU installer folder with the specified installation flags
		/Q = Quiet Mode: runs quietly in the background with no gui
		/IACCEPTSQLSERVERLICENSETERMS = Necessary flag that accepts license terms
		/ENU = English: installer is already in english so this is extraneous.
		/ROLE = the type of SQLEXPRESS installation to be run.
		/INDICATEPROGRESS = opens a command prompt in verbose mode, to track the progress of the installation. requires no interaction.
		/ACTION = INSTALL: required
		/FEATURES = SQL, Tools: added features to install, helpful for debugging.
		/INSTANCENAME = "SQLEXPRESS": this is crucial. if you change this string, you will have to go into InstallScript.sql and change the instance name in line 7 and 9 to match as well. This is all unnecessary so to avoid confusion, best not to change this parameter.
		/SQLSVCINSTANTFILEINIT = "True": required
		/ERRORREPORTING = 1: reports any errors that occur during installation
	-Line 9,10 reports any errors in the command prompt that occur during installation. It would be up to the user to diagnose these errors, which should be rare in frequency.
	-Line 14 continues the script by calling CreateTables.bat once the installer is finished.

----------------------------------------------------------------------------------------------------------------------

InstallScript.sql: Written by Tommy Dalrymple
	-SQLEXPRESS is hard coded in line 7 and 9, must be updated if instance name is different.
		-Instance name can be retrieved from Install.bat
		***(07/23/19)-Distregard, the installer will never change, so the instance name will never be different. In theory, as long as there is no tampering, the instance name will always be SQLEXPRESS.
	-Creates empty Advat DB and an ADVaTUser with schema specified within the script.
	-Line 11 sets the compatibility level; 140 represents SQL SERVER 2014. For whatever reason you need to change this, just match the first two digits to the last two of the specified year, ex 120 is SQL SERVER 2012.
	-Line 18 creates the ADVaTUser within the database. CHECK_POLICY=OFF bypasses the operating system password requirements, since the username and password are too similar in this case.
	-For further inquiries, refer to Tommy Dalrymple

-----------------------------------------------------------------------------------------------------------------------

SQLEXPR_x64_ENU: Written by Microsoft
	-Standalone installer for SQL Server Express 2017
	-Double click SETUP.EXE to run normally

-----------------------------------------------------------------------------------------------------------------------

ntrights: Written by SS64.com
	-used by AdminPrivs.bat to set user account privileges

-----------------------------------------------------------------------------------------------------------------------


***IMPORTANT STUFF***

On JMPS machine, if install fails for "user rights"
	-https://support.microsoft.com/en-us/help/2000257/sql-server-installation-fail-if-setup-account-not-have-some-user-right
