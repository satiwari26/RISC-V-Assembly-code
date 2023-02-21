.data
Sequence: .word 0 # storing first 25 sequence elements in the series
	  .word 1
	  .word 1
	  .word 2 #each sequence length is 4 bytes and offset address is +-4
	  .word 3
	  .word 5
	  .word 8
	  .word 13
	  .word 21
	  .word 34
	  .word 55
	  .word 89
	  .word 144
	  .word 233
	  .word 377
	  .word 610
	  .word 987
	  .word 1597
	  .word 2584
	  .word 4181
	  .word 6765
	  .word 10946
	  .word 17711
	  .word 28657
	  .word 46368
	  
#algorithm 

.text
la s5, Sequence # addr of seqeunce loaded in s5
li s6,0 # initialize counter to 0
li s7,22 #max value of counter to compare from.
li s11,0x11000020 # addr of LED

loop: lw s8,0(s5) #load the value from the array first element
lw s9,12(s5) #load the 4th element word from the array
sub s10,s9,s8 # s10 = s9-s8
sw s10,0(s11) #store it at LED
addi s6,s6,1 #ccunter = counter+1
addi s5,s5,4 #add +4 to our array address
blt s6,s7,loop

