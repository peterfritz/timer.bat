:: Copyright (c) 2017-2020 Peter Fritz
::
:: This Source Code Form is subject to the terms of the Mozilla Public
:: License, v. 2.0. If a copy of the MPL was not distributed with this
:: file, You can obtain one at https://mozilla.org/MPL/2.0/.

@echo off
title TheFinalCountdown by Peter Fritz
mode con: cols=80 lines=10
set /A s=1
set /A m=0

::timer
set /P AS=Sound alert? (y/N) 
cls
set /P m=How many minutes? 
cls
set /P s=How many seconds? 
cls
echo Press 'Enter' to start.
pause >nul
cls
:timer
echo %m%m%s%s
if %s%==0 (
set /A m=%m%-1
set /A s=60
)
set /A s=%s%-1
timeout /t 1 /nobreak >nul
cls
if %m%==0 (
if %s%==0 (
goto end
)
)
goto timer

:end
mode con: cols=100 lines=30
if %AS%==y (
START "C:\Program Files\Windows Media Player\wmplayer.exe" siren.mp3
)
if %AS%==Y (
START "C:\Program Files\Windows Media Player\wmplayer.exe" siren.mp3
)
:stroboScreen
color c0
ping localhost -n 1 >nul
color a0
ping localhost -n 1 >nul
goto stroboScreen
