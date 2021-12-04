print('1BH,"[256F",1BH,"[0J",1BH,"[3;107mA",',end='')
for i in range(30,37):
    print('1BH,"[%dmA",'%i,end='')
for i in range(90,98):
    print('1BH,"[%dmA",'%i,end='')
print('1BH,"[0m",0AH,"$"')
