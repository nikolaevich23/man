@echo off 
rem && chcp 65001
setlocal enabledelayedexpansion
del /Q pkgi_tunings0.txt

for %%P in (*.pkg) do (
set sz=%%~zP
@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
set /p sha=<sha.tmp
echo CUSTOM-INSTALLER_00-0000000000000000,11,%%~nP,PS3 Wawe qrc,,https://github.com/nikolaevich23/man/raw/master/Coldboot/%%P,!sz!,!sha! >>pkgi_tunings0.txt
rem CUSTOM-INSTALLER_00-0000000000000000,11,Coldboot PSPx 1,Logo 1 and Sound on loading,,https://github.com/nikolaevich23/man/raw/master/Coldboot/Coldboot%20PSPx%201.pkg,960736,EB601393D3AA4B6DA893843716150168EBB7A4B5543657F74199BA06113320DA
)
del /Q sha.tmp 