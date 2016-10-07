
void setup() { 
  size(700, 600);
  background(0);
  stroke(255);
  noLoop();
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

void draw() {
  rect(100, 100, 120, 120);
  sh2DTranslate(210, 21);
}