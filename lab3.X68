*-----------------------------------------------------------
* Program    : CPS310-Lab3
* Written by : David Tenty (500540547)
* Date       : Feb-11-2014
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program
	move.w	a,-(sp)		; push value of coefficent a on stack
	move.w	b,-(sp)		; push value of	coefficent b on stack
	MOVE.L	#x,-(sp)	; push the address of x on stack
	JSR	QUAD		; call subroutine
	MOVE.W	x,D1		; load the results
	MOVE.B	#3,D0		
	TRAP	#15		; print the results
	MOVE.B	#9,D0
	TRAP	#15		; halt simulator
QUAD:	MOVE.L	(sp)+,A0	; pop the arguments from the stack and save them
	MOVE.L	(sp)+,A1
	MOVE.W	(sp)+,D4
	MOVE.W	(sp)+,D3
	CLR.W	D5		; clear accumulator
	MOVE.W	#2,D6		; loop counter
LOOP:	ADD.W	D3,D5		
	DBRA	D6, LOOP	; 3a
	MOVE.W	D4,D7		; load b into D7
	ADD.W	D7,D7		; 2b
	JSR	SQRT		; Call SQRT on 2b
	ADD.W	D7,D5		; add the reults to the accumulator
	MOVE.W	D5,(A1)		; save the results in the address passed on the stack
	MOVE.L	A0,-(sp)
	RTS			; return
SQRT:			; implements D7=floor(sqrt(D7))
	CLR.W	D6	; current guess = 0
	CLR.W	D0	; loop counter
NSQR:	ADD.W	#1,D6	; try the next guess
	MOVE.W	D6,D0	
	CLR.W	D1	; clear accumulator	
SLOOP:	ADD.W	D6,D1	; square the number
	DBRA	D0,SLOOP
	CMP.W	D1,D7
	BGT	NSQR	; is the squared guess > than D7?
	MOVE.W	D6,D7	; take the last guess and return in D7
	RTS		; return to caller

* Variables and Strings
	ORG	$2000
a	DC.W	1
b	DC.W	36
x	DS.W	1


	END	START		; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
