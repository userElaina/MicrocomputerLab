DATA    SEGMENT
NOTIC   DB "Please input the word!",0AH,0DH
DATA    ENDS
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        MOV CX,19H
        LEA BX,[NOTIC]
AA0:    MOV DL,[BX]
        MOV AH,2
        INT 21H
        INC BX
        LOOP AA0
AA1:    MOV AH,1
        INT 21H
        CMP AL,1BH
        JZ AA3
        CMP AL,61H
        JS AA2
        CMP AL,7AH
        JNS AA2
        SUB AL,20H
AA2:    MOV DL,AL
        MOV AH,2
        INT 21H
        LOOP AA1
AA3:    MOV AH,4CH
        INT 21H
CODE    ENDS
        END START