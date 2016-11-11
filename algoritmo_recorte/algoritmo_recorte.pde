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

class Punto {
  float x;
  float y;
  Punto (float px, float py) {
    x = px;
    y = py;
  }
}

class Segmento {
  Punto a;
  Punto b;
  Segmento(Punto na, Punto nb) {
    a = na;
    b = nb;
  }
  
  void draw_segment() {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(a.x, a.y, b.x, b.y);
  }
}

class Rectangulo {
  Punto P;
  Punto Q;
  Punto R;
  Punto S;
  Rectangulo(Punto p, Punto r) {
    P = new Punto(p.x, p.y);
    R = new Punto(r.x, r.y);
    Q = new Punto(r.x, p.y);
    S = new Punto(p.x, r.y);
  }
  
  void draw_rect() {
    line(P.x, P.y, Q.x, Q.y);
    line(Q.x, Q.y, R.x, R.y);
    line(R.x, R.y, S.x, S.y);
    line(S.x, S.y, P.x, P.y);
  }
  
  void recortar(Segmento s) {
    Punto p = new Punto(0,0);
    if ( intersection(P, Q, s.a, s.b, p) ) {
      point(p.x, p.y);
    }
    p.x = 0;
    p.y = 0;
    if ( intersection(Q, R, s.a, s.b, p) ) {
      point(p.x, p.y);
    }
    p.x = 0;
    p.y = 0;
    if ( intersection(R, S, s.a, s.b, p) ) {
      point(p.x, p.y);
    }
    p.x = 0;
    p.y = 0;
    if ( intersection(S, P, s.a, s.b, p) ) {
      point(p.x, p.y);
    }
  }
}

Rectangulo rect;

void setup() {
  size(500, 500);
  background(255);
  
  Punto p, r;
  p = new Punto(100, 100);
  r = new Punto(300, 300);
  
  rect = new Rectangulo(p, r);
  rect.draw_rect();
  
  noLoop();
}

void draw() {

}