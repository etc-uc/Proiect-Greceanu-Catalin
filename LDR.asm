
_main:

;LDR.c,5 :: 		void main() {
;LDR.c,6 :: 		ANSEL  = 1;                           //Declarare variabila analogica pentru cea mai mica valoare
	MOVLW      1
	MOVWF      ANSEL+0
;LDR.c,7 :: 		ANSELH = 1;                           //Declarare variabila analogica pentru cea mai mare valoare
	MOVLW      1
	MOVWF      ANSELH+0
;LDR.c,8 :: 		C1ON_bit = 1;                          //Dezactivare functie comparator
	BSF        C1ON_bit+0, BitPos(C1ON_bit+0)
;LDR.c,9 :: 		C2ON_bit = 1;                          //Dezactivare functie comparator
	BSF        C2ON_bit+0, BitPos(C2ON_bit+0)
;LDR.c,11 :: 		ANSELH.ANS0 = 1;                      //Declarare Poarta A0 analogica
	BSF        ANSELH+0, 0
;LDR.c,12 :: 		TRISA.TRISA0 = 1;                     //Declarare Poarta A0 intrare analogica
	BSF        TRISA+0, 0
;LDR.c,13 :: 		ANSELH.ANS1 = 1;                      //Declarare Poarta A1 analogica
	BSF        ANSELH+0, 1
;LDR.c,14 :: 		TRISA.TRISA1 = 1;                     //Declarare Poarta A1 intrare analogica
	BSF        TRISA+0, 1
;LDR.c,17 :: 		TRISA  = 0xFF;                       //Incrementatre valoare Poarti A cu 0
	MOVLW      255
	MOVWF      TRISA+0
;LDR.c,18 :: 		TRISC  = 0;                          //Incrementatre valoare Poarti C cu 0
	CLRF       TRISC+0
;LDR.c,19 :: 		TRISB  = 0;                          //Incrementatre valoare Poarti B cu 0
	CLRF       TRISB+0
;LDR.c,21 :: 		do {                                 //Start functie program
L_main0:
;LDR.c,22 :: 		ldr = ADC_Read(0);                 //Incrementare variabil intreaga fara semn pentru senzor lumina cu valoarea citita in  timp real a portii analogice A0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ldr+0
	MOVF       R0+1, 0
	MOVWF      _ldr+1
;LDR.c,23 :: 		potentiometru = ADC_Read(1);       //Incrementare variabil intreaga fara semn pentru Potentiometru cu valoarea citita in timp real a portii analogice A1
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+2
	MOVF       R0+1, 0
	MOVWF      FLOC__main+3
	MOVF       FLOC__main+2, 0
	MOVWF      _potentiometru+0
	MOVF       FLOC__main+3, 0
	MOVWF      _potentiometru+1
;LDR.c,24 :: 		comp1=(ldr*5)/1024;                //Scalare variabil intreaga fara semn pentru senzor lumina in plaja de tensiune de lucru
	MOVF       _ldr+0, 0
	MOVWF      R0+0
	MOVF       _ldr+1, 0
	MOVWF      R0+1
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      10
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R2+0, 0
L__main6:
	BTFSC      STATUS+0, 2
	GOTO       L__main7
	RRF        FLOC__main+1, 1
	RRF        FLOC__main+0, 1
	BCF        FLOC__main+1, 7
	ADDLW      255
	GOTO       L__main6
L__main7:
	MOVF       FLOC__main+0, 0
	MOVWF      _comp1+0
	MOVF       FLOC__main+1, 0
	MOVWF      _comp1+1
;LDR.c,25 :: 		comp2=(potentiometru*5)/1024;      //Scalare variabil intreaga fara semn pentru potentiometru in plaja de tensiune de lucru
	MOVF       FLOC__main+2, 0
	MOVWF      R0+0
	MOVF       FLOC__main+3, 0
	MOVWF      R0+1
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__main8:
	BTFSC      STATUS+0, 2
	GOTO       L__main9
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	ADDLW      255
	GOTO       L__main8
L__main9:
	MOVF       R2+0, 0
	MOVWF      _comp2+0
	MOVF       R2+1, 0
	MOVWF      _comp2+1
;LDR.c,26 :: 		if(comp2>=comp1)                   //Start conditie comparare intre valorile scalate ale celor doi senzori analogici
	MOVF       FLOC__main+1, 0
	SUBWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVF       FLOC__main+0, 0
	SUBWF      R2+0, 0
L__main10:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;LDR.c,28 :: 		PORTB.RB4 = 0;                     //Daca conditia comparari este NOK valoarea poartii de output RB4 este zero ledul va ramane oprit pana cand conditia va deveni OK
	BCF        PORTB+0, 4
;LDR.c,29 :: 		}
	GOTO       L_main4
L_main3:
;LDR.c,32 :: 		PORTB.RB4 = 1;                     //Daca conditia comparari este OK valoarea poartii de output RB4 este 1 ledul va if pornit pana cand conditia va deveni NOK
	BSF        PORTB+0, 4
;LDR.c,33 :: 		}
L_main4:
;LDR.c,34 :: 		} while(1);                          //Executie in bucla a functiei
	GOTO       L_main0
;LDR.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
