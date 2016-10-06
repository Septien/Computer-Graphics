void setup() {
  size(500, 400);
  background(255);
  stroke(0, 0, 255);
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

/**Generation of circle using algorithm of middle point
** inputs: 
**  *(xc, yc): center of the circle
**  *r: radius of the circle
**/
void shcircleMiddlePoint(int xc, int yc, int r) {
  int x, y;
  float d;
  
  //Starting point
  x = 0;
  y = r;
  
  //Initial distance
  d = (5.0 / 4.0) - r;
  while (x <= y) {
    circlePoint(x, y, xc, yc);
    if (d < 0) {
      d = d + (2 * x) + 1;
    }
    else {
      d = d + (2 * x) - (2 * y) + 5;
      y--;
    }
    x++;
  }
}

void draw() {
  point(width/2, height/2);
  shcircleMiddlePoint(width/2, height/2, 90);
}