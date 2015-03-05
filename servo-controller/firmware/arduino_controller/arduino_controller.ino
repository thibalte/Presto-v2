//
// SERVO CONTROL with arduino
// 
// connect GND from arduino to other Arduino
// connect pin 13 to pin 13 of other Arduino
//
// connect GND of Arduino to BLACK cable of servo
// connect 5V of Arduino to RED cable of servo (middle cable)
// connect pin 9 of Arduino to ORANGE cable of servo (opposite of black/brown)
//

#include <Servo.h> 

int in = 13;

Servo servo;

// valeurs de position haute et basse à régler en testant M3 et M4 depuis le moniteur série d'Arduino (de 0 à 180 degres)
int up = 30;
int down = 150;

void setup() {
  servo.attach(9);
  pinMode(in, INPUT);
}

void loop() {
  if (digitalRead(in)){
    servo.write(down);
  } else {
    servo.write(up);
  }
  delay(10);
}
