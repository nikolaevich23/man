@echo off 
setlocal enabledelayedexpansion
set tl=D:\PSPX\MPHT\tools\
del /Q pkgi.txt 

for %%P in (*.pkg) do (
set sz=%%~zP
!tl!sfk partcopy %%~P 0x030 0x024 cid.txt -yes >nul
!tl!PS3P_PKG_Ripper -o . -a .SFO %%P
!tl!sfk partcopy PARAM.SFO 0x0378 0x027 titl.txt -yes >nul
set /p cid=<cid.txt
set /p tname=<titl.txt
@CertUtil -hashfile "%%P" SHA256| findstr/v : >sha.tmp
set /p sha=<sha.tmp
echo !cid!,10,%%~nP,!tname!,,https://github.com/nikolaevich23/man/raw/master/soft/%%P,!sz!,!sha! >>pkgi.txt
)
del /Q sha.tmp cid.txt titl.txt PARAM.SFO
