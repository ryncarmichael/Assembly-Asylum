;Testing file for printing coloured text
	
	.include "io.asm"
	.include "terminal.asm"

_start:
	


mainLoop:

	lda 255
	rnd
	jsr Terminal.setTextColor
	
	lda 95
	rnd
	add 31
	out

	jp mainloop
	 
	
		

	