#!/usr/bin/php -q
<?php
// =========================================================================================
// arduino_fetch_data.php
// Written by: Dan Wagoner - www.nerdybynature.com
// Date: 07/26/09
//
// This program will connect to the Arduino you configured on port 23. The Arduino is
// programmed to dump the information from analog pin 5 to the client and disconnect the
// session. This script then takes that information and feeds it to the Open Flash Guages
// (http://www.digitaldarknet.net/flash/) script to display that information in realtime
// on your browser.
// =========================================================================================

$arduino_ip = "192.168.1.10";
$arduino_port = "23";

// open connection to arduino
$fp = fsockopen($arduino_ip, $arduino_port);
fputs ($fp, "p");

$arduino_data = fgets($fp,10);

// feed information to gauge
echo "&value=$arduino_data&range=1024";
fclose($fp);
?>
