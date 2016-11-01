int Tx, Ty;

void setup() {
  size(600, 400);
  background(0);
  stroke(255);
  Tx = 300;
  Ty = 0;
  noLoop();
}

void sh2DReflexionX() {
  int i, j;
  color c;
  for (i = 0; i < width; i++)
    for (j = 0; j < height; j++) {
      c = get(i, j);
      if (c == color(255))
        point(i + Tx, -j + Ty);
    }
}

/**
** Reflects around the Y aixs.
**/
void sh2DReflexionY() {
  int i, j;
  color c;
  for (i = 0; i < width; i++)
    for (j = 0; j < height; j++) {
      c = get(i, j);
      if (c == color(255))
        point(-i + Tx, j + Ty);
    }
}

/**
** Reflects around the line y = x
**/
void sh2DReflexionYX() {
  int i, j;
  color c;
  for (i = 0; i < width; i++)
    for (j = 0; j < height; j++) {
      c = get(i, j);
      if (c == color(255))
        point(j + Tx, i + Ty);
    }
}

void draw() {
  triangle(50, 10, 10, 100, 90, 100);
  //sh2DReflexionX();
  //sh2DReflexionY();
  sh2DReflexionYX();
}