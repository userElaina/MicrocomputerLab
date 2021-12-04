DATA    SEGMENT
DATA    ENDS
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AL,'A'
        MOV DX,10H
        MOV BL,0F0H
A1:     PUSH DX
        MOV AH,9
        MOV BH,0
        MOV CX,1
        INT 10H
        MOV AH,3
        MOV BH,0
        INT 10H
        INC DL
        MOV AH,2
        INT 10H
        ADD BL,1
        POP DX
        DEC DX
        JNZ A1
        MOV AH,4CH
        INT 21H
CODE    ENDS
        END START
