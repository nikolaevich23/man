@echo off 
rem && chcp 65001
setlocal enabledelayedexpansion
if exist pkgi_tunings0.txt del /q pkgi_tunings0.txt

for %%P in (*.pkg) do (
	set sz=%%~zP
	@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
	set /p sha=<sha.tmp
rem	set sha=!sha: =!
 	set pr=%%P
	set pr=!pr:~0,3!
	echo !pr!
	if !pr!==cfw echo CUSTOM-INSTALLER_00-0000000000000000,11,[Theme-CFW] %%~nP,PS3 Theme,,https://github.com/nikolaevich23/man/raw/master/Theme/%%P,!sz!,!sha!>>pkgi_tunings0.txt
	if !pr!==hen echo CUSTOM-INSTALLER_00-0000000000000000,11,[Theme-HEN] %%~nP,PS3 Theme,,https://github.com/nikolaevich23/man/raw/master/Theme/%%P,!sz!,!sha!>>pkgi_tunings0.txt
)

del /q sha.tmp
echo Done. See the result in pkgi_tunings0.txt
echo. & pause
