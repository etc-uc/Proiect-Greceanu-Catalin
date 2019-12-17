Termometru cu ceas si data

Componente necesare:
•	12C 16x2 LCD
•	DHT11 Temperature and humidity sensor
•	Real time clock module
•	Arduino UNO
•	Fire





Scopul acestei lucrari este de a iti crea o interfata proprie care afiseaza, timpul, data impreuna cu temperatura si umiditatea.




Arduino UNO sta la baza multor proiecte de electronică. În combinație cu alte device-uri, cum ar fi senzori și shield de ethernet sau bluetooth, puteți concepe montaje inovative ce vă pot automatiza casa.
Diferența față de placa originală Arduino Uno o reprezintă package-ul în care se află microcontroller-ul ATmega328p și faptul că este programat cu ajutorul circuitul integrat CH340.
•	Tensiune de funcționare: 5V;
•	Tensiune de alimentare jack: 7-12V;
•	Pini de I/O: 14;
•	Pini PWM: 6 (din cei 14 de I/O);
•	Pini ADC: 8;
•	Memorie flash: 32kB (8 ocupați de bootloader);
•	Comunicație TWI, SPI și UART;
•	Frecvență de funcționare: 16MHz.





DHT11 este un sensor usor de achizitionat si ieftin. Temperatura este masurata de un NTC, iar umiditatea relativă este măsurată folosind un senzor capacitiv. Aceste elemente sunt pre-calibrate, iar ieșirea este oferită ca semnal digital. Senzorul poate măsura umiditatea în intervalul 20% - 90% cu o precizie de 5% și temperatura în intervalul 0 – 50 ˚C cu o precizie de 2 ˚C.
•	Tensiune de alimentare: 3.3V - 5V;
•	Curent: 2.5mA (maxim);
•	Gama de măsurare a umidității: 20% - 95% RH;
•	Acuratețea măsurării umidității: ±5% RH;
•	Gama de măsurare a temperaturii: 0 oC - 60 °C;
•	Acuratetea măsurării temperaturii: ±2 oC;
•	Nu funcționează sub 0°C.





RTC DS3231
Placuța este perfecta pentru a putea ține evidența timpului în proiectul dumneavoastră. Aceasta are o baterie externă ce îi permite funcționarea indiferent dacă proiectul principal este alimentat sau nu. DS3231 este cel mai popular Ceas în timp real și funcționează perfect cu chipuri de 5v.
•  Dimensiuni: 38x22x14mm 
•  Greutate: 8g 
•  Tensiune de alimentare: 3.3 - 5.5V 
•  Cipul are intern un senzor de temperatură: acuratețe 3 °C





LCD 16x2 12C
LCD-ul poate sa afiseze 16  caractere pe 2 randuri, are backlight de culoare albastra, si dispune de un backpack I2C care permite conectare la Arduino folosind doar 2 fire.
•  Tensiune de alimentare: 5V; 
•  Curent: 1.1mA;
