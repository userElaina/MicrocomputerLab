DATA    SEGMENT
NUMBER1 DB 8 DUP(0)
NUMBER2 DB 8 DUP(0)
NUMBER3 DB 9 DUP(0)
DATA    ENDS
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
MAIN    PROC FAR
        MOV AX,DATA
        MOV DS,AX
        CALL SUB1
        POP CX
        LEA BX,NUMBER1
AA3:    POP AX
        MOV [BX],AL
        INC BX
        LOOP AA3
        MOV AH,3
        INT 10H
        MOV AH,2
        MOV DL,8
        INT 10H
        MOV DL,2BH
        MOV AH,2
        INT 21H
        CALL SUB1
        POP CX
        LEA BX,NUMBER2
AA4:    POP AX
        MOV [BX],AL
        INC BX
        LOOP AA4
        MOV AH,3
        INT 10H
        MOV AH,2
        MOV DL,17
        INT 10H
        MOV DL,3DH
        MOV AH,2
        INT 21H
        LEA SI,NUMBER1
        LEA DI,NUMBER2
        LEA BX,NUMBER3
        SUB CX,CX
        MOV CX,8
AA5:    MOV AL,[SI]
        ADC AL,[DI]
        AAA
        MOV [BX],AX
        INC SI
        INC DI
        INC BX
        LOOP AA5
        ADC CL,CL
        MOV [BX],CL
        LEA AX,NUMBER3+8
        PUSH AX
        CALL SUB2
        MOV CX,16
        LEA BX,NUMBER1
        XOR AL,AL
QQQ2:   MOV [BX],AL
        INC BX
        LOOP QQQ2
        MOV AH,4CH
        INT 21H
SUB1    PROC NEAR
        POP BX
        SUB CX,CX
AA1:    MOV AH,1
        INT 21H
        CMP AL,30H
        JC AA2
        CMP AL,3AH
        JNC AA2
        INC CX
        PUSH AX
        JMP AA1
AA2:    PUSH CX
        PUSH BX
        RET
SUB1    ENDP
SUB2    PROC NEAR
        POP AX
        POP BX
        PUSH AX
        MOV CX,9
AA7:    MOV AL,[BX]
        CMP AL,0
        JNZ AA6
        DEC CX
        DEC BX
        JMP AA7
AA6:    MOV DL,[BX]
        ADD DL,30H
        MOV AH,2
        INT 21H
        DEC BX
        LOOP AA6
        RET
SUB2    ENDP
MAIN    ENDP
CODE    ENDS
        END MAIN
