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
    a = new Punto(na.x, na.y);
    b = new Punto(nb.x, nb.y);
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
  color c;
  Rectangulo(Punto p, Punto r) {
    P = new Punto(p.x, p.y);
    R = new Punto(r.x, r.y);
    Q = new Punto(r.x, p.y);
    S = new Punto(p.x, r.y);
    c = color(random(0,255), random(0,255), random(0,255));
  }
  
  void draw_rect() {
    stroke(c);
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
    Segmento saux = new Segmento(p, p);
    boolean intersect = false;
    
    //Segment complety inside of rectangle
    if (dentro(s.a) && dentro(s.b))
      return true;
    
    //Points of segment outside of box
    else if (!dentro(s.a) && !dentro(s.b)) {
      boolean a = false;
      if ( intersection(P, Q, s.a, s.b, p) ) {
        saux.a.x = p.x;
        saux.a.y = p.y;
        a = true;
        intersect = true;
      }
      if ( intersection(Q, R, s.a, s.b, p) ) {
        if (!a) {
          saux.a.x = p.x;
          saux.a.y = p.y;
          a = true;
        }
        else {
          saux.b.x = p.x;
          saux.b.y = p.y;
        }
        intersect = true;
      }
       
      if ( intersection(R, S, s.a, s.b, p) ) {
        if (!a) {
          saux.a.x = p.x;
          saux.a.y = p.y;
          a = true;
        }
        else {
          saux.b.x = p.x;
          saux.b.y = p.y;
        }
        intersect = true;
      }
      
      if ( intersection(P, S, s.a, s.b, p) ) {
        if (!a) {
          saux.a.x = p.x;
          saux.a.y = p.y;
          a = true;
        }
        else {
          saux.b.x = p.x;
          saux.b.y = p.y;
        }
        intersect = true;
      }
      if (intersect) {
        s.a.x = saux.a.x;
        s.a.y = saux.a.y;
        s.b.x = saux.b.x;
        s.b.y = saux.b.y;
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
        intersect = true;
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
      intersect = true;
    }
    return intersect;
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
  n = 10;
  seg = new Segmento[n];
  for (i = 0; i < n; i++) {
    p = new Punto(random(0, width), random(0, height)); 
    r = new Punto(random(0, width), random(0, height));
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
  p = new Punto(mouseX, mouseY);
}

void mouseReleased() {
  r = new Punto(mouseX, mouseY);
  rect = new Rectangulo(p, r);  
  r_created = true;
}