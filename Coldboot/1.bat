@echo off 
rem && chcp 65001
setlocal enabledelayedexpansion
if exist pkgi_tunings0.txt del /q pkgi_tunings0.txt

for %%P in (*.pkg) do (
	set sz=%%~zP
	@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
	set /p sha=<sha.tmp
	set sha=!sha: =!
 	set pr=%%P
	set pr=!pr:~0,3!
	if !pr!==cfw echo CUSTOM-INSTALLER_00-0000000000000000,11,[Coldboot-CFW] %%~nP,Logo and Sound on loading,,https://github.com/nikolaevich23/man/raw/master/Coldboot/%%P,!sz!,!sha!>>pkgi_tunings0.txt
	if !pr!==hen echo CUSTOM-INSTALLER_00-0000000000000000,11,[Coldboot-HEN] %%~nP,Logo and Sound on loading,,https://github.com/nikolaevich23/man/raw/master/Coldboot/%%P,!sz!,!sha!>>pkgi_tunings0.txt
)

del /q sha.tmp
echo Done. See the result in pkgi_tunings0.txt
echo. & pause
