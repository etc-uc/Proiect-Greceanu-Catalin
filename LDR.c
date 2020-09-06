unsigned int ldr;                      //Declarare variabila de salvare valoare intreaga fara semn a portii analogice pentru senzor lumina
unsigned int potentiometru;            //Declarare variabila de salvare valoare intreaga fara semn a portii analogice pentru Potentiometru
unsigned int comp1;                    //Declarare variabila de salvare valoare intreaga fara semn a valorii scalaate pentru senzor lumina
unsigned int comp2;                    //Declarare variabila de salvare valoare intreaga fara semn a valorii scalaate pentru Potentiometru
void main() {
 ANSEL  = 1;                           //Declarare variabila analogica pentru cea mai mica valoare
 ANSELH = 1;                           //Declarare variabila analogica pentru cea mai mare valoare
C1ON_bit = 1;                          //Dezactivare functie comparator
C2ON_bit = 1;                          //Dezactivare functie comparator

 ANSELH.ANS0 = 1;                      //Declarare Poarta A0 analogica
 TRISA.TRISA0 = 1;                     //Declarare Poarta A0 intrare analogica
 ANSELH.ANS1 = 1;                      //Declarare Poarta A1 analogica
 TRISA.TRISA1 = 1;                     //Declarare Poarta A1 intrare analogica


  TRISA  = 0xFF;                       //Incrementatre valoare Poarti A cu 0
  TRISC  = 0;                          //Incrementatre valoare Poarti C cu 0
  TRISB  = 0;                          //Incrementatre valoare Poarti B cu 0

  do {                                 //Start functie program
    ldr = ADC_Read(0);                 //Incrementare variabil intreaga fara semn pentru senzor lumina cu valoarea citita in  timp real a portii analogice A0
    potentiometru = ADC_Read(1);       //Incrementare variabil intreaga fara semn pentru Potentiometru cu valoarea citita in timp real a portii analogice A1
    comp1=(ldr*5)/1024;                //Scalare variabil intreaga fara semn pentru senzor lumina in plaja de tensiune de lucru
    comp2=(potentiometru*5)/1024;      //Scalare variabil intreaga fara semn pentru potentiometru in plaja de tensiune de lucru
    if(comp2>=comp1)                   //Start conditie comparare intre valorile scalate ale celor doi senzori analogici
    {
    PORTB.RB4 = 0;                     //Daca conditia comparari este NOK valoarea poartii de output RB4 este zero ledul va ramane oprit pana cand conditia va deveni OK
    }
    else                               //Altfel
    {
    PORTB.RB4 = 1;                     //Daca conditia comparari este OK valoarea poartii de output RB4 este 1 ledul va if pornit pana cand conditia va deveni NOK
    }
  } while(1);                          //Executie in bucla a functiei
}

