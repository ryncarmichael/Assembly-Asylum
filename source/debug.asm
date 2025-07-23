;Debug testing file

	.include "io.asm"
	.include "terminal.asm"

_start:
	
	jsr terminal.resetTerminal
	jsr terminal.clear

	lda true
	jsr terminal.hideCursor

	lda $msg
	jsr IO.printString
	
	jsr IO.printCRLF
	lda true
	jsr terminal.setBoldText
	lda $msg
	jsr IO.printString
	
	jsr IO.printCRLF
	jsr terminal.resetStyles
	lda true
	jsr terminal.setUnderlineText
	lda $msg
	jsr IO.printString
	
	jsr IO.printCRLF
	jsr terminal.resetStyles
	lda true
	jsr terminal.setItalicText
	lda $msg
	jsr IO.printString

	jsr IO.printCRLF
	jsr terminal.resetStyles
	lda true
	jsr terminal.setBlinkingText
	lda $msg
	jsr IO.printString

	jsr IO.printCRLF
	jsr terminal.resetStyles
	lda true
	jsr terminal.setFaintText
	lda $msg
	jsr IO.printString

	jsr IO.printCRLF
	jsr terminal.resetStyles
	lda true
	jsr terminal.setInverseText
	lda $msg
	jsr IO.printString

	jsr IO.printCRLF
	jsr terminal.resetStyles
	lda 255
	rnd
	jsr terminal.setTextColor
	lda $msg
	jsr IO.printString

	jsr IO.printCRLF
	jsr terminal.resetStyles
	lda 255
	rnd
	jsr terminal.setBackGroundColor
	lda $msg
	jsr IO.printString


	jsr IO.printCRLF
	jsr terminal.resetStyles
	lda true
	jsr terminal.setBoldText
	jsr terminal.setUnderlineText
	jsr terminal.setItalicText
	jsr terminal.setBlinkingText
	jsr terminal.setFaintText
	jsr terminal.setInverseText
	lda 255
	rnd
	jsr terminal.setTextColor
	lda $msg
	jsr IO.printString


	lda $msg
	sta b
	jsr IO.printCRLF
	jsr terminal.resetstyles
	lda 0
	stc
	lda 255
	jsr terminal.setTextColor

mainLoop:
	lda 255
	rnd
	jsr terminal.setTextColor
	lda [b] + c
	jz end
	out
	lda c
	inc
	sta c
	jp mainLoop

end:	
	
	jsr terminal.resetstyles
	
charloop:
	lda 40
	rnd
	add 20
	sta x
		
	lda 20
	rnd
	sta y
	jsr terminal.setCursorPosition
	
	lda 64
	rnd
	jsr terminal.settextColor
	
	lda 95
	rnd
	add 31
	out
	
	sleep 5
	
	lda 200
	rnd
	cmp 100
	jz _start
	
	
	jp charloop
		
	
	brk
	
.db msg, "Hello World!"