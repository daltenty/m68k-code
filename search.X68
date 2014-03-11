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
	MOVE.L	D2,-(sp)	; curlength
	MOVE.L	D3,-(sp)
	MOVE.L	20(sp),D1	; fileptr
	MOVE.L	24(sp),D3	; searchnum		
	MOVE.L	A1,-(sp)
	MOVE.L	A2,-(sp)
	MOVE.L	LENGTH,D2
	MOVE.L	#BUFFER,A1	; bufptr
	MOVE.B	#53,D0
	TRAP	#15		; read file into buffer
BSRCH:	MOVE.B	(A1),D0
	SUB.L	#48,D0
	EXT.W	D0
	EXT.L	D0
	CMP.L	D0,D3
	BEQ	FND
	CMP.L	#1,D2
	BLE	NFND
	MOVE.L	A1,A2
	ASR.L	#1,D2
	ADD.L	D2,A2
	MOVE.B	(A2),D0
	SUB.L	#48,D0
	EXT.W	D0
	EXT.L	D0
	CMP.L	D0,D3
	BLT	CONT
	MOVE.L	A2,A1	
CONT:	BRA	BSRCH
FND:	MOVE.L	#FOUND,A1
	MOVE.B	#14,D0
	TRAP	#15
	BRA	CLENUP
NFND:	MOVE.L	#NFOUND,A1
	MOVE.B	#14,D0
	TRAP	#15
CLENUP:	MOVE.L	(sp)+,A2
	MOVE.L	(sp)+,A1
	MOVE.L	(sp)+,D3
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
