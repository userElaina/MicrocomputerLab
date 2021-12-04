CSEG    SEGMENT
        ASSUME CS:CSEG
START   PROC FAR
        PUSH CS
        POP DS
        MOV AX,351CH
        INT 21H
        MOV CS:WORD PTR OLD1C,BX
        MOV CS:WORD PTR OLD1C+2,ES
        MOV DX,OFFSET INT1C
        MOV AX,251CH
        INT 21H
WAITN:  MOV AH,1
        INT 16H
        JZ WAITN
        MOV AH,0
        INT 16H
        LDS DX,CS:OLD1C
        MOV AX,251CH
        INT 21H
        MOV AH,4CH
        INT 21H
START   ENDP
        OLD1C DD ?
        COUNT DW 0
        HHH DB ?,?,':'
        MMM DB ?,?,':'
        SSS DB ?,?,'$'
INT1C   PROC FAR
        CMP COUNT,0
        JZ NEXT
        DEC COUNT
        IRET
NEXT:   MOV COUNT,18
        STI
        PUSH DS
        PUSH ES
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        PUSH DI
        MOV AH,2
        INT 1AH
        MOV AL,CH
        CALL TTASC
        MOV WORD PTR HHH,AX
        MOV AL,CL
        CALL TTASC
        MOV WORD PTR MMM,AX
        MOV AL,DH
        CALL TTASC
        MOV WORD PTR SSS,AX
        CALL CLS
        MOV BH,0
        MOV DX,0140H
        MOV AH,2
        INT 10H
        PUSH CS
        POP DS
        MOV DX,OFFSET HHH
        MOV AH,9
        INT 21H
        POP DI
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        POP ES
        POP DS
        IRET
INT1C   ENDP
TTASC   PROC
        MOV AH,AL
        AND AL,0FH
        SHR AH,1
        SHR AH,1
        SHR AH,1
        SHR AH,1
        ADD AX,3030H
        XCHG AH,AL
        RET
TTASC   ENDP
CLS     PROC
        MOV AX,0600H
        MOV CX,0
        MOV DX,184FH
        MOV BH,7
        INT 10H
        RET
CLS     ENDP
CSEG    ENDS
        END START