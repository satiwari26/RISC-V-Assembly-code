li x5, 0x11000000
lw x6,0(x5) # storing value from the address
li x11, 0x11000040 # addr of 7 seg
li x12, 0x11000020 #addr of LEDS

li x10, 3 # loading constant value to x10 #3
li x7,0 #initializing counter to 0

blt x6,x10,small # if less than 3 then store numbver as remainder itself

Divide: sub x8,	x6,x10
addi x7,x7,1 # increasing the counter value by 1 everytime it divide
addi x6,x8,0 # store x8 value in x6
bge x8,x10,Divide # if x8 is greater than or equal to 3 subtract 3 again

jal val

small: addi x8,x6,0 #if number is smaller  remainder is itself

val:
sw x7,0(x11) #quotient output result to 7 seg

sw x8,0(x12) #remainder output to LEDs