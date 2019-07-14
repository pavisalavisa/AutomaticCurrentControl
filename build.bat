SET currentValuesPath = %1
SET changeInterval = %2

@if "%currentValuesPath%" == "" (
    Echo Current values path should not be empty
    GOTO completed
)
@if "%changeInterval%" == "" (
    Echo Change interval should not be empty
    GOTO completed
)

powershell -executionpolicy remotesigned -File ./build.ps1 -currentValuesPath %currentValuesPath% -changeInterval %changeInterval%
exit /b %errorlevel%

:completed