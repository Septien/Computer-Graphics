
void setup() {
  size(600, 400);
  background(0);
  stroke(255);
  noLoop();
}

void sh2DShearX(int shx) {
  int i, j;
  color c;
  for (i = 0; i < width; i++)
    for (j = 0; j < height; j++) {
      c = get(i, j);
      if (c == color(255))
        point(i + j*shx, j);
    }
}

void sh2DShearY(int shy) {
  int i, j;
  color c;
  for (i = 0; i < width; i++)
    for (j = 0; j < height; j++) {
      c = get(i, j);
      if (c == color(255))
        point(i, j + i*shy);
    }
}

void draw() {
  rect(10, 10, 50, 20);
  //sh2DShearX(2);
  sh2DShearY(2);
}