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

//draws limacos
void shlimacos(float xc, float yc, float a, float b) {
  float theta, r;
  for (theta = 0; theta < 720; theta += 0.1) {
    r = b + a * cos((theta*TWO_PI)/360.0);
    point(xc + (r*cos((theta*TWO_PI)/360.0)), yc + (r*sin((theta*TWO_PI)/360.0)));
  }
}

void draw() {
  shlimacos(width/2, height/2, 100, 30);
}