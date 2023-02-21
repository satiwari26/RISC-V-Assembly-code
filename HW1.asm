Addi x9, x0, 0x64
Addi x10, x0, 0x14
Sltiu x5, x9, 0xAA
Slli x5 ,x5 , 0x1F
Sra x6,x5,x10
Xor x7, x6, x9
label: Jal x0 label