float y;
boolean loop = true;

void setup() { 
  size(700, 600);
  background(255);
  stroke(0, 0, 255);
  noLoop();
  y = height / 2;
}

/**Draws eight points of a circle using its simetry property
** inputs:
**  *(x,y): Current point of the circle.
**  *(xc, yc): Center of the circle.
**/
void circlePoint(int x, int y, int xc, int yc) {
  point(x + xc, y + yc);
  point(y + xc, x + yc);
  point(-y + xc, x + yc);
  point(-x + xc, y + yc);
  point(-x + xc, -y + yc);
  point(-y + xc, -x + yc);
  point(y + xc, -x + yc);
  point(x + xc, -y + yc);
}

void shcircleBresenham2(int xc, int yc, int r) {
  int x, y, e;
  
  //Starting point
  x = r;
  y = 0;
  //Initial error
  e = 0;
  while (x >= y) {
    circlePoint(x, y, xc, yc);
    e += (2 * y) + 1;
    y++;
    if ((2 * e) > (2*x - 1)) {
      e += -(2 * x) + 1;
      x--;
    }
  }
}

void draw() {
  int r = 100;
  background(255);
  shcircleBresenham2(width/2, (int)y, r);
  //line(0, y, width, y);
  y = (y + 1)%(height + r);
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