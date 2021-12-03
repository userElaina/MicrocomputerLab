DATA    SEGMENT
DIGIT   DB "DIGIT",0AH,0DH
UPPER  DB "UPPER",0AH,0DH
LOWER  DB "LOWER",0AH,0DH
OTHER   DB "OTHER",0AH,0DH
DATA    ENDS
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        MOV AH,07
        INT 21H
        CMP AL,30H
        JB AA1
        CMP AL,39H
        JA AA1
        MOV CX,7
        LEA SI,DIGIT
AA0:    MOV DL,[SI]
        MOV AH,2
        INT 21H
        INC SI
        LOOP AA0
        JMP BB
AA1:    CMP AL,41H
        JB AA3
        CMP AL,5AH
        JA AA2
        LEA SI,UPPER
        MOV CX,8
AA4:    MOV DL,[SI]
        MOV AH,2
        INT 21H
        INC SI
        LOOP AA4
        JMP BB
AA2:    CMP AL,61H
        JB AA3
        CMP AL,7AH
        JA AA3
        LEA SI,LOWER
        MOV CX,8
AA5:    MOV DL,[SI]
        MOV AH,2
        INT 21H
        INC SI
        LOOP AA5
        JMP BB
AA3:    LEA SI,OTHER
        MOV CX,7
AA6:    MOV DL,[SI]
        MOV AH,2
        INT 21H
        INC SI
        LOOP AA6
BB:     MOV AH,4CH
        INT 21H
CODE    ENDS
        END START