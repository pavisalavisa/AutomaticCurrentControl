# Automatic current control
Sets and holds current value for a variable amount of time.
Number of current points is limited by program memory. 
In case of Arduino UNO global variables memory footprint should be <2048 bytes which means there should be <500 float points.
To extend this it would be necessary to load items into EEPROM using AVRdude but is not necessary for now.

## Usage

1. Open CMD and set directory to root of project
2. Create a list of values in a CSV format (just like exampleValues.txt)
3. Execute command: 
```shell
build.bat <path-to-values> <intervalValueInSeconds>, e.g. build.bat C:\Repositories\AutomaticCurrentControl\exampleValues.csv 5
```
4. Open code file contained in the `deployment/automaticCurrentControl` directory with Arduino IDE
5. Transfer code to Arduino
