// Arduino_live_gauge
// =======================================================================================
// This sketch takes puts the information on A5 out through the ethernet connection when
// there is a connection on port 23. There is a corresponding script that connects, then
// displays the information in a gauge via PHP and Open Flash Gauges 
// (http://www.digitaldarknet.net/flash/).
//
// Written By: Dan Wagoner - www.nerdybynature.com
// Date: 07/26/2009

#include <Ethernet.h>
#include <stdio.h>
#include <string.h>

// define ethernet properties
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
byte ip[] = { 192, 168, 1, 10 };
byte subnet[] = { 255, 255, 255, 0};
Server server = Server(23);                                                     // listen on port 23

void setup()
{
  pinMode( 5, INPUT );
  Serial.begin(9600);
  Ethernet.begin(mac, ip, gateway, subnet);
  server.begin();
  delay(1000);
}

void loop(){
  Client client = server.available();
  if (client){
    client.print(analogRead(5));
    Serial.println(analogRead(5));
    delay(200);
    client.stop();
    Ethernet.begin(mac, ip, gateway, subnet);
  }
}