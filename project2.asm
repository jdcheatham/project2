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

.text #The following is programming
 
#Main #main program is here
main:  	jal input #jumps to user input function
	jal test  #jumps to test input function
	addi $v0,$zero,33 #sets the system call to play a note
	addi $a0,$zero,60 #note to be played
	addi $a1,$zero,500 #duration of the note
	addi $a3,$zero,127 #sets volume to max
	syscall #executes the system call
	j main
	
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
	

