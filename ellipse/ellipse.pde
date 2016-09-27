PFont f;

void setup() {
  size(700, 600);
  background(255);
  stroke(0, 0, 255);
  //Color of the font
  fill(0);
  //Font and size
  f = createFont("Arial", 20, true);
}

void shellipse(int xc, int yc, int r1, int r2) {
  float x, y;
  for (x = xc-r1; x < xc + r1; x += 0.1) {
    y = (r2 * sqrt(1 - pow((x - xc)/r1, 2)));
    point(x,y + yc);
    point(x, -y + yc);
  }
}

void draw() {
  shellipse(50, 50, 100, 40);
}