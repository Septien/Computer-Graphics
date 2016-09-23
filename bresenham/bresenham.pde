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
  //shBresenham(0, 0, 200, 200);
  int w = width / 2, h = height / 2;
  float theta = 0;
  float inc = TWO_PI / 16.0;
  int x0 , y0;
  int x1, y1;
  int i;
  
  stroke(0);
  for (i = 0; i < 16; i++) {
    x1 = w + (int(200.0*cos(theta)));
    y1 = h + (int(200.0*sin(theta)));
    shBresenham(w, h, x1, y1);
    theta += inc;
  }
  /*shBresenham(w, h, w+(int(200.0*cos(0))), h + (int(200.0*sin(0))));
  shBresenham(w, h, w+(int(200.0*cos(PI/10.0))), h + (int(200.0*sin(PI/10.0))));
  shBresenham(w, h, w+(int(200.0*cos(PI/5.0))), h + (int(200.0*sin(PI/5.0))));
  shBresenham(w, h, w+(int(200.0*cos(PI/3.3333))), h + (int(200.0*sin(PI/3.3333))));
  /*for (i = 0; i < 20; i++) {
    if (i%2 == 0)
      stroke(255, 0, 0);
     else
       stroke(0);
     shBresenham(w, h, x1, y1);
     div = 180.0 / theta;
     x1 = w + (int(200.0*cos(PI/(div))));
     y1 = h + (int(200.0*sin(PI/(div))));
     x0 = int(200*cos(theta+180)) + w;
     y0 = int(200*sin(theta+180)) + h;
     theta += 18;
  }*/
}