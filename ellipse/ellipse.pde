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

//Draws a ellipse using its general equation
void shellipse(int xc, int yc, int r1, int r2) {
  float x, y;
  for (x = xc-r1; x < xc + r1; x += 0.1) {
    y = sqrt(pow(r1*r2, 2) - pow(r2*(x - xc), 2)) / r1;
    point(x,y + yc);
    point(x, -y + yc);
  }
}

//Draw an ellipse using polar coordinates
void shcellipse(int xc, int yc, int r1, int r2) {
  int theta;
  for (theta = 0; theta < 360; theta++) {
    point(xc + (r1*cos((theta*TWO_PI)/360.0)), yc + (r2*sin((theta*TWO_PI)/360.0)));
  }
}

void draw() {
  //shellipse(width/2, height/2, 100, 40);
  shcellipse(width/2, height/2, 100, 40);
}