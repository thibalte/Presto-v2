//
// Presto v2 Servo Controller firmware
// Thibault Brevet, 2015.
//
// flash on ATTiny45/85
//

#include <SoftwareServo.h>

// settings
SoftwareServo servo;
int in = 0;
int pot = A1;
int up = 0; // servo doesnt like super small value

void setup()
{
  // init stuff
  pinMode(in, INPUT);
  pinMode(pot, INPUT);
  servo.attach(1);
  // overwrite defaults
  servo.setMinimumPulse(500);
  servo.setMaximumPulse(2400);
}

void loop() {
  // check what setting is with the pot
  int down = map(analogRead(pot), 0, 1024, 0, 180);
  int val = digitalRead(in);
  delay(1);

  // if the input is HIGH set the servo down
  if (val){
    // move down
    servo.write(down);
  } else {
    // else move up
    servo.write(up);
  }

  SoftwareServo::refresh();
  delay(10);
}
