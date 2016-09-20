size(300, 300);
background(255);    //fondo negro
stroke(0);      //punto blanco

float x = 10, y;
float m = 1.0;         //Pendiente, 45°
int i;
for (i = 0; i < 200; i++) {
  y = -m * x + 250;
  x += 1;
  point(x, y);
}