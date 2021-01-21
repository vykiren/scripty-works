@echo off
netsh interface show interface

echo. Select which Wi-Fi adapter to disable.
echo 1. Disable Wi-Fi 
echo 2. Disable Wi-Fi 2
echo 3. Disable Wi-Fi 3
echo 4. Disable Both Wi-Fi and Wi-Fi 2
echo.
set /p x=Pick:
IF '%x%' == '%x%' GOTO Item_%x%

:Item_1
netsh interface set interface "Wi-Fi" disable
GOTO End
:Item_2
netsh interface set interface "Wi-Fi 2" disable
GOTO End

:Item_3
netsh interface set interface "Wi-Fi 3" disable
GOTO End

:Item_4
netsh interface set interface "Wi-Fi" disable
netsh interface set interface "Wi-Fi 2" disable
GOTO End

:End
netsh interface show interface