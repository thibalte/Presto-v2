#include <SoftwareServo.h>

// settings
SoftwareServo servo;
int in = 0;
int pot = A1;
int up = 0;

void setup()
{ 
  // init stuff
  pinMode(in, INPUT);
  pinMode(pot, INPUT);
  servo.attach(1);
}

void loop() {
  // check what setting is with the pot
  int down = analogRead(pot) / 4;
  
  // if the input is HIGH set the servo down
  if (digitalRead(in)){
    // move down
    servo.write(down);
    SoftwareServo::refresh();
  } else {
    // else move up
    servo.write(up);
    SoftwareServo::refresh();
  }
}
