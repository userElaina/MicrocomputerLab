DATA    SEGMENT
ANSI    DB 1BH,"[256F",1BH,"[0J",1BH,"[3;107mA",1BH,"[30mA",1BH,"[31mA",1BH,"[32mA",1BH,"[33mA",1BH,"[34mA",1BH,"[35mA",1BH,"[36mA",1BH,"[90mA",1BH,"[91mA",1BH,"[92mA",1BH,"[93mA",1BH,"[94mA",1BH,"[95mA",1BH,"[96mA",1BH,"[97mA",1BH,"[0m",0AH,"$"
DATA    ENDS
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        MOV AH,9
        MOV DX,OFFSET ANSI
        INT 21H
        MOV AH,4CH
        INT 21H
CODE    ENDS
        END START
