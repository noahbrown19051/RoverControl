import processing.serial.*;
import java.util.*;
Serial myPort;
String ledStatus="LED: OFF";
List<Character> chars = Arrays.asList('1','2','3','4','5','6','7','8','9','q');

void setup(){
  size(1000, 750);
  myPort = new Serial(this, "COM3", 9600); // Starts the serial communication
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
  int buttonW = 100;
  int buttonH = 50;
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
  rect(850,650,buttonW,buttonH);
  
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
  rect(700,650,buttonW,buttonH); 
  
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
  rect(550,650,buttonW,buttonH); 
 
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
  rect(700,550,buttonW,buttonH); 
  
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
  rect(400,650,buttonW,buttonH);
  
   // left forward
  if(keyPressed) {
    if (key == 'q') {
      fill(0); 
      myPort.write('G');
    }
    else{
      fill(255);
    }
  }
  rect(550,550,buttonW,buttonH);
  
   // right forward
  if(keyPressed) {
    if (key == 'e') {
      fill(0); 
      myPort.write('I');
    }
    else{
      fill(255);
    }
  }
  rect(850,550,buttonW,buttonH);
  
   
  //for (int i=0; i<10; i++) {
  //  if(keyPressed) {
  //    if (key == i) {
  //      fill(0); 
  //      myPort.write('I');
  //    }
  //    else{
  //      fill(255);
  //    }
  //  }
  //  char speed = chars.get(i);
  //  rect(100,100+50*i,buttonW-10,buttonH-10);
    
  //  text(speed,120,115+50*i);
  //  fill(33);
  //}
    
  
  
  fill(225);
  
  textSize(32);
  text("Right",875,675);
  text("Back",725,675);
  text("Left",575,675);
  text("Drive",725,575);
  text("Stop",410,675);
  text("Right F",855,575);
  text("Left F",555,575);
  
  textSize(24);
  fill(33);
  text("Status:", 180, 200);
  textSize(30);
  textSize(16);
  text("Program made by Noah Brown in Group 3B,\n", 80, 320);

  text(ledStatus, 155, 240); // Prints the string comming from the Arduino

  // trying to add speed control
  //if(mousePressed && mouseX>100 && mouseX<200 && mouseY>100 && mouseY<900){
  //  myPort.write('1'); // Sends the character '1' and that will turn on the LED
  //  if (mouseY>100 && mouseY<200){
  //    myPort.write('1'); }
  //  else if  (mouseY>200 && mouseY<300) {
  //    myPort.write('2');}
  //  else if (mouseY>300 && mouseY<400) { myPort.write('3');}
  //  else if (mouseY>400 && mouseY<500) { myPort.write('4');}
  //  else if (mouseY>500 && mouseY<600) { myPort.write('5');}
  //  else if (mouseY>600 && mouseY<700) { myPort.write('6');}
  //  else if (mouseY>700 && mouseY<800) { myPort.write('7');}
  //  else if (mouseY>800 && mouseY<900) { myPort.write('8');}
  //  else if (mouseY>900 && mouseY<999) { myPort.write('9');}
  //  }
    
  
}
