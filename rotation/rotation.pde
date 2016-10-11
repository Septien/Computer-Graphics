void setup() { 
  size(700, 600);
  background(0);
  stroke(0, 255, 0);
  noLoop();
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

void draw() {
  rect(100, 100, 200, 200);
  //rect((width/2) + 100, (height/2) + 100, (width/2) + 120, (height/2) + 120
  stroke(255, 0, 0);
  sh2DRotation(20*TWO_PI/360.0, 100, 100);
}