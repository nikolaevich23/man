@echo off 
rem && chcp 65001
setlocal enabledelayedexpansion
del /Q pkgi_tunings0.txt

for %%P in (*.pkg) do (
set sz=%%~zP
@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
set /p sha=<sha.tmp
echo CUSTOM-INSTALLER_00-0000000000000000,11,%%~nP,PS3 XMB,,https://github.com/nikolaevich23/man/raw/master/Coldboot/%%P,!sz!,!sha! >>pkgi_tunings0.txt
)
del /Q sha.tmp 