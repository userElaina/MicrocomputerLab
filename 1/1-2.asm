        MOV DI,1234
        MOV CX,8
        MOV SI,2234
        CLC
Again:  MOV AL,[SI]
        ADC [DI],AL
        INC SI
        INC DI
        LOOP Again
