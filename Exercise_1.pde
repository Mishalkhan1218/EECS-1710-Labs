color bgColor = color(128, 0, 128);
float circleSize = 100;

void setup() {
  size(800, 600, P2D);
  background(bgColor);
}

void draw() {  
  if (mousePressed) {
    ellipseMode(CENTER);
    fill(0, 127, 255);
    stroke(255, 0, 0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, circleSize, circleSize);
  }
}
