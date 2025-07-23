;IRQ Test

	.include "terminal.asm"


_start:

	lda false
	jsr terminal.setLocalEcho

	lda 100
	sta _irqTimeOutValue

mainloop:
	in
	jz pause
	
	sta keyCode
	jsr keycheck
		
pause:
	sleep
	jp mainloop
	
end:
	brk

keycheck:
	push
	
	lda 65 ;A
	cmp keyCode 
	jz end
	
	lda 66 ;B
	cmp keycode
	jsrz killirq
	jz endkeycheck
	
	lda 67 ;C
	cmp keyCode
	jsrz startirq
	jz endkeycheck

	lda 73
	cmp keyCode
	jsrz softirq

endkeycheck:

	lda 0
	sta keyCode

	pop
	rts

softirq:
	push
	irq
	pop
	rts
	
startirq:
	push
	lda 100
	sta _irqTimeOutValue
	pop
	rts
	
killirq:
	push
	lda 0
	sta _irqTimeOutValue
	pop
	rts
	
_irq:
	push
	lda 66
	out
	pop
	rti
	
.db keyCode, 0