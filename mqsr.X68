*-----------------------------------------------------------
* Program    : Middle squares
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program
	MOVE.L	seed,d0
	MOVE.L	#0,d1
loop:	MOVE.W	d0,-(sp)
	JSR	MSQR
	ADDQ.L	#4,sp
	MOVE.L	d0,d1
	MOVEQ.L	#3,D0
	TRAP	#15
	MOVE.L	D1,D0
	BRA	loop
	MOVE.B	#9,D0
	TRAP	#15		; halt simulator
MSQR:				; takes a byte from the stack as a seed and returns in d0
	MOVE.W	4(sp),D0
	MULU.W	D0,D0
	LSR.W	#4,D0
	EXT.L	D0
	RTS
	
	
* Variables and Strings
	ORG	$3000
seed	dc.l	17
	END	START		; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
