;Hello World - Example

;Include System Libraries
.include "io.asm"

_start:
	lda $msg
	jsr IO.printString
	
end:
	brk

;Variables
.file msg, "test.txt"
