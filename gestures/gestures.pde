//callbacks for different types of finger movement on phone
import ketai.ui.*; 
import android.view.MotionEvent; 

KetaiGesture gesture;
float  rectSize = 100;
float rectAngle = 0;
int x,y;

color c = color(255);
color bg = color(70,80,80);

void setup()
{
  orientation(LANDSCAPE); 
  gesture = new KetaiGesture(this);

  textSize(30);
  textAlign(CENTER,BOTTOM);
  
  rectMode(CENTER);
  noStroke();
  
  x=width/2;
  y=height/2;
}
void draw() {
  background(bg);
  pushMatrix();
  translate(x, y);
  rotate(rectAngle);
  fill(c);
  rect(0, 0, rectSize, rectSize);
  popMatrix();
}

void onTap(float x, float y){
  text("Single",x,y-20);
  println("Single: "+x+","+y);
}

void onDoubleTap(float x, float y){
  text("Double",x,y-20);
  println("Double: "+x+","+y);
  
  if(rectSize>100)
    rectSize = 100;
  else  
    rectSize = height - 100;
}

void onLongPress(float x, float y){
  text("LongPress",x,y-20);
  println("LongPress: "+x+","+y);

  c = color(random(255), random(255), random(255));
}

void onPinch(float x, float y, float d){
  text("Pinch",x,y-20);
  println("Pinch: "+x+","+y+","+d);

  rectSize = constrain(rectSize+d, 100, 400);

  
}

void onFlick(float x, float y , float px, float py, float v){
  text("Flick",x,y-20);
  println("Flick: "+x+","+y+","+v);

  bg = color(random(255), random(255), random(255));

}

void onRotate(float x, float y, float angle){
  text("Rotate",x,y-20);
  println("Rotate: "+ angle);

  rectAngle+= angle;
}

void mouseDragged() {
  if (abs(mouseX - x) < rectSize/2 && abs(mouseY - y) < rectSize/2)
  {
    if (abs(mouseX - pmouseX) < rectSize/2) 
      x += mouseX - pmouseX;
    if (abs(mouseY - pmouseY) < rectSize/2) 
      y += mouseY - pmouseY;
  }  
}

public boolean surfaceTouchEvent(MotionEvent event) {  
  //call to keep mouseX and mouseY constants updated
  super.surfaceTouchEvent(event);
  //forward events
  return gesture.surfaceTouchEvent(event);
}
