//Implementación del algoritmo de Bresenham para dibujado de lineas

void setup() {
  size(640, 480);
  background(255);
}

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

void draw() {
  shBresenham(0, 0, 200, 200);
}