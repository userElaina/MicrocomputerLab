DATA    SEGMENT
DD1     DB 35H,78H,85H
DD2     DB ?
DATA    ENDS
CODE    SEGMENT
MAIN    PROC FAR
        ASSUME CS:CODE,DS:DATA
START:  PUSH DS
        SUB AX,AX
        PUSH AX
        MOV AX,DATA
        MOV DS,AX
        MOV AL,DD1
        CMP AL,DD1+1
        JA AAA1
        MOV AL,DD1+1
AAA1:   CMP AL,DD1+2
        JA AAA2
        MOV AL,DD1+2
AAA2:   MOV DD2,AL
        RET
MAIN    ENDP
CODE    ENDS
        END START
