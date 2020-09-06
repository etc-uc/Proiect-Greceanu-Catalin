unsigned int ldr;                      
unsigned int potentiometru;            
unsigned int comp1;                    
unsigned int comp2;                    
void main() {
 ANSEL  = 1;                           
 ANSELH = 1;                           
C1ON_bit = 1;                          
C2ON_bit = 1;                          

 ANSELH.ANS0 = 1;                      
 TRISA.TRISA0 = 1;                     
 ANSELH.ANS1 = 1;                      
 TRISA.TRISA1 = 1;                     


  TRISA  = 0xFF;                       
  TRISC  = 0;                          
  TRISB  = 0;                          

  do {                                
    ldr = ADC_Read(0);                 
    potentiometru = ADC_Read(1);       
    comp1=(ldr*5)/1024;                
    comp2=(potentiometru*5)/1024;      
    if(comp2>=comp1)                   
    {
    PORTB.RB4 = 0;                     
    }
    else                               
    {
    PORTB.RB4 = 1;                     
    }
  } while(1);                          
}

