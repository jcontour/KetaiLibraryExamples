//for computer

import oscP5.*;
import netP5.*;


OscP5 oscP5;
//creating an address for the phone to look for
NetAddress remoteLocation;
float accelerometerX, accelerometerY, accelerometerZ;

void setup() {
  size(480, 480);
  //initializing oscp5 port number and remote location
  oscP5 = new OscP5(this, 12001);
  //must have IP address of phone, which changes based on location
  remoteLocation = new NetAddress("10.0.1.155", 12001); //(1) Customize!
  textAlign(CENTER, CENTER);
  textSize(24);
}

void draw() {
  background(78, 93, 75);
  text("Remote Accelerometer Info: " + "\n" +
  //nfp = number formatting protocol, adds number of digits to data
    "x: "+ nfp(accelerometerX, 1, 3) + "\n" +
    "y: "+ nfp(accelerometerY, 1, 3) + "\n" +
    "z: "+ nfp(accelerometerZ, 1, 3) + "\n\n" +
    "Local Info: \n" + 
    "mousePressed: " + mousePressed, width/2, height/2);

//creating a message with this data and sending to remote location
  OscMessage myMessage = new OscMessage("mouseStatus");
  myMessage.add(mouseX);  //(2)
  myMessage.add(mouseY);  //(3)
  myMessage.add(int(mousePressed)); //(4)
  oscP5.send(myMessage, remoteLocation); //(5)
}

//checking for an osc message arrival
//make sure it's the right data type "fff" means 3 floats
void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkTypetag("fff"))  //(6)
  {
    accelerometerX =  theOscMessage.get(0).floatValue(); //(7)
    accelerometerY =  theOscMessage.get(1).floatValue();
    accelerometerZ =  theOscMessage.get(2).floatValue();
  }
}
