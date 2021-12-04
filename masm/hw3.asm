DATA    SEGMENT
MESG    DB 'Hello world!', 0AH
DATA    ENDS

CODE    SEGMENT
        ASSUME CS: CODE, DS: DATA
BEG:    MOV AX, DATA
        MOV DS, AX
        MOV AH, 9
        MOV DX, OFFSET MESG
        INT 21H
        MOV AH, 4CH
        INT 21H
CODE ENDS
        END BEG
