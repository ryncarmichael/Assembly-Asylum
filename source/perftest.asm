	.include "terminal.asm"

_start:

	jsr Terminal.clear
	lda true
	jsr terminal.hideCursor
	lda false
	jsr Terminal.setLocalEcho

		
mainloop:
	in
	jz pause
	
	sta keyCode
	jsr keyCheck
			
pause:
	hlt
	jp mainloop

keyCheck:
	push

	lda 65 ;A
	cmp keyCode
	jz end
	
	lda 66 ;B
	cmp keyCode
	jsrz terminal.clear
	jz endkeyTest

	lda 67 ;C echo on
	cmp keyCode
	jsrz echoon
	jz endkeyTest

	lda 68 ;D echo off
	cmp keyCode
	jsrz echooff
	jz endKeyTest
	
	lda 72 ;H Line home
	cmp keyCode
	jsrz terminal.linehome


endkeyTest:

	pop
	rts

echoon:
	push
	lda true
	jsr terminal.setLocalEcho
	pop
	rts

echooff:
	push
	lda false
	jsr terminal.setLocalEcho
	pop
	rts

	
end:
	brk
	
.db keyCode, 0

	