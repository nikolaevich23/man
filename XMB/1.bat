@echo off 
rem && chcp 65001
setlocal enabledelayedexpansion
if exist pkgi_tunings0.txt del /q pkgi_tunings0.txt

for %%P in (*.pkg) do (
set sz=%%~zP
@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
set /p sha=<sha.tmp
set sha=!sha: =!
echo CUSTOM-INSTALLER_00-0000000000000000,11,[XMB-HEN] %%~nP,PS3 XMB,,https://github.com/nikolaevich23/man/raw/master/XMB/%%P,!sz!,!sha!>>pkgi_tunings0.txt
)
del /q sha.tmp
echo Done. See the result in pkgi_tunings0.txt
echo. & pause
