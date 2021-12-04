DATA    SEGMENT
MATRIX1 DB 3H,4H,15H,8H
        DB 4H,5H,6H,17H
        DB 8H,9H,3H,2H
        DB 1H,1H,4H,6H
MATRIX2 DB 0F3H,0F9H,8H,0E6H
UNIT    DW 4 DUP(0)
DATA    ENDS
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        LEA SI,MATRIX1
        LEA DI,MATRIX2
        LEA BX,UNIT
        MOV CL,4H
AA0:    SUB AX,AX
        MOV CH,4H
AA1:    MOV DX,AX
        MOV AL,[DI]
        MUL BYTE PTR[SI]
        ADD AX,DX
        INC SI
        INC DI
        DEC CH
        JNZ AA1
        LEA DI,MATRIX2
        MOV [BX],AX
        INC BX
        INC BX
        DEC CL
        JNZ AA0
        MOV AH,4CH
        INT 21H
CODE    ENDS
        END START