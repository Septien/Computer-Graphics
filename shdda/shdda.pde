//Implementacion del algoritmo DDA para dibujar lineas
void setup() {
  size(640, 480);
  background(255);
  stroke(0);
}

void shdda(int x1, int y1, int x2, int y2) {
  int dx, dy, k, steps;
  float x_inc, y_inc, x, y;
  
  dx = x2 - x1;
  dy = y2 - y1;
  
  if (abs(dx) > abs(dy))
    steps = dx;
   else
     steps = dy;
   
   x_inc = dx / steps;
   y_inc = dy / steps;
   x = x1;
   y = y1;
   
   point(x, y);
   for (k = 0; k < steps; k++) {
     x = x + x_inc;
     y = y + y_inc;
     point(x, y);
   }
}

void draw() {
  shdda(100, 100, 200, 200);
}