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
	out
		
skip:
	hlt
	
	jp mainloop
	
end:
	brk