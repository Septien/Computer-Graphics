int i, j, k;
float x, y;

void setup() {
  size(640, 480);
  background(255);
  stroke(0);
}

void draw_line(float w, float h, boolean horizontal) {
  if (horizontal) {
    for (i = 0; i < w; i++) {
      y = h / 2;
      point(i, y);
    }
  } else {
    for (i = 0; i < h; i++) {
      x = w / 2;
      point(x, i);
    }
  }
}

void draw() {
  //Pinta linea horizontal
  draw_line(width, height, true);

  //Pinta linea vertical
  draw_line(width, height, false);
}