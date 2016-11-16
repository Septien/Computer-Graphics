color backg = color(255);

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
  
  boolean recortar(Segmento s) {
    Punto p = new Punto(0,0);
    //Segment complety inside of rectangle
    if (dentro(s.a) && dentro(s.b))
      return true;
    
    //Points of segment outside of box
    else if (!dentro(s.a) && !dentro(s.b)) {
      boolean a = false;
      if ( intersection(P, Q, s.a, s.b, p) ) {
        s.a = p;
        a = true;
      }
      if ( intersection(Q, R, s.a, s.b, p) ) {
        if (!a) {
          s.a = p;
          a = true;
        }
        else
          s.b = p;
      }
       
      if ( intersection(R, S, s.a, s.b, p) ) {
        if (!a) {
          s.a = p;
          a = true;
        }
        else
          s.b = p;
      }
      
      if ( intersection(S, P, s.a, s.b, p) ) {
        if (!a) {
          s.a = p;
          a = true;
        }
        else
          s.b = p;
      }
    }
    
    else if (dentro(s.a)) {
      if ( intersection(P, Q, s.a, s.b, p) )
        s.b = p;
      if ( intersection(Q, R, s.a, s.b, p) )
        s.b = p;
      if ( intersection(R, S, s.a, s.b, p) )
        s.b = p;
      if ( intersection(S, P, s.a, s.b, p) )
        s.b = p;
    }
    
    else if (dentro(s.b)) {
      if ( intersection(P, Q, s.a, s.b, p) )
        s.a = p;
      if ( intersection(Q, R, s.a, s.b, p) )
        s.a = p;
      if ( intersection(R, S, s.a, s.b, p) )
        s.a = p;
      if ( intersection(S, P, s.a, s.b, p) )
        s.a = p;
    }
    else
      return false;
    return true;
  }
}

Rectangulo rect;
Segmento[] seg;
int n;
Punto p, r;
boolean r_created;

void setup() {
  int i;
  size(500, 500);
  background(backg);
  
  p = new Punto(0, 0);
  r = new Punto(0, 0);
  n = 20;
  seg = new Segmento[n];
  for (i = 0; i < n; i++) {
    p.x = random(0, width);
    p.y = random(0, height);
    r.x = random(0, width);
    r.y = random(0, height);
    seg[i] = new Segmento(p, r);
    seg[i].draw_segment();
  }
  r_created = false;
}

void draw() {
  int i;
  if (r_created) {
    background(backg);
    rect.draw_rect();
    for (i = 0; i < n; i++) {
      if (rect.recortar(seg[i]))
        seg[i].draw_segment();
    }
  }
}

void mousePressed() {
  p.x = mouseX;
  p.y = mouseY;
}

void mouseReleased() {
  r.x = mouseX;
  r.y = mouseY;
  rect = new Rectangulo(p, r);  
  r_created = true;
}