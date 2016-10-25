//An implementation of the game of life.

//n -> number of cells, l = length of each cell
int n, l;
int[][] m;


void setup() {
  int i, j;
  
  size(400, 400);
  background(255);
  stroke(0);
  l = 5;
  n = width/l;
  m = new int[n][n];

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

void draw() {
  grid();
}