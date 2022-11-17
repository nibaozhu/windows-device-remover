@echo off
@set id=%RANDOM%
@pnputil /enum-devices /disconnected |findstr /B /C:"实例 ID:" >%TEMP%\devices%id%.txt
@FOR /f " tokens=3 " %%i IN ('type %TEMP%\devices%id%.txt') DO @echo "%%i"

@CHOICE /C YNC /M "确认请按 Y，否请按 N，或者取消请按 C。"

@IF %errorlevel%==1 FOR /f " tokens=3 " %%i IN ('type %TEMP%\devices%id%.txt') DO @pnputil /remove-device "%%i"
@IF %errorlevel%==2 FOR /f " tokens=3 " %%i IN ('type %TEMP%\devices%id%.txt') DO @echo 忽略设备 "%%i"
@IF %errorlevel%==3 pause
