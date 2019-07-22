SET currentValuesPath=%1
SET changeInterval=%2

@IF [%1] == [] (
    Echo Current values path should not be empty
    GOTO completed
)
@if [%2] == [] (
    Echo Change interval should not be empty
    GOTO completed
)

powershell -executionpolicy bypass -File ./build.ps1 -currentValuesPath %currentValuesPath% -changeInterval %changeInterval%
exit /b %errorlevel%

:completed