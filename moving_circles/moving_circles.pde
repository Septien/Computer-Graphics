/*Implement of two circles moving around the screen*/

boolean loop = true;
Circle c1, c2;

void setup() {
  size(500, 400);
  stroke(255);
  //noLoop();
  
  c1 = new Circle( width/4, height/2, 50);
  c2 = new Circle(3 * width / 4, height / 2, 50);
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

float distance(int x1, int y1, int x2, int y2) {
  return sqrt( pow(x1 - x2, 2) + pow(y1 - y2, 2) );
}

class Circle {
  int xc, yc;
  int r;
  int vx;
  int vy;
  
  Circle(int ixc, int iyc, int ir) {
    xc = ixc;
    yc = iyc;
    r = ir;
    vx = (int) random(0, 10);
    vy = (int) random(0, 10);
  }
  
  /*Draw circle using hte Bresenham algorithm*/
  void draw_circle() {
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
  
  void move() {
    xc += vx;
    yc += vy;
    
    //Check for boundaries
    if (xc >= width - r )
      vx = -(int) random(0, 10);
    if (xc <= r)
      vx = (int) random(0, 10);
    if (yc >= height - r)
      vy = -(int) random(0, 10);
    if (yc <= r)
      vy = (int) random(0, 10); 
  }
}

void draw() {
  background(0);
  c1.draw_circle();
  c1.move();
  c2.draw_circle();
  c2.move();
}

/*void mousePressed() {
  if (loop) {
    loop();
    loop = false;
  }
  else {
    noLoop();
    loop = true;
  }
}*/