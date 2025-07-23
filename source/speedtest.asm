;Simple Speed Tester
.include "io.asm"

_start:

	lda 1000000 
	stc

	ticks
	sta r0
	
mainloop:

	lp mainloop
	
	ticks
	sub r0
	div 60
		
	jsr IO.printNumber


