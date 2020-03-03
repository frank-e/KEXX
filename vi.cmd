@echo off %ECHO% >nul
if :%CMDEXTVERSION% == :  echo %0 requires NT
if :%CMDEXTVERSION% == :  goto DONE
if :%CMDEXTVERSION% == :0 cmd /e:ON /c %0 %*
if :%CMDEXTVERSION% == :0 goto DONE
if     "%2" == "."  goto SKIP
if     "%2" == ".." goto EDIT
if not "%2" == ""   call %0 "%*" .
if not "%2" == ""   goto DONE
if    "%~1" == ""   goto EDIT
if    "%~1" == "/?" goto HELP
if    "%~1" == "."  call %0 DIR ..
if    "%~1" == "."  goto DONE
:SKIP --------- DIR view is special for Kedit ----------
if not exist "%~1"  goto EDIT
call %0 %~sf1 ..
goto DONE
:EDIT --------- if %1 exists it is an 8+3 path ---------
start KEDITW %~1
if not errorlevel 1 goto EXIT
echo %0: start keditw %~1 (rc %errorlevel%)
goto DONE
:HELP --------- explains what is going on here ---------
echo.
echo usage: %~n0 file
echo.
echo starts a text editor converting long to short (8+3)
echo names for existing files.  This allows to associate
echo file types with %~nx0 using old text editors.
echo.
echo To configure %~nx0 edit the path to your favourite
echo 8+3 text editor.  To debug %~nx0 set ECHO=whatever.
echo %~nx0 requires an NT 5.0 (W2K) or better CMD shell.
echo.
goto DONE
:EXIT --------- for temp. file wait until loaded -------
for /L %%I in (1,1,1000) do @echo %%I >nul
if .%ECHO% == . exit
@echo to end %0 debugging SET ECHO=
:DONE (Frank Ellermann, 2008)
