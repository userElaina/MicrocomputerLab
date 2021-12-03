@REM code by hyper
@REM edit by userElaina

set /p file="Enter file name: "

set CC=masm.exe
set LD=link.exe

echo _compile_
%CC% %file%.asm

echo _link_
%LD% %file%.obj

echo _execute_
%file%.exe
pause
