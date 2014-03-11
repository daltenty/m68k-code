*-----------------------------------------------------------
* Program    :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program
	MOVE.L	#4,D0
	TRAP 	#15		; read number from keyboard
	MOVE.L	D1,D2
	MOVE.L	#4,D0
	TRAP 	#15		; read 2nd number from keyboard
	SUB.L	D1,D2		; D2=D1-D2
	MOVE.L	#4,D0
	TRAP 	#15		; read 3rd number from keyboard
	ADD.L	D1,D2		; D2=D1+D2
	MOVE.L	#4,D0
	TRAP 	#15		; read 4th number from keyboard
	SUB.L	D1,D2		; D2=D1-D2
	MOVE.L	D2,D1
	MOVE.L	#10,D2		; set the number base to 10
	MOVE.L	#15,D0
	TRAP #15		; print the text
	MOVE.B	#9,D0
	TRAP	#15		; halt simulator

* Variables and Strings
	


	END	START		; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
