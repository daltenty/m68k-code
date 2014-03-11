*-----------------------------------------------------------
* Program    :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program
	MOVE.L	A,D1		; load A into D1
	ADD.L	B,D1		; add B to the contents of D1
	MOVE.L	#10,D2		; set the number base to 10
	MOVE.L	#15,D0
	TRAP #15		; print the text
	MOVE.B	#9,D0
	TRAP	#15		; halt simulator

* Variables and Strings
A	dc.l	5
B	dc.l	10		


	END	START		; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
