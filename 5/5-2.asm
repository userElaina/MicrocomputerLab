DATA    SEGMENT
ARRAY   DB 13,24,92,42,25,46,75,81,53,10
MA      DB ' MAX = ','$'
MI      DB 0DH,0AH,' MIN = $'
DATA    ENDS
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
MAIN    PROC FAR
        MOV AX,DATA
        MOV DS,AX
        LEA DX,MA
        MOV AH,9
        INT 21H
        LEA BX,ARRAY
        CALL MAX
        CMP DL,10
        JC AA6
        MOV DH,30H
AA5:    INC DH
        SUB DL,10
        CMP DL,10
        JNC AA5
        PUSH DX
        MOV DL,DH
        MOV AH,2
        INT 21H
        POP DX
AA6:    ADD DL,30H
        MOV AH,2
        INT 21H
        LEA DX,MI
        MOV AH,9
        INT 21H
        LEA BX,ARRAY
        CALL MIN
        CMP DL,10
        JC AA8
        MOV DH,30H
AA7:    INC DH
        SUB DL,10
        CMP DL,10
        JNC AA7
        PUSH DX
        MOV DL,DH
        MOV AH,2
        INT 21H
        POP DX
AA8:    ADD DL,30H
        MOV AH,2
        INT 21H
        MOV AH,4CH
        INT 21H
MAX     PROC NEAR
        MOV CX,10
        MOV DL,[BX]
AA1:    MOV DH,[BX]
        CMP DL,DH
        JC AA2
        INC BX
        DEC CX
        CMP CX,0
        JZ OUT1
        JMP AA1
AA2:    MOV DL,DH
        INC BX
        DEC CX
        CMP CX,0
        JZ OUT1
        JMP AA1
OUT1:   RET
MAX     ENDP
MIN     PROC NEAR
        MOV CX,10
        MOV DL,[BX]
AA3:    MOV DH,[BX]
        CMP DL,DH
        JNC AA4
        INC BX
        DEC CX
        CMP CX,0
        JZ OUT2
        JMP AA3
AA4:    MOV DL,DH
        INC BX
        DEC CX
        CMP CX,0
        JZ OUT1
        JMP AA3
OUT2:   RET
MIN     ENDP
MAIN    ENDP
CODE    ENDS
        END MAIN