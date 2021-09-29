PImage img;
PImage back;

void setup() {
  size(750, 400, P2D);
  img = loadImage("Hakipunches.png");
  img.resize(img.width/5, img.height/5);
  back = loadImage("Luffybackground.png");
}

void draw() {
  background(back);
  
  for (int i=0; i<10; i++){
    float x = random(width);
    float y = random(height);
    
    for (int j=0; j<10; j++) {
      float x2 = x + j;
      float y2 = y + j * 10;
      float alphaVal = abs(255 - ((y2 / height) * 255));
      tint(255, alphaVal);
      image(img, x2, y2);
    }
  }
}
