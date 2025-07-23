;Basic Hello World

_start:

	lda $msg
	sta b

mainLoop:
	lda [b] + c
	jz end
	out
	lda c
	inc
	sta c
	jp mainLoop

end:	
	brk
	
.db msg, "Hello World !!"
