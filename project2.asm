# James Cheatham Project 2
# User selects an integer 0-128, if it's 0-127 selects an instrument, 128 exits the program, anything else produces an error message

# Set up variables for use
.data #The following is to set variables
prompt: .asciiz "Please enter a number between 0 and 128.  128 exits the program." #User input message
error: .asciiz "Error--Please enter a number from 0 to 127 for an instrument, 128 to exit." #User Error Messager
instr: .word 0 #default instrument piano
beat:  .word 150 #length of a beat
loudness: .word 127 #max 127
rest: .word 32 #system call 32 = sleep
C:  .word 60 #the note value for C
D:  .word 62 
E:  .word 64
F:  .word 65
G:  .word 67
A:  .word 69
B:  .word 71
C1:  .word 72
D1:  .word 74
E1:  .word 76
F1:  .word 77
G1:  .word 79
whole: .word 500
dothalf:  375
half:  .word 250
quart: .word 125
play:  .word 33

.text #The following is programming
 
#Main #main program is here
main:  	jal input #jumps to user input function
	jal test  #jumps to test input function
	
#now the music begins
	lw $v0, play#sets the system call to play a note
	addi $a3,$zero,127 #sets volume to max
	lw $a1, dothalf #duration of the note
	lw $a0,E1#Dai
	syscall #executes the system call
	lw $a0,D1#sy
	syscall
	lw $a0,C1#Dai
	syscall
	lw $a0,G#sy
	syscall
	lw $a1, quart
	lw $a0,A#give
	syscall
	lw $a0, B#me
	syscall
	lw $a0, C1#your
	syscall
	lw $a1,half
	lw $a0, A#ans
	syscall
	lw $a1, quart
	lw $a0, C1#wer
	syscall
	lw $a1, whole
	lw $a0, G#Do
	syscall
	lw $a1, dothalf
	lw $a0, D1#I'm
	syscall
	lw $a0, G1#Half
	syscall
	lw $a0, E1#Cra
	syscall
	lw $a0, C1#zy
	syscall
	lw $a1, quart
	lw $a0, A#all
	syscall
	lw $a0, B#for
	syscall
	lw $a0, C1#the
	syscall
	lw $a1, half
	lw $a0, D1#love
	syscall
	lw $a1, quart
	lw $a0, E1#of
	syscall
	lw $a1, whole
	lw $a0, D1#you
	syscall
	lw $a1, quart
	lw $a0, E1#it
	syscall
	lw $a0, F1#won't
	syscall
	lw $a0, E1#be
	syscall
	lw $a0, D1#a
	syscall
	lw $a1, half
	lw $a0, G1#sty
	syscall
	lw $a1, quart
	lw $a0, E1#lish
	syscall
	lw $a0, D1#marr
	syscall
	lw $a1, whole
	lw $a0, C1#iage
	syscall
	lw $a1, quart
	lw $a0, D1#I
	syscall
	lw $a1, half
	lw $a0, E1#can't
	syscall
	lw $a1, quart
	lw $a0, C1#af
	syscall
	lw $a1, half
	lw $a0, A#ford
	syscall
	lw $a1, quart
	lw $a0, C1#a
	syscall
	lw $a0, A#carr
	syscall
	lw $a1, whole
	lw $a0, G#age
	syscall
	lw $a1, quart
	lw $a0, G#but
	syscall
	lw $a1, half
	lw $a0, C1#you'll
	syscall
	lw $a1, quart
	lw $a0, E1#look
	syscall
	lw $a1, half
	lw $a0, D1#sweet
	syscall
	lw $a1, quart
	lw $a0, G#up
	syscall
	lw $a1, half
	lw $a0, C1#on
	syscall
	lw $a1, quart
	lw $a0, E1#the
	syscall
	lw $a0, D1#seat
	syscall
	lw $a0, E1#of
	syscall
	lw $a0, F1#a
	syscall
	lw $a0, G1#bi
	syscall
	lw $a0, E1#cyc
	syscall
	lw $a0, C1#le
	syscall
	lw $a1, half
	lw $a0, D1#built
	syscall
	lw $a1, quart
	lw $a0, G#for
	syscall
	addi $a1, $zero, 750 #gives us the 6 beats to hold the note
	lw $a0, C1#two
	syscall
	
	j main #jumps back to the beginning "main"
	
# Prompt user for a number
input:	addi $v0, $zero,51 #set v0 register for user prompt
	la $a0, prompt #load a0 register with the prompt text
	syscall #executes the prompt, will put user input into a0
	jr $ra #return
	
# Test the input for proper range
test: 	addi $t0, $zero, 128 #sets $t0 to 128 for testing
	beq $a0,$t0,end #if usr input = to 128 go to end of program
	bgt $a0,$t0, wrong #if usr input > 128 let user know they are wrong
	add $a2,$zero,$a0 #set instrument to usr input
	jr $ra #return

#produces error message and sends user back to beginning	
wrong:	la $a0, error #loads a0 register with error message
	syscall #executes the error message
	j test #starts over
	
# Exit program	
end:	addi $v0,$zero, 10 #sets system call to end program gracefully
	syscall #Execustes the system call
	

