//For displaying text on screen
PFont f;

void setup() {
  size(700, 600);
  background(255);
  stroke(0, 0, 255);
  //Color of the font
  fill(0);
  //Font and size
  f = createFont("Arial", 20, true);
}

//Draw a fill circle
//Input: center of the circle, radius
void shcircle(int xc, int yc, int r) {
  int i, j;
  //Run through all the pixels of the screen
  for (i = 0; i < width; i++)
    for (j = 0; j < height; j++)
      if (sqrt(((i - xc)*(i - xc)) + ((j - yc)*(j - yc))) <= r)
        point (i, j);
}

//Draw a circle calculating the y coordinate
void shycircle(int xc, int yc, int r) {
  int x, y;

  for (x = xc - r; x <= xc + r; x++) {
    y = int(sqrt(r*r - pow(x - xc, 2))) + yc;
    point(x, y);
    y = int(-sqrt(r*r - pow(x - xc, 2))) + yc;
    point(x, y);
  }
} 

//Function that draws a circle using polar coordinates
void shpolarcircle(int xc, int yc, int r) {
  int theta;
  for (theta = 0; theta < 360; theta++) {
    point(xc + (r*cos((theta*TWO_PI)/360.0)), yc + (r*sin((theta*TWO_PI)/360.0)));
  }
}

//Draws eight points of a circle using its simetry property
void circlePoint(int x, int y, int xc, int yc) {
  point(x, y);
  point(y, x);
  point(-y, x);
  point(-x, y);
  point(-x, -y);
  point(-y, -x);
  point(y, -x);
  point(x, -y);
}

//Draw a circle using its symetry propertiy.
//Use polar coordinates. Out of origin.
void shsymetrycircle(int xc, int yc, int r) {
  int theta;
  int x, y;
  for (theta = 0; theta < 45; theta++) {
    x = xc + int(r * cos((theta * PI)/180.0));
    y = yc + int(r * sin((theta * PI)/180.0));
    circlePoint(x, y, xc, yc);
  }
}

void draw() {
  textFont(f);                            //Set the font
  //translate((width/2) + 200, height/2);   //Put it bellow the circle
  textAlign(CENTER);
  text("Circulo relleno", width/2, 200 + (height/2));
  //shcircle(width/2, height/2, 800);
  point(width/2, height/2);
  //shycircle(width/2, height/2, 50);
  //shpolarcircle(width/2, height/2, 100);
  //shycircle(width/2, height/2, 50);
  shsymetrycircle(100, 100, 50);
}