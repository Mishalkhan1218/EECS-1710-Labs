color bgColor = color(170, 170, 170);
float circleSize = 50;

void setup() {
  size(800, 600, P2D);
  background(bgColor);
}

void draw() {  
  if (mousePressed) {
    ellipseMode(CENTER);
    fill(random(256), random(256), random(256));
    stroke(10, 0, 0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, circleSize, circleSize);
  }
}
