//An implementation of the game of life.

//n -> number of cells, l = length of each cell
int n, l;
int[][] m;

color backg = color(255);
color grid_c = color(0);
color alive = color(0, 255, 0);
color dead = backg;

void setup() {
  int i, j;
  
  size(400, 400);
  background(255);
  stroke(0);
  l = 5;
  n = width/l;
  m = new int[n][n];

  //Initialize status of cells
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
        //Dead on the borders of the windows
        if (i == 0 || i == n-1)
          m[i][j] = 0;
        else if (j == 0 || j == n-1)
          m[i][j] = 0;
        else
          m[i][j] = (int) random(0, 1.2);
    }
  noLoop();
}

//Generate grid
void grid() {
  int i, j;
  for (i = 0; i < width; i += l)
    for (j = 0; j < height; j += l) {
      rect(i, j, l, l);
    }
}

//Display living cells
void cells() {
  int i, j;
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      if (m[i][j] == 1) {
        fill(alive);
        rect(i*l, j*l, l, l);
      }
      else {
        fill(dead);
        rect(i*l, j*l, l, l);
      }
    }
}



void draw() {
  grid();
  cells();
}