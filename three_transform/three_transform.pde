float theta1;

void setup() {
  size(400, 400);
  background(0);
  stroke(255);
  theta1 = 45.0;
  rect(width/2 - 25, height/2 - 25, 50, 50);
  //noLoop();
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
        set(i, j, 0);
        point(i + tx, j + ty);
      }
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
      if (c == color(255)) {
        set(i, j, 0);
        point(xr + ((j - xr) * cos(theta)) - ((i - yr) * sin(theta)), yr + ((i - yr) * cos(theta)) + ((j - xr) * sin(theta)) );
      }
    }
}

void draw() {
  /*translate(width/2, height/2);
  rotate(45.0);
  scale(5);*/
  //background(0);
  
  //for (theta = 0; theta < 360; theta += 0.01) {
  sh2DRotation(theta1*TWO_PI/360.0, width/2, height/2);
  theta1 += 1.0;
  if (theta1 == 360.0)
    theta1 = 0;
  //}
  //sh2DTranslate(width/2 - 15, height/2 - 15);
  //shScale(5, 5);
}