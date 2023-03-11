li x22,0x00006003 # loading address at register 22
lw x23,0(x22) #get the value from this address 

li x24,1 #constant value stored to compare

beq x23,x24,method1

jal method2




################## problem 1 #####################
method1:
li x5, 0x11000000
lw x6,0(x5) # storing value from the address
li x11, 0x11000040 # addr of 7 seg
li x12, 0x11000020 #addr of LEDS

li x10, 3 # loading constant value to x10 #3
li x7,0 #initializing counter to 0

blt x6,x10,small1 # if less than 3 then store numbver as remainder itself

Divide1: sub x8,x6,x10
addi x7,x7,1 # increasing the counter value by 1 everytime it divide
addi x6,x8,0 # store x8 value in x6
bge x8,x10,Divide1 # if x8 is greater than or equal to 3 subtract 3 again

jal val1

small1: addi x8,x6,0 #if number is smaller  remainder is itself

val1:
sw x7,0(x11) #quotient output result to 7 seg

sw x8,0(x12) #remainder output to LEDs

jal end
################## problem 2 #####################

method2:
li x5, 0x11000000
lw x6,0(x5) # storing value 1 from the address
lw x15,0(x5) #loading 2nd value from addr 2

beqz x15,error # if value 2 is 0 flag error 404

li x11, 0x11000040 # addr of 7 seg
li x12, 0x11000020 #addr of LEDS

#li x10, 3 # loading constant value to x10 #3

li x7,0 #initializing counter to 0

blt x6,x15,small2 # if less than 2nd value then store numbver as remainder itself

Divide2: sub x8,	x6,x15
addi x7,x7,1 # increasing the counter value by 1 everytime it divide
addi x6,x8,0 # store x8 value in x6
bge x8,x15,Divide2 # if x8 is greater than or equal to 3 subtract 3 again

jal val2

small2: addi x8,x6,0 #if number is smaller  remainder is itself

val2:
sw x7,0(x11) #quotient output result to 7 seg

sw x8,0(x12) #remainder output to LEDs
jal end

error: li x7, 0x404
sw x7,0x20(x5) #writing error message at the address of seven seg

end:

