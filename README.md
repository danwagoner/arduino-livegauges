# Description

### Arduino Code
This sketch takes puts the information on A5 out through the ethernet connection when there is a connection on port 23. There is a corresponding script that connects, then displays the information in a gauge via PHP and Open Flash Gauges (http://www.digitaldarknet.net/flash/).

### PHP
This program will connect to the Arduino you configured on port 23. The Arduino is programmed to dump the information from analog pin 5 to the client and disconnect the session. This script then takes that information and feeds it to the Open Flash Guages (http://www.digitaldarknet.net/flash/) script to display that information in realtime on your browser.

### Details
http://www.nerdybynature.com/2009/07/27/arduino-web-based-live-gauges/
