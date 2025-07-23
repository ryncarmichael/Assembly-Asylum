;--------------------------------------
; Assembly Asylum System File
;
; Terminal routines
;
; Note some of these modes may not work
; in your particular terminal.
;
; Note you may incude this entire file 
; in your project or just copy and paste
; the required routines.
;--------------------------------------

;------------------------------------
; Move cursor to column
; Requires column value in the A register
;------------------------------------
TERMINAL.moveCursorToColumn:
	sys _terminal_moveCursorToColumn
	rts

;------------------------------------
; Erase line from cursor
; Requires no parameters
;------------------------------------
TERMINAL.eraseLineFromCursor:
	sys _terminal_eraseLineFromCursor
	rts

;------------------------------------
; Move back and number of columns on 
; current line.
; Requires a positive value in the A
; register
;------------------------------------
TERMINAL.moveCursorBack:
	sys _terminal_moveBackXColumns
	rts

;------------------------------------
; Position cursor at column and row
; Requires values in X / Y Registers
;------------------------------------
TERMINAL.setCursorPosition:
	sys _terminal_setCursorPosition
	rts

;------------------------------------
; Set the Text Background color
; Requires color value in A register
; Colours range from 0 - 255
; https://gist.github.com/ConnerWill/d4b6c776b509add763e17f9f113fd25b
;------------------------------------
TERMINAL.setBackgroundColor:
	sys _terminal_backcolor
	rts

;------------------------------------
; Set the Text Foreground color
; Requires color value  in A register
; Colours range from 0 - 255
; https://gist.github.com/ConnerWill/d4b6c776b509add763e17f9f113fd25b
;------------------------------------
TERMINAL.setTextColor:
	sys _terminal_forecolor
	rts

;------------------------------------
; Hide or show the cursor
; Requires true / false in A register
;------------------------------------
TERMINAL.hideCursor:
	sys _terminal_cursorvisible
	rts

;------------------------------------
; Completely reset the terminal
; Requires no parameters
;------------------------------------
TERMINAL.resetTerminal:
	sys _terminal_resetTerminal
	rts

;------------------------------------
; Erase the line the cursors is on
; Requires no parameters
;------------------------------------
TERMINAL.eraseLine:
	sys _terminal_eraseLine
	rts

;------------------------------------
; Move curseor to column 0
; Requires no parameters
;------------------------------------
TERMINAL.lineHome:
	sys _terminal_lineHome
	rts
	
;------------------------------------
; Turn on / off hidden text mode
; Requires True / False in A Register
;------------------------------------
TERMINAL.setHiddenText:
	sys _terminal_hidden
	rts

;------------------------------------
; Turn on / off strike through text mode
; Requires True / False in A Register
;
; NOTE! Does not work in all terminals
;------------------------------------
TERMINAL.setStrikeThroughText:
	sys _terminal_strikeThrough
	rts

;------------------------------------
; Turn on / off blinking text mode
; Requires True / False in A Register
;------------------------------------
TERMINAL.setBlinkingText:
	sys _terminal_blinking
	rts

;------------------------------------
; Turn on / off inverse text mode
; Requires True / False in A Register
;------------------------------------
TERMINAL.setInverseText:
	sys _terminal_inverse
	rts

;------------------------------------
; Turn on / off faint text mode
; Requires True / False in A Register
;------------------------------------
TERMINAL.setFaintText:
	sys _terminal_faint
	rts

;------------------------------------
; Home Cursor to top left
; Requires no parameters
;------------------------------------
TERMINAL.homeCursor:
	sys _terminal_screenHome
	rts

;------------------------------------
; Reset all text styles 
; Requires no parameters
;------------------------------------
TERMINAL.resetStyles:
	sys _terminal_resetStyles
	rts

;------------------------------------
; Turn on or off local Echo
; Requires True / False in A Register
;------------------------------------
TERMINAL.setLocalEcho:
	sys _terminal_Echo
	rts

;------------------------------------
; Turn on or off Bold Text
; Requires True / False in A Register
;------------------------------------
TERMINAL.setBoldText:
	sys _terminal_bold
	rts
	
;------------------------------------
; Turn on or off Underline Text
; Requires True / False in A Register
;------------------------------------
TERMINAL.setUnderLineText:
	sys _terminal_underLine
	rts

;------------------------------------
; Turn on or off Italic Text
; Requires True / False in A Register
;------------------------------------
TERMINAL.setItalicText:
	sys _terminal_italic
	rts

;------------------------------------
; Reset Text to normal
; Requires no parameters
;------------------------------------
TERMINAL.setNormalText:
	sys _terminal_normal
	rts

;------------------------------------
; Clear Terminal and Home Cursor
; Requires no parameters
;------------------------------------
TERMINAL.clear:
	sys _terminal_clear
	rts

