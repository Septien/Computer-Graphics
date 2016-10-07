float y;
boolean loop = true;

void setup() { 
  size(700, 600);
  background(255);
  stroke(0, 0, 255);
  noLoop();
  y = height / 2;
}

void draw() {
  background(255);
  line(0, y, width, y);
  y = (y + 1)%height;
}

void mousePressed() {
  if (loop) {
    loop();
    loop = false;
  }
  else {
    noLoop();
    loop = true;
  }
}