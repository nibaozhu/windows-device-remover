@echo off
@pnputil /enum-devices /disconnected |findstr /B /C:"ʵ�� ID:" >%TEMP%\devices%RANDOM%.txt
@FOR /f " tokens=3 " %%i IN ('type %TEMP%\devices%RANDOM%.txt') DO @echo "%%i"

@CHOICE /C YNC /M "ȷ���밴 Y�����밴 N������ȡ���밴 C��"

@IF %errorlevel%==1 FOR /f " tokens=3 " %%i IN ('type %TEMP%\devices%RANDOM%.txt') DO @pnputil /remove-device "%%i"
@IF %errorlevel%==2 FOR /f " tokens=3 " %%i IN ('type %TEMP%\devices%RANDOM%.txt') DO @echo �����豸 "%%i"
@IF %errorlevel%==3 pause
