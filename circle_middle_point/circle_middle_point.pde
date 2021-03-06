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
  int x, y, d;
  
  //Starting point
  x = 0;
  y = r;
  
  //Initial distance
  d = 1 - r;
  while (x <= y) {
    circlePoint(x, y, xc, yc);
    if (d < 0) {
      d += (2 * x) + 1;
    }
    else {
      d += (2 * x) - (2 * y) + 5;
      y--;
    }
    x++;
  }
}

/**Generation of circle using algorithm of second difference
** inputs: 
**  *(xc, yc): center of the circle
**  *r: radius of the circle
**/
void shcircleSecondDifference(int xc, int yc, int r) {
  int x, y, d;
  int de, dse; //Second differences
  
  //Starting point
  x = 0;
  y = r;
  
  //Initial distance
  //d = (5.0 / 4.0) - r;
  d = 1 - r;
  de = 3;
  dse = 5 - (2 * r);
  while (x <= y) {
    circlePoint(x, y, xc, yc);
    if (d < 0) {
      d += de;
      de += 2;
      dse += 2;
    }
    else {
      d += dse;
      de += 2;
      dse += 4;
      y--;
    }
    x++;
  }
}

//Bresenham algorithm for generating circles
void shcircleBresenham(int xc, int yc, int r) {
  int x, y, p;
  
  //Starting point
  x = 0;
  y = r;
  //Initial p
  p = 3 - (2 * r);
  while (x <= y) {
    circlePoint(x, y, xc, yc);
    if (p < 0)
      p = p + (4 * x) + 6;
    else {
      p = p + (4 * (x - y)) + 10;
      y--;
    }
    x++;
  }
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
  point(width/2, height/2);
  //shcircleMiddlePoint(width/2, height/2, 90);
  for (int i = 0; i < 20; i++) 
    shcircleMiddlePoint(width/2, height/2, 10 + 10 * i);
  //shcircleMiddlePoint(width/2, height/2, 90);
  //shcircleSecondDifference(width/2, height/2, 100);
  //shcircleBresenham(width/2, height/2, 20);
  shcircleBresenham2(width/2, height/2, 100);
}