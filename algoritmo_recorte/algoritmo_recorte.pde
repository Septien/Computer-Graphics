boolean in_range(float n) {
  if ( 0 <= n && n <= 1)
    return true;
  return false;
}

boolean intersection(Punto Q, Punto R, Punto A, Punto B, Punto P) {
  float t, tp;
  
  tp = ( ((Q.y - A.y) / (B.y - A.y)) - ((Q.x - A.x) / (B.x - A.x)) ) / ( ((R.x - Q.x) / (B.x - A.x)) - ((R.y - Q.y) / (B.y - A.y)) );
  t = (Q.x - A.x + tp * (R.x - Q.x)) / (B.x - A.x);
  
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
  color c;
  Segmento(Punto na, Punto nb) {
    a = na;
    b = nb;
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }

  void set_color(color nc) {
    c = nc;
  }
  
  void draw_segment() {
    stroke(c);
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
  
  //Dentro del rectangulo
  boolean dentro(Punto a) {
    Punto centro;
    centro = new Punto((P.x + R.x)/2, (P.y + R.y)/2);
    //Calcula el tamaño de los lados del rectangulo
    float l1 = dist(P.x, P.y, Q.x, Q.y);
    float l2 = dist(P.x, P.y, S.x, S.y);
    if (abs(a.x - centro.x) < l1/2 && abs(a.y - centro.y) < l2/2)
      return true;
    return false;
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