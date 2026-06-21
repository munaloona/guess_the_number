@echo off
setlocal
:: defines false_boot to prevent directly opening game.bat (see game.bat line 3)
set "false_boot=0"

:: getting the config...
if exist config.csv (
	for /f "tokens=1-3 delims=," %%A in (config.csv) do (
	set "difficulty[%%~A][min]=%%~B"
	set "difficulty[%%~A][max]=%%~C"
    :: difficulty id, minimum range, maximum range
	)
)

:: now we start the game!
call game.bat

endlocal
exit /b 0