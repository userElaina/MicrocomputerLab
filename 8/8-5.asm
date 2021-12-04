DATA    SEGMENT
MESG    DB 0AH,'2021-12-04 15:46',0AH,'$'
DATA    ENDS

CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,0600H
        MOV CX,0
        MOV DX,184FH
        MOV BH,7
        INT 10H
        MOV AX,DATA
        MOV DS,AX
        MOV AH,9
        MOV DX,OFFSET MESG
        INT 21H
QWQ:    JMP QWQ
CODE    ENDS
        END START
