//Implementation of a function that draws a rectangle with lines
//using the Bresenham algorith
void setup() {
  size(700, 600);
  background(255);
  stroke(0, 255, 0);
}

//Implementation, input: line end-points
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

//Draws a fill rectangle. Input: Upper-left corner and lower-right corner
void shrectangle(int x0, int y0, int x1, int y1) {
  int i;
  //y coordinate of the line
  int y;
  //Calculate rectangle height
  int d = y1 - y0;
  //Iterate over every line of the rectangle
  for (i = 0; i < d; i++) {
    //Calculate the y coordinate of the corresponding line
    y = y0 + i;
    shBresenham(x0, y, x1, y);
  }
}

void draw() {
  shrectangle(0, 0, width, height);
}