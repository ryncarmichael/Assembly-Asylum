;Fibonacci Test

	.include "io.asm"
	.include "terminal.asm"
	
_start:

	jsr setup

	lda 20 ;Number to calculate
	stc
	
	lda 1 ;Initial settings
	sta b
	lda 0

mainloop:
	jsr IO.printNumber
	jsr IO.printCRLF
	
	add b
	xch a,b
	
	lp mainLoop
	
	brk

setup:
	jsr terminal.clear
	lda true
	jsr terminal.setBoldText
	jsr terminal.setUnderLineText
	lda $msg
	jsr IO.printString
	jsr IO.printCRLF
	jsr terminal.setNormalText
	
	rts

	brk
	
.db msg "Fibonacci Sequence"
	