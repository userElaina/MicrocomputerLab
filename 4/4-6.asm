DATA    SEGMENT
COURSE1 DB 70H,88H,92H,90H,99H
        DB 67H,77H,88H,76H,69H
        DB 74H,87H,77H,74H,70H
        DB 99H,97H,94H,98H,96H
NUM1    DW 5 DUP(0)
DATA    ENDS
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        LEA SI,COURSE1
        LEA DI, NUM1
        SUB SI,5
        MOV CL,5
AA1:    MOV BX,SI
        SUB AX,AX
        MOV CH,4
AA2:    ADD BX,5
        ADD AL,[BX]
        DAA
        ADC AH,0
        DEC CH
        JNZ AA2
        MOV [DI],AX
        INC SI
        ADD DI,2
        DEC CL
        JNZ AA1
        MOV AH,4CH
        INT 21H
CODE    ENDS
        END START