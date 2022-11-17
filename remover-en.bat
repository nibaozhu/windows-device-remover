@echo off
@set id=%RANDOM%
@pnputil /enum-devices /disconnected |findstr /B /C:"Instance ID:" >%TEMP%\devices%id%.txt
@FOR /f " tokens=3 " %%i IN ('type %TEMP%\devices%id%.txt') DO @echo "%%i"

@CHOICE /C YNC /M "Press Y for Yes, N for No or C for Cancel."

@IF %errorlevel%==1 FOR /f " tokens=3 " %%i IN ('type %TEMP%\devices%id%.txt') DO @pnputil /remove-device "%%i"
@IF %errorlevel%==2 FOR /f " tokens=3 " %%i IN ('type %TEMP%\devices%id%.txt') DO @echo Ignore "%%i"
@IF %errorlevel%==3 pause
