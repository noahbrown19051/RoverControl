
#include <AFMotor.h>

AF_DCMotor motor1(1);
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
AF_DCMotor motor4(4);

int command; //Int to store app command state.
int speedCar = 255w; // Initial car speed set 0 to 255.

void setup()
{
  Serial.begin(9600);
  Serial.println("");
  Serial.println("Set 'Both NL & CR' in the serial monitor.");
  Serial.println("\nReady");
  Serial.println("");
  Stop();
}

void forward()
{
  motor1.run(FORWARD);
  motor2.run(FORWARD);
  motor3.run(FORWARD);
  motor4.run(FORWARD);
  motor1.setSpeed(speedCar);
  motor2.setSpeed(speedCar);
  motor3.setSpeed(speedCar);
  motor4.setSpeed(speedCar);
}

void backward()
{
  motor1.run(BACKWARD);
  motor2.run(BACKWARD);
  motor3.run(BACKWARD);
  motor4.run(BACKWARD);
  motor1.setSpeed(speedCar);
  motor2.setSpeed(speedCar);
  motor3.setSpeed(speedCar);
  motor4.setSpeed(speedCar);
}
void left()
{
  motor1.run(BACKWARD);
  motor2.run(RELEASE);
  motor3.run(RELEASE);
  motor4.run(BACKWARD);
  motor1.setSpeed(speedCar);
  motor4.setSpeed(speedCar);
}
void right()
{
  motor1.run(BACKWARD);
  motor2.run(FORWARD);
  motor3.run(FORWARD);
  motor4.run(BACKWARD);
  motor2.setSpeed(speedCar);
  motor3.setSpeed(speedCar);
}

void forwardRight()
{
  motor1.run(FORWARD);
  motor2.run(FORWARD);
  motor3.run(FORWARD);
  motor4.run(RELEASE);

  motor1.setSpeed(speedCar);
  motor2.setSpeed(speedCar);
  motor3.setSpeed(speedCar);
}

void forwardLeft()
{
  motor1.run(FORWARD);
  motor2.run(FORWARD);
  motor3.run(RELEASE);
  motor4.run(FORWARD);

  motor1.setSpeed(speedCar);
  motor2.setSpeed(speedCar);
  motor4.setSpeed(speedCar);
}
void backwardRight()
{
  motor1.run(BACKWARD);
  motor2.run(BACKWARD);
  motor3.run(BACKWARD);
  motor4.run(RELEASE);
  motor1.setSpeed(speedCar);
  motor2.setSpeed(speedCar);
  motor3.setSpeed(speedCar);
}
void backwardLeft()
{
  motor1.run(BACKWARD);
  motor2.run(BACKWARD);
  motor3.run(RELEASE);
  motor4.run(BACKWARD);
  motor1.setSpeed(speedCar);
  motor2.setSpeed(speedCar);
  motor4.setSpeed(speedCar);
}
void Stop()
{
  motor1.run(RELEASE);
  motor2.run(RELEASE);
  motor3.run(RELEASE);
  motor4.run(RELEASE);
}

void loop() {

  if (Serial.available() > 0) {
    command = Serial.read();
    Serial.println(command);
    Stop();       //Initialize with motors stopped.


    switch (command) {
      case 'F': forward(); break;
      case 'B': backward(); break;
      case 'L': left(); break;
      case 'R': right(); break;
      case 'I': forwardRight(); break;
      case 'G': forwardLeft(); break;
      case 'J': backwardRight(); break;
      case 'H': backwardLeft(); break;
      case 'S': Stop(); break;
      case '0': speedCar = 0; break;
      case '1': speedCar = 25; break;
      case '2': speedCar = 50; break;
      case '3': speedCar = 75; break;
      case '4': speedCar = 100; break;
      case '5': speedCar = 125; break;
      case '6': speedCar = 150; break;
      case '7': speedCar = 175; break;
      case '8': speedCar = 200; break;
      case '9': speedCar = 225; break;
      case 'q': speedCar = 255; break;

      

    }
    Serial.println(command);
  }
}
