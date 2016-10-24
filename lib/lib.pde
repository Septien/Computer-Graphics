/*Library Containing the functions seen so far.*/

/*Function for drawing a line*/
void shBresenham(int x0, int y0, int x1, int y1) {
  int x, y, dx, dy, p, incE, incNE, xend;
  dx = abs(x1 - x0);
  dy = abs(y1 - y0);
  p = (2*dy) - dx;
  incE = 2 * dy;
  incNE = 2 * (dy - dx);
  
  //Determinar el punto de inicio y de fin
  if (x0 > x1) {
    x = x1;
    y = y1;
    xend = x0;
  }
  else {
    x = x0;
    y = y0;
    xend = x1;
  }
  point(x0, y0);
  //Iterar hasta recorrer toda la línea
  while (x <= xend) {
    point(x,y);
    x = x + 1;
    if (p < 0)
      p = p + incE;
    else {
      y = y + 1;
      p = p + incNE;
    }
  }
}

/*Function for drawing a circle.*/
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

//Draw an ellipse using polar coordinates
void shcellipse(int xc, int yc, int r1, int r2) {
  int theta;
  for (theta = 0; theta < 360; theta++) {
    point(xc + (r1*cos((theta*TWO_PI)/360.0)), yc + (r2*sin((theta*TWO_PI)/360.0)));
  }
}

/**
** Search all the points in the screen.
** If the color of it is white, tranlate the 
** point by (tx, ty)
**/
void sh2DTranslate(int tx, int ty) {
  int i, j;
  color c;
  for ( i = 0; i < width; i++)
    for (j = 0; j < height; j++) {
      c = get(i, j);
      if (c == color(255)) {
        //set(i, j, 0);
        point(i + tx, j + ty);
      }
    }
}

/* Search all points in the screen.
*  If point is of the given color, 
*  rotate it by theta radians
*/
void sh2DRotation(float theta, int xr, int yr) {
  int i, j;
  color c;
  for (j = 0; j < width; j++)
    for (i = 0; i < height; i++) {
      c = get(i, j);
      if (c == color(255))
        point(xr + ((j - xr) * cos(theta)) - ((i - yr) * sin(theta)), yr + ((i - yr) * cos(theta)) + ((j - xr) * sin(theta)) );
    }
}

/**
** Scale around a fixed point (xf, yf)
**/
void shFixedScale(int xf, int yf, int sx, int sy) {
  int i, j;
  color c;
  for (i = 0; i < width; i++)
    for (j = 0; j < height; j++) {
      c = get(i, j);
      if (c == color(255))
        point(xf + (i - xf)*sx, yf + (j - yf)*sy);
    }
}