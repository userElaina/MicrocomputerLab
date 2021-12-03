.386

DATA SEGMENT USE16
    MESG DB 'helloworld!', 0AH, '$'
DATA ENDS

CODE SEGMENT USE16
    ASSUME CS: CODE, DS: DATA
    BEG:    MOV AX, DATA
            MOV DS, AX
    LAST:   MOV AH, 9
            MOV DX, OFFSET MESG
            INT 21H
            LOOP LAST
            MOV AH, 4CH
            INT 21H
CODE ENDS

END BEG