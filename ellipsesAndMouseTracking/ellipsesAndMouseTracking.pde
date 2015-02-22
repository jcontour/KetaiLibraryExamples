//Test app drawing ellipses and tracking finger
void setup(){
}
void draw() {
        ellipse(mouseX, mouseY, mouseX-pmouseX, mouseY-pmouseY);
}
void mousePressed () {
 println("Pressed x: " + mouseX + "y: " + mouseY);
}
void mouseReleased () {
 println("Released x: " + mouseX + "y: " + mouseY);
}
void mouseDragged () {
 println("Dragged x: " + mouseX + "y: " + mouseY);
}
