#include <Adafruit_NeoPixel.h>
#include <Wire.h>
#include "RTClib.h"
#include <SoftwareSerial.h>
#include <EEPROM.h>



#define PIN 6

// Parameter 1 = number of pixels in strip
// Parameter 2 = pin number (most are valid)
// Parameter 3 = pixel type flags, add together as needed:
//   NEO_KHZ800  800 KHz bitstream (most NeoPixel products w/WS2812 LEDs)
//   NEO_KHZ400  400 KHz (classic 'v1' (not v2) FLORA pixels, WS2811 drivers)
//   NEO_GRB     Pixels are wired for GRB bitstream (most NeoPixel products)
//   NEO_RGB     Pixels are wired for RGB bitstream (v1 FLORA pixels, not v2)
Adafruit_NeoPixel strip = Adafruit_NeoPixel(19, PIN, NEO_GRB + NEO_KHZ800);

RTC_DS1307 rtc;                      // Set up real time clock

SoftwareSerial mySerial(10, 11); // RX, TX

byte logor=0,logog=0,logob=0,numbersr=0,numbersg=0,numbersb=0, selectl=0, selectn=0;

void setup() 
{
  //TXLED1; //Para apagar leds en arduino leonardo o micro solamente.
  //RXLED1; //Para apagar leds en arduino leonardo o micro solamente.
  Wire.begin();
  rtc.begin();                  // Begin DS1307 real time clock
  mySerial.begin(1200);
  
  if (! rtc.isrunning()) 
  {
    rtc.adjust(DateTime(__DATE__, __TIME__));
  }
  strip.begin();
  logor = EEPROM.read(0);
  logog = EEPROM.read(1);
  logob = EEPROM.read(2);
  numbersr = EEPROM.read(3);
  numbersg = EEPROM.read(4);
  numbersb = EEPROM.read(5);
  selectl = EEPROM.read(6);
  selectn = EEPROM.read(7);
  Serial.begin(1200);   
}


void loop() 
{
uint8_t hourvalue, minutevalue,secondvalue,minu;
int R[19];
int G[19];
int B[19];

for (int i = 0; i<=18;i++)
{
R[i] = 5;
G[i] = 5;
B[i] = 5;
}

DateTime now = rtc.now();           // Get the RTC info

if ((mySerial.available()>0))
{
switch (mySerial.read())
{
case 97://a
selectl++;
switch(selectl)
{
case 1:
logor = 255;
logog = 0;
logob = 0;
break;
case 2:
logor = 0;
logog = 255;
logob = 0;
break;
case 3:
logor = 0;
logog = 0;
logob = 255;
break;
case 4:
logor = 255;
logog = 255;
logob = 0;
break;
case 5:
logor = 255;
logog = 0;
logob = 255;
break;
case 6:
logor = 0;
logog = 255;
logob = 255;
break;
case 7:
logor = 255;
logog = 255;
logob = 255;
break;
default:
selectl = 0;
logor = 0;
logog = 0;
logob = 0;
break;
}
EEPROM.write(0,logor);
EEPROM.write(1,logog);
EEPROM.write(2,logob);
EEPROM.write(6,selectl);
break;

case 99: //c
selectn++;
switch(selectn)
{
case 1:
numbersr = 255;
numbersg = 0;
numbersb = 0;
break;
case 2:
numbersr = 0;
numbersg = 255;
numbersb = 0;
break;
case 3:
numbersr = 0;
numbersg = 0;
numbersb = 255;
break;
case 4:
numbersr = 255;
numbersg = 255;
numbersb = 0;
break;
case 5:
numbersr = 255;
numbersg = 0;
numbersb = 255;
break;
case 6:
numbersr = 0;
numbersg = 255;
numbersb = 255;
break;
case 7:
numbersr = 255;
numbersg = 255;
numbersb = 255;
break;
default:
selectn = 0;
numbersr = 0;
numbersg = 0;
numbersb = 0;
break;
}
EEPROM.write(3,numbersr);
EEPROM.write(4,numbersg);
EEPROM.write(5,numbersb);
EEPROM.write(7,selectn);
break;

case 98: //b
rtc.adjust(DateTime(now.year(), now.month(), now.day(), now.hour() +1 , now.minute(), now.second()));
break;

case 100: //d
rtc.adjust(DateTime(now.year(), now.month(), now.day(), now.hour(), now.minute() + 5, now.second()));
break;
}
}

R[0] = logor;
G[0] = logog;
B[0] = logob;  
R[1] = numbersr;
G[1] = numbersg;
B[1] = numbersb; 
R[2] = numbersr;
G[2] = numbersg;
B[2] = numbersb; 
R[3] = numbersr;
G[3] = numbersg;
B[3] = numbersb; 
R[4] = numbersr;
G[4] = numbersg;
B[4] = numbersb; 
R[5] = numbersr;
G[5] = numbersg;
B[5] = numbersb; 
R[6] = numbersr;
G[6] = numbersg;
B[6] = numbersb; 



hourvalue = now.hour();             // Get the hour
if(hourvalue > 12) hourvalue -= 12; // This clock is 12 hour, is 13-24, convert to 1-12
minutevalue = now.minute();         // Get the minutes
secondvalue = now.second();


switch (hourvalue) 
{
case 1:
R[17] = 255;
break;
case 2:
R[16] = 255;
break;
case 3:
R[15] = 255;
break;
case 4:
R[14] = 255;
break;
case 5:
R[13] = 255;
break;
case 6:
R[12] = 255;
break;
case 7:
R[11] = 255;
break;
case 8:
R[10] = 255;
break;
case 9:
R[9] = 255;
break;
case 10:
R[8] = 255;
break;
case 11:
R[7] = 255;
break;
case 12:
R[18] = 255;
break;
case 0:
R[18] = 255;
break;
}


if(minutevalue > 55) minutevalue = 55;
minu = map(minutevalue,0,59,0,12);


switch (minu) 
{
case 1:
G[17] = 255;
break;
case 2:
G[16] = 255;
break;
case 3:
G[15] = 255;
break;
case 4:
G[14] = 255;
break;
case 5:
G[13] = 255;
break;
case 6:
G[12] = 255;
break;
case 7:
G[11] = 255;
break;
case 8:
G[10] = 255;
break;
case 9:
G[9] = 255;
break;
case 10:
G[8] = 255;
break;
case 11:
G[7] = 255;
break;
case 12:
G[18] = 255;
break;
case 0:
G[18] = 255;
break;
}

minu = map(secondvalue,0,59,0,12);

switch (minu) 
{
case 1:
B[17] = 255;
break;
case 2:
B[16] = 255;
break;
case 3:
B[15] = 255;
break;
case 4:
B[14] = 255;
break;
case 5:
B[13] = 255;
break;
case 6:
B[12] = 255;
break;
case 7:
B[11] = 255;
break;
case 8:
B[10] = 255;
break;
case 9:
B[9] = 255;
break;
case 10:
B[8] = 255;
break;
case 11:
B[7] = 255;
break;
case 12:
B[18] = 255;
break;
case 0:
B[18] = 255;
break;
}


for (int i=0;i<=18;i++)
{
strip.setPixelColor(i, R[i],G[i],B[i]);
}
strip.show();

delay(100);
}


