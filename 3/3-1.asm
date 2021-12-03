DATA    SEGMENT
XX1     DB 10
YY1     DB ?
DATA    ENDS
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        MOV AL,XX1
        CMP AL,0
        JZ AA1
        JNS AA2
        MOV AL,0FFH
        JMP AA1
AA2:    MOV AL,1
AA1:    MOV YY1,AL
        MOV AH,4CH
        INT 21H
CODE    ENDS
        END START
