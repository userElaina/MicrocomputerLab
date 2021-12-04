DATA        SEGMENT
ARRAY1      DW 5 DUP(5 DUP(212FH,5A5DH,1234H,7865H))
EOD         DW 0
DATA        ENDS
CODE        SEGMENT
            ASSUME CS:CODE,DS:DATA
MAIN        PROC FAR
            MOV AX,DATA
            MOV DS,AX
            LEA SI,ARRAY1
            MOV CX,(EOD-ARRAY1)/2
            CALL SUB3
            MOV DI,CX
            MOV BX,DATA
            CALL SUB4
            MOV DL,':'
            MOV AH,2
            INT 21H
            MOV BX,SI
            CALL SUB4
            MOV DL,20H
            MOV AH,2
            INT 21H
            MOV BX,DI
            CALL SUB4
            MOV AH,4CH
            INT 21H
SUB3        PROC NEAR
            PUSH AX
            PUSH DI
            MOV DI,SI
            MOV AX,[SI]
AA1:        CMP AX,[SI]
            JNC AA2
            MOV AX,[SI]
            MOV DI,SI
AA2:        ADD SI,2
            LOOP AA1
            MOV SI,DI
            MOV CX,AX
            POP DI
            POP AX
            RET
SUB3        ENDP
SUB4        PROC NEAR
            MOV DL,BH
            MOV CL,4
            SHR DL,CL
            CALL SUB5
            MOV DL,BH
            AND DL,0FH
            CALL SUB5
            MOV DL,BL
            SHR DL,CL
            CALL SUB5
            MOV DL,BL
            AND DL,0FH
            CALL SUB5
            RET
SUB4        ENDP
SUB5        PROC NEAR
            OR DL,30H
            CMP DL,3AH
            JC AA3
            ADD DL,7
AA3:        MOV AH,2
            INT 21H
            RET
SUB5        ENDP
MAIN        ENDP
CODE        ENDS
            END MAIN