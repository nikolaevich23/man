@echo off 
rem && chcp 65001
setlocal enabledelayedexpansion
del /Q pkgi.txt 

for %%P in (*.pkg) do (
set sz=%%~zP
D:\PSPX\MPHT\tools\sfk partcopy %%~P 0x030 0x024 cid.txt -yes >nul
set /p cid=<cid.txt
@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
set /p sha=<sha.tmp
echo !cid!,10,%%~nP,PS3 Soft,,https://github.com/nikolaevich23/man/raw/master/soft/%%P,!sz!,!sha! >>pkgi.txt
)
del /Q sha.tmp cid.txt