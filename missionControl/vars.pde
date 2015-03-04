// gcode vars
int sleep = 5; // sleep time during servo movement
float zcoord = 0; //z coord, increment with sleep
float rescale = 0.3521; // scale factor from SVG space to cm
boolean paused = true;
boolean loaded = false;

float currentX = 0;
float currentY = 0;
int move = 10;

int currentPath = 0;
int currentPoint = 0;

boolean onlySelected = false;

// Geomerative vars
RShape grp;
RPoint[][] pointPaths;
boolean ignoringStyles = true; // we just want the path

// ControlP5 vars
ControlP5 cp5;

// Serial vars
Serial tool;
Serial plotter;

// ARDUINO PORT TO REPLACE
String grbl = "/dev/tty.usbmodem14211";
