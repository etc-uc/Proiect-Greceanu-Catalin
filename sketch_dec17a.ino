#include <dht.h>




#define dht_apin A0 // Analog Pin la care senzorul e conectat
dht DHT;
 
void setup(){
 
  Serial.begin(9600);
  delay(500);//Asteapta sa booteze sistemul
  Serial.println("DHT11 Senzor de umiditate si temperatura\n\n");
  delay(1000);//Asteapta inainte de a accesa senzorul 
 
}//end "setup()"
 
void loop(){
  //Incepe programul
 
    DHT.read11(dht_apin);
    
    Serial.print("Umiditatea curenta = ");
    Serial.print(DHT.humidity);
    Serial.print("%  ");
    Serial.print("temperatura = ");
    Serial.print(DHT.temperature); 
    Serial.println("C  ");
    
    delay(5000);//Asteapta 5 secunde inainte de a accesa din nou senzorul
 
  
 
}// Termina bucla
