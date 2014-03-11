*-----------------------------------------------------------
* Program    :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program
	MOVE.B	#50,D0
	TRAP	#15		; initialize fileio
	MOVE.L	#INFILE,A1
	MOVE.B	#51,D0
	TRAP	#15		; open file
	MOVE.L	LENGTH,D2
	MOVE.L	#BUFFER,A1
	MOVE.B	#53,D0
	TRAP	#15		; read file
	MOVE.B	#56,D0
	TRAP	#15		; close file
	MOVE.L	D2,-(sp)
	JSR	SORT		; call swap
	MOVE.L	#OUTFILE,A1
	MOVE.B	#52,D0
	TRAP	#15		; open output file
	MOVE.L	#BUFFER,A1
	MOVE.B	#54,D0
	TRAP	#15		; write file
	MOVE.B	#56,D0
	TRAP	#15		; close file
	MOVE.B	#9,D0
	TRAP	#15		; halt simulator
SORT:	MOVE.L	D2,-(sp)	; implements bubble sort
	MOVE.L	8(sp),D2
	MOVE.L	D0,-(sp)
	MOVE.L	D1,-(sp)
	MOVE.B	D3,-(sp)
	MOVE.B	D4,-(sp)
	MOVE.L	A0,-(sp)
	MOVE.L	A1,-(sp)
RESORT:	MOVE.L	#BUFFER,A0
	MOVE.L	#BUFFER,A1
	ADD.L	#1,A1
	MOVE.L	#2,D0		; initalize loop ctr
	MOVE.L	#0,D1		; initalize nswaps
LOOP:	CMP.L	D2,D0
	BGT	DONE
	MOVE.B	(A0),D3
	MOVE.B	(A1),D4
	CMP.B	D4,D3
	BLE	NOSWAP
	ADDQ.L	#1,D1
	MOVE.B	D3,(A1)
	MOVE.B	D4,(A0)
NOSWAP:	ADD.L	#1,A0
	ADD.L	#1,A1
	ADD.L	#1,D0
	BRA	LOOP
DONE:	CMP.L	#0,D1
	BNE	RESORT
	MOVE.L	(sp)+,A1
	MOVE.L	(sp)+,A0
	MOVE.B	(sp)+,D4
	MOVE.B	(sp)+,D3
	MOVE.L	(sp)+,D1
	MOVE.L	(sp)+,D0
	MOVE.L	(sp)+,D2 ; restore stack			
	RTS

* Variables and Strings
	ORG	$2000
INFILE	DC.B	'outfile.txt',0  ; input filename
FOUND	DC.B
LENGTH	DC.L	200
BUFFER	DS.B	LENGTH
	END	START		; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
