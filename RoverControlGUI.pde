import processing.serial.*;
Serial myPort;
String ledStatus="LED: OFF";

void setup(){
  size(1000, 750);
  myPort = new Serial(this, "/dev/cu.DSDTECHHC-05", 38400); // Starts the serial communication
  myPort.bufferUntil('\n'); // Defines up to which character the data from the serial port will be read. The character '\n' or 'New Line'
}
void serialEvent (Serial myPort){ // Checks for available data in the Serial Port
  ledStatus = myPort.readStringUntil('\n'); //Reads the data sent from the Arduino (the String "LED: OFF/ON) and it puts into the "ledStatus" variable
}

void draw(){
  background(237, 240, 241);
  fill(20, 160, 133); // Green Color
  stroke(33);
  strokeWeight(1);
  rect(50, 100, 150, 50, 10);  // Turn ON Button
  rect(250, 100, 150, 50, 10); // Turn OFF Button
   // right button
  if(keyPressed) {
    if (key == 'd') {
      fill(0); 
      myPort.write('R');
    }
    else{
      fill(255);
    }
  }
  rect(850,650,100,50);
  
  // down button
  if(keyPressed) {
    if (key == 's') {
      fill(0);
      myPort.write('B');
    }
    else{
      fill(255);
    }
  }
  rect(700,650,100,50); 
  
  // left button
  if(keyPressed) {
    if (key == 'a') {
      fill(0);
      myPort.write('L');
    }
    else{
      fill(255);
    }
  }
  rect(550,650,100,50); 
 
  // up button
  if(keyPressed) {
    if (key == 'w') {
      fill(0); 
      myPort.write('F');
    }
    else{
      fill(255);
    }
  }
  rect(700,550,100,50); 
  
  // stop/go button
  if(keyPressed) {
    if (key == ' ') {
      fill(0); 
      myPort.write('S');
    }
    else{
      fill(255);
    }
  }
  rect(400,650,125,50);
  
  fill(225);
  
  textSize(32);
  text("Right",875,675);
  text("Back",725,675);
  text("Left",575,675);
  text("Drive",725,575);
  text("Stop",410,675);
  text("Turn ON",60, 135);
  text("Turn OFF", 255, 135);
  textSize(24);
  fill(33);
  text("Status:", 180, 200);
  textSize(30);
  textSize(16);
  text("Program made by Dejan Nedelkovski,\n     www.HowToMechatronics.com", 80, 320);

  text(ledStatus, 155, 240); // Prints the string comming from the Arduino
  
  // If the button "Turn ON" is pressed
  if(mousePressed && mouseX>50 && mouseX<200 && mouseY>100 && mouseY<150){
    myPort.write('1'); // Sends the character '1' and that will turn on the LED
    // Highlighs the buttons in red color when pressed
    stroke(255,0,0);
    strokeWeight(2);
    noFill();
    rect(50, 100, 150, 50, 10);
  }
  // If the button "Turn OFF" is pressed
  if(mousePressed && mouseX>250 && mouseX<400 && mouseY>100 && mouseY<150){
    myPort.write('0'); // Sends the character '0' and that will turn on the LED
    stroke(255,0,0);
    strokeWeight(2);
    noFill();
    rect(250, 100, 150, 50, 10);
  }
  
  
  
  
}
