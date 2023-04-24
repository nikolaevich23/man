@echo off 
rem && chcp 65001
setlocal enabledelayedexpansion
if exist pkgi_tunings0.txt del /q pkgi_tunings0.txt

for %%P in (c*.pkg) do (
set sz=%%~zP
@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
set /p sha=<sha.tmp
echo CUSTOM-INSTALLER_00-0000000000000000,11,[WAVE-CFW] %%~nP,PS3 WAVE qrc,,https://github.com/nikolaevich23/man/raw/master/WAVE/%%P,!sz!,!sha!>>pkgi_tunings0.txt
)
del /Q sha.tmp 

for %%P in (p*.pkg) do (
set sz=%%~zP
@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
set /p sha=<sha.tmp
echo CUSTOM-INSTALLER_00-0000000000000000,11,[WAVE-HEN] %%~nP,PS3 WAVE qrc,,https://github.com/nikolaevich23/man/raw/master/WAVE/%%P,!sz!,!sha!>>pkgi_tunings0.txt
)
del /q sha.tmp 

