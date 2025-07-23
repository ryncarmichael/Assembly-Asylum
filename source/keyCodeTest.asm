;Key Code tester

	.include "io.asm"
	.include "terminal.asm"
		
_start:

	lda false
	jsr terminal.setLocalEcho
	jsr terminal.clear

mainloop:
	in
	jz skip
	push
	
	cmp 27
	jz end
	
	pop
	sta b
	lda $charmsg
	jsr io.printString
	lda b
	out
	lda $codemsg
	jsr io.printString
	lda b
	jsr io.printNumber
	jsr io.printCRLF

skip:
	hlt
	
	jp mainloop
	
end:
	brk
	
.db charmsg, "Character "
.db codemsg, " Code "