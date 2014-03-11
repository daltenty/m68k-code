*-----------------------------------------------------------
* Program    :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program
GETINT: MOVE.L	#PROMPT,A1
	MOVE.B	#14,D0
	TRAP	#15		; display prompt
	MOVE.B	#4,D0
	TRAP	#15		; read number
	MOVE.L	D1,-(sp)	; push onto stack
OFILE:	MOVE.B	#50,D0
	TRAP	#15		; initialize fileio
	MOVE.L	#INFILE,A1
	MOVE.B	#51,D0
	TRAP	#15		; open file
	MOVE.L	D1,-(sp)	; push fileid onto stack
	JSR	SEARCH
	MOVE.B	#56,D0
	TRAP	#15		; close file
	MOVE.B	#9,D0
	TRAP	#15		; halt simulator
SEARCH:	MOVE.L	D0,-(sp)	; implements binary search
	MOVE.L	D1,-(sp)
	MOVE.L	D2,-(sp)
	MOVE.L	A1,-(sp)
	MOVE.L	20(sp),D1
	MOVE.L	LENGTH,D2
	MOVE.L	#BUFFER,A1
	MOVE.B	#53,D0
	TRAP	#15		; read file into buffer
	
	MOVE.L	(sp)+,A1
	MOVE.L	(sp)+,D2
	MOVE.L	(sp)+,D1
	MOVE.L	(sp)+,D0 	; restore stack			
	RTS

* Variables and Strings
	ORG	$2000
INFILE	DC.B	'outfile.txt',0  ; input filename
FOUND	DC.B	'FOUND',0
NFOUND	DC.B	'NOT FOUND',0
PROMPT	DC.B	'Please enter search number: ',0
LENGTH	DC.L	2000
BUFFER	DS.B	LENGTH
	END	START		; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
