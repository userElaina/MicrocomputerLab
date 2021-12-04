DATA    SEGMENT
STRING  DB 'ERROR!DIVIDE BY ZERO!',0AH,0DH,'$'
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
MAIN    PROC FAR
        LEA DX,INT0
        MOV AX,CS
        MOV DS,AX
        MOV AL,32
        MOV AH,25H
        INT 21H
        MOV AX,DATA
        MOV DS,AX
        MOV CX,10
        MOV BL,6
A1:     MOV AX,9
        DIV BL
        ADD AL,30H
        MOV DL,AL
        MOV AH,2
        INT 21H
        MOV DL,0DH
        MOV AH,2
        INT 21H
        MOV DL,0AH
        MOV AH,2
        INT 21H
        DEC BL
        CMP BL,0
        JZ A2
        LOOP A1
A3:     MOV AH,4CH
        INT 21H
A2:     INT 32
        LOOP A1
MAIN    ENDP
INT0    PROC FAR
        LEA DX,STRING
        MOV AH,9
        INT 21H
        MOV BL,3
        IRET
INT0    ENDP
CODE    ENDS
        END MAIN
