DATA    SEGMENT
RESULT  DW 0
DATA    ENDS
CODE    SEGMENT
        ASSUME DS:DATA,CS:CODE
MAIN    PROC FAR
        MOV AX,DATA
        MOV DS,AX
        MOV CX,5
        CALL FACT
        CMP CX,10000
        JC BB1
        MOV DL,30H
AA1:    INC DL
        SUB CX,10000
        CMP CX,10000
        JNC AA1
        MOV AH,2
        INT 21H
BB1:    CMP CX,1000
        JC BB2
        MOV DL,30H
AA2:    INC DL
        SUB CX,1000
        CMP CX,1000
        JNC AA2
        MOV AH,2
        INT 21H
BB2:    CMP CX,100
        JC BB3
        MOV DL,30H
AA3:    INC DL
        SUB CX,100
        CMP CX,100
        JNC AA3
        MOV AH,2
        INT 21H
BB3:    CMP CX,10
        JC BB4
        MOV DL,30H
AA4:    INC DL
        SUB CX,10
        CMP CX,10
        JNC AA4
        MOV AH,2
        INT 21H
BB4:    MOV DL,CL
        ADD DL,30H
        MOV AH,2
        INT 21H
        MOV AH,4CH
        INT 21H
FACT    PROC NEAR
        AND CX,0FFH
        MOV AX,0
LOP2:   CALL FANG
        ADD AX,DX
        DEC CX
        CMP CX,0
        JNZ LOP2
        MOV CX,AX
        RET
FACT    ENDP
FANG    PROC NEAR
        PUSH CX
        PUSH AX
        AND CX,0FFH
        MOV AX,1
LOP1:   MUL CX
        DEC CX
        CMP CX,0
        JNZ LOP1
        MOV DX,AX
        POP AX
        POP CX
        RET
FANG    ENDP
MAIN    ENDP
CODE    ENDS
        END MAIN
