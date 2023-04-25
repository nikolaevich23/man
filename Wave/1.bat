@echo off 
rem && chcp 65001
setlocal enabledelayedexpansion
if exist pkgi_tunings0.txt del /q pkgi_tunings0.txt

for %%P in (cfw_*.pkg) do (
	set sz=%%~zP
	@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
	set /p sha=<sha.tmp
	echo CUSTOM-INSTALLER_00-0000000000000000,11,[Wave-CFW] %%~nP,PS3 Wave qrc,,https://github.com/nikolaevich23/man/raw/master/Wave/%%P,!sz!,!sha!>>pkgi_tunings0.txt
)

for %%P in (hen_*.pkg) do (
	set sz=%%~zP
	@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
	set /p sha=<sha.tmp
	echo CUSTOM-INSTALLER_00-0000000000000000,11,[Wave-HEN] %%~nP,PS3 Wave qrc,,https://github.com/nikolaevich23/man/raw/master/Wave/%%P,!sz!,!sha!>>pkgi_tunings0.txt
)
del /q sha.tmp
echo Done. See the result in pkgi_tunings0.txt
echo. & pause