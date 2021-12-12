PImage img;

void setup() {
  size(711, 400);
  img = loadImage("PA.png");
  background(0);
}

void draw() {
  
  for (int i = 0; i < 10; i++) {
    float x = random(width);
    float y = random(height);
    color c = img.get(int(x), int(y));
    fill(c, 25);
    noStroke();
    rect(x, y,25, 25);
  }
}
