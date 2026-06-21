@echo off
setlocal enabledelayedexpansion

:: dont open game.bat :c
if not defined false_boot (
    echo please open 'main.bat' to play.
    exit /b 0
)

goto selection

:invalid
echo.
echo.invalid selection.
echo.
goto selection
exit 0

:die
echo.
echo.you failed!
echo.try again? (y/n)
set /p "select=> "

if "%select%" == "y" goto selection
if "%select%" == "n" exit 0
echo. you can fuck off then
pause
exit 0

:selection
set "guesses=6"
echo.
echo. \ select a difficulty! /
echo.
echo. 1. easy (1-10)
echo. 2. medium (1-20)
echo. 3. hard (1-50)
echo. 4. extreme (1-100)
echo.
set /p "select=> "

:: validate
if "%select%" lss "1" goto invalid
if "%select%" gtr "4" goto invalid

:: generate number
set /a "num=(%RANDOM% %% (difficulty[%select%][max] - difficulty[%select%][min] + 1)) + difficulty[%select%][min]"

:: what language doesnt have a while loop :skull:
:while
set /a "guesses-=1"
if !guesses! leq 0 goto die
if not "!guess!"=="%num%" (
    echo you have !guesses! guesses!
    set /p "guess=> "
    goto while
)

:won
echo.
echo. you won!
echo. go again? (y/n)
echo.
set /p "select=> "

if "%select%" == "y" goto selection
if "%select%" == "n" exit 0
echo.
echo. you can fuck off then
pause
exit 0

endlocal
exit /b 0