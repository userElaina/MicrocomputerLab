WR      MACRO CHA,ATR,NUM
        MOV AH,2
        INT 10H
        MOV AL,CHA
        MOV CX,NUM
        MOV BL,ATR
        MOV AH,9
        INT 10H
        ENDM
CODE    SEGMENT
        ASSUME CS:CODE
MAIN    PROC FAR
CAR:    MOV AH,0
        MOV AL,3
        INT 10H
LOP1:   MOV SI,0A0AH
LOP2:   MOV DX,SI
WR      0DBH,0CH,5
        INC DH
        SUB DL,2
        WR 0DBH,4,9
        INC DH
        INC DL
        WR 09H,8EH,1
        ADD DL,6
        WR 9,8EH,1
        CALL DELAY
        MOV DX,SI
        WR 0,0,5
        INC DH
        SUB DL,2
        WR 0,0,9
        INC DH
        WR 0,0,8
        MOV AH,1
        INT 16H
        JZ CONU
        MOV AH,4CH
        INT 21H
JLOP2:  JMP LOP2
CONU:   INC SI
        CMP SI,0A50H
        JB JLOP2
        JMP LOP1
MAIN    ENDP
DELAY   PROC NEAR
        MOV CX,0FFFFH
        LOOP $
        MOV CX,0FFFFH
        LOOP $
        MOV CX,0FFFFH
        LOOP $
        MOV CX,0FFFFH
        LOOP $
        MOV CX,0FFFFH
        LOOP $
        MOV CX,0FFFFH
        LOOP $
        MOV CX,0FFFFH
        LOOP $
        RET
DELAY   ENDP
CODE    ENDS
        END MAIN
