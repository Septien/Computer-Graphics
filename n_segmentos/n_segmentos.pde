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

Segmento[] seg;
int n;
final int max_range = 10;

void setup() {
  int i;
  
  size(500, 500);
  background(255);
  strokeWeight(1);
  
  n = (int) random(1, max_range);
  seg = new Segmento[n];
  
  for (i = 0; i < n; i++) {
    Punto a = new Punto(random(0, width+1), random(0, height+1));
    Punto b = new Punto(random(0, width+1), random(0, height+1));
    seg[i] = new Segmento(a, b);
    seg[i].draw_segment();
  }
  
  noLoop();
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

  P.x = 0;
  P.y = 0;
  P.x = A.x + r * (B.x - A.x);
  P.y = A.y + r * (B.y - A.y);
  return true;
}

void compute_intersections(Segmento[] seg, int n) {
  int i, j;
  strokeWeight(5);
  stroke(0, 0, 255);
  for (i = 0; i < n; i++)
    for (j = i+1; j < n; j++) {
      Punto p = new Punto(0, 0); //<>//
      //if (i != j)
        if (intersection(seg[i].a, seg[i].b, seg[j].a, seg[j].b, p))
          point(p.x, p.y);
    }
}

void draw() {
  compute_intersections(seg, n);
}