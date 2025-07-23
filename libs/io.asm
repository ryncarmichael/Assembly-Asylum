;--------------------------------------
; Assembly Asylum System File
;
; General IO / Print Routines
;
; Note you may incude this entire file 
; in your project or just copy and paste
; the required routines / variables.
;--------------------------------------

;IO System Work Variables
.db IO.systemWorkVariable, "abc"

;------------------------------------
;Prints a CRLF
;------------------------------------
IO.printCRLF:
	push a ;backup A register
	
	lda 13 ;Print a CRLF
	out
	lda 10
	out
	
	pop a ;Restore A register
	rts

;------------------------------------
;Print a given Number
;Expects number in A register
;------------------------------------
IO.printNumber:
	push a ;Backup A register
	
	str IO.systemWorkVariable; Covert Number to String and print
	lda $IO.systemWorkVariable
	jsr IO.printString
	
	pop a ;Restore the A register
	rts

;------------------------------------
;Print a given string
;Expects address in A register
;------------------------------------
IO.printString:
	pusha ;Back up all the registers
	
	;String Address and counter
	sta d
	lda 0 
	sta b
		
	;Check for Zero Termination
 	len [d]
	lda [d] + a
	jnz IO.printNonZero
	
;Zero Terminated
IO.printLoop:
	lda [d] + b
	jz IO.printEnd
	out
	lda b
	inc
	sta b
	jp IO.printLoop

;Non-Zero Terminated
IO.printNonZero:
	len [d]
	sta c

IO.printNonZeroLoop:
	lda [d] + b
	out
	lda b
	inc
	sta b
	lp IO.printNonZeroLoop

IO.printEnd:
	popa ;Restore all the registers
	rts