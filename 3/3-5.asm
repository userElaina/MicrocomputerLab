DSEG    SEGMENT PARA PUBLIC'DSEG'
M       DB 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
P       DB 20 DUP(?)
N       DB 20 DUP(?)
DSEG    ENDS
CODE    SEGMENT
        ASSUME CS:CODE,DS:DSEG
START:  MOV AX,DSEG
        MOV DS,AX
        LEA SI,P
        LEA DI,N
        LEA BX,M
        XOR AX,AX
        XOR DX,DX
        MOV CX,20
L1:     MOV AL,[BX]
        TEST AL,80H
        JZ L2
        MOV [DI],AL
        INC BX
        INC DI
        INC DH
        JMP L3
L2:     MOV [SI],AL
        INC BX
        INC SI
        INC DL
L3:     LOOP L1
        MOV CX,2
L5:     MOV BL,DL
        SHR DL,1
        SHR DL,1
        SHR DL,1
        SHR DL,1
        AND DL,0FH
        CMP DL,10
        JB L4
        ADD DL,7
L4:     ADD DL,30H
        MOV AH,2
        INT 21H
        MOV DL,BL
        AND DL,0FH
        CMP DL,10
        JB L6
        ADD DL,7
L6:     ADD DL,30H
        MOV AH,2
        INT 21H
        MOV DL,0AH
        MOV AH,2
        INT 21H
        MOV DL,0DH
        MOV AH,2
        INT 21H
        MOV DL,DH
        LOOP L5
        MOV AH,4CH
        INT 21H
CODE    ENDS
        END START