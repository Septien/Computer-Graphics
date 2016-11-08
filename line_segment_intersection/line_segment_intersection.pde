class Punto {
  float x;
  float y;
  Punto (float px, float py) {
    x = px;
    y = py;
  }
}

void setup() {
  size(500, 500);
  background(255);
}

boolean in_range(float n) {
  if ( 0 <= n && n <= 1)
    return true;
  return false;
}

boolean intersection(Punto A, Punto B, Punto C, Punto D, Punto P) {
  float r, s;
  float dem_r, dem_s;
  float num;
  
  dem_r = (A.y - C.y) * (D.x - C.x) - (A.x - C.x) * (D.y - C.y);
  dem_s = (A.y - C.y) * (B.x - A.x) - (A.x - C.x) * (B.y - A.y);
  num = (B.x - A.y) * (D.y - C.y) - (B.y - A.y) * (D.x - C.x);
  
  if (dem_r == 0 || dem_r == 1)
    return false;
  r = dem_r / num;
  s = dem_s / num;

  if ( !in_range(r) )
    return false;
  if ( !in_range(s) )
    return false;
    
  P.x = A.x + r * (B.x - A.x);
  P.y = A.y + r * (B.y - A.y);
  return true;
}

void draw() {
   Punto A, B, C, D, P;
   A = new Punto(width - 10, 10);
   B = new Punto(width - 10, height - 10);
   C = new Punto(width - 10, 10);
   D = new Punto(10, height - 10);
   P = new Punto(0, 0);

  strokeWeight(1);
   stroke(0, 255, 0);
   line(A.x, A.y, B.x, B.y);
   line(C.x, C.y, D.x, D.y);
   
   stroke(0, 0, 255);
   strokeWeight(10);
   if ( intersection(A, B, C, D, P) )
     point(P.x, P.y);
}