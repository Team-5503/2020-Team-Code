cd C:\
cls
@echo off
set /p FILEPATH="Path to upload file(s) to GitHub: " 
cd %FILEPATH%


set /p COMMITMSG="Commit message: " 
cls

echo Uploading files from %FILEPATH%
echo and adding a commit message of "%COMMITMSG%"
ping -n 4 127.0.0.1>nul

cls
ECHO (Remember, this is case-sensitive!)
set /p BRANCH=Which branch would you like to upload the files to? 

git checkout %BRANCH%
ECHO Adding files to %BRANCH% branch...
ping -n 2 127.0.0.1>nul
cls

ECHO This will add all the files in the current directory!
CHOICE /C YN /M "Are you sure you want to continue? "

IF ERRORLEVEL ==1 goto Yes
IF ERRORLEVEL ==2 goto No

:Yes
ping -n 2 127.0.0.1>nul
cls
ECHO Uploading files to repository...
git add *
git commit -m %COMMITMSG%
git push -u origin %BRANCH%
ping -n 2 127.0.0.1>nul
cls
ECHO Added files successfully.
ping -n 4 127.0.0.1>nul
exit

:No
ping -n 2 127.0.0.1>nul
cls
ECHO Cancelled, exiting...
ping -n 3 127.0.0.1>nul
exit






