li x5, 0x11000000
lw x6, 0(x5)
lhu x7,0(x5) 	#16 left significant bits are stored in x7
srli x6,x6,16 	#shift right 16 bits
sw x6,0(x5)	#save it to the same address
lhu x8,0(x5) 		#store the next 16 bits in the x8 register

beqz x7,equalZero
beqz x8,equalZero

bgeu x7,x8,secondHalfCounter	#if second half is smaller make it counter
#li x10,x7
loop: add x12,x12,x8
addi x7,x7,-1
bnez x7,loop
j end

secondHalfCounter: add x12,x12,x7
addi x8,x8,-1
bnez x8,secondHalfCounter
j end

equalZero: li x12,0x0
j end

end: sw x12,0x40(x5)
