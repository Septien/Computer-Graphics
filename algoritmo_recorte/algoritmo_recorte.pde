boolean in_range(float n) {
  if ( 0 <= n && n <= 1)
    return true;
  return false;
}

boolean intersection(Punto Q, Punto R, Punto A, Punto B, Punto P) {
  float t, tp;
  
  t = ( ((A.y - Q.y) / (R.y - Q.y)) - ((A.x - Q.x) / (R.x - Q.x)) ) / ( ((B.x - A.x) / (R.x - Q.x)) / ((B.y - A.y) / (R.y - Q.y)) );
  tp = ( ((Q.y - A.y) / (B.y - A.y)) - ((Q.x - A.x) / (B.x - A.x)) ) / ( ((R.x - Q.x) / (B.x - A.x)) - ((R.y - Q.y) / (B.y - A.y)) );
  
  if (Float.isNaN(t))
    return false;
  if (Float.isNaN(tp))
    return false;
  if (!in_range(t))
    return false;
  if (!in_range(tp))
    return false;
    
  P.x = A.x + t * (B.x - A.x);
  P.y = A.y + t * (B.y - A.y);
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
    strokeWeight(5);
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
Segmento seg;

void setup() {
  size(500, 500);
  background(255);
  
  Punto p, r;
  p = new Punto(100, 100);
  r = new Punto(300, 300);
  
  rect = new Rectangulo(p, r);
  rect.draw_rect();
  p.x = 80;
  p.y = 290;
  r.x = 250;
  r.y = 110;
  seg = new Segmento(p, r);
  seg.draw_segment();
  noLoop();
}

void draw() {
  rect.recortar(seg); //<>//
}