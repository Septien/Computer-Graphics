
void setup() { 
  size(700, 600);
  background(0);
  stroke(255);
  noLoop();
}

/**
** Search all the points in the screen.
** If the color of it is white, scale the 
** point by (sx, sy)
**/
void shScale(int sx, int sy) {
  int i, j;
  color c;
  for (i = 0; i < width; i++)
    for (j = 0; j < height; j++) {
      c = get(i, j);
      if (c == color(255))
        point(sx * i, sy * j);
    }
}

void draw() {
  rect(100, 100, 150, 150);
  shScale(2, 2);
}