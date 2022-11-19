@echo off 
rem && chcp 65001
setlocal enabledelayedexpansion
del /Q pkgi_tunings0.txt

for %%P in (c*.pkg) do (
set sz=%%~zP
@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
set /p sha=<sha.tmp
echo CUSTOM-INSTALLER_00-0000000000000000,11,[CFW-WAWE] %%~nP,PS3 Wawe qrc,,https://github.com/nikolaevich23/man/raw/master/wawe/%%P,!sz!,!sha! >>pkgi_tunings0.txt
)
del /Q sha.tmp 

for %%P in (p*.pkg) do (
set sz=%%~zP
@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
set /p sha=<sha.tmp
echo CUSTOM-INSTALLER_00-0000000000000000,11,[HEN-WAWE] %%~nP,PS3 Wawe qrc,,https://github.com/nikolaevich23/man/raw/master/wawe/%%P,!sz!,!sha! >>pkgi_tunings0.txt
)
del /Q sha.tmp 

