//An implementation of the game of life.

//n -> number of cells, l = length of each cell
int n, l;
int[][] m;
int num_cells;

color backg = color(255);
color grid_c = color(0);
color alive = color(0, 255, 0);
color dead = backg;

void setup() {
  int i, j, count_cells = 0;
  num_cells = 400;
  
  size(400, 400);
  background(255);
  stroke(0);
  l = 5;
  n = width/l;
  m = new int[n][n];

  //Initialize status of cells
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      /*if (count_cells <= num_cells) {
        m[i][j] = (int) random(0, 1.2);
        count_cells++;
      }*/
      m[i][j] = 0;
    }
    
    m[1][1] = 1;
    /*m[2][1] = 1;
    m[3][1] = 1;
    m[1][2] = 1;*/
//  noLoop();
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
  for (i = 1; i < n-1; i++)
    for (j = 1; j < n-1; j++) {
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

//Update status of cells
void apply_rules() {
  int i, j;
  int[][] buffer = new int[n][n];
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      buffer[i][j] = m[i][j];
  //Alive neighbors
  int alive_n = 0;
  //Don't considere borders, considered dead
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      alive_n = 0;
      if (i-1 > 0 && j-1 > 0)
        if (m[i-1][j-1] == 1)
          alive_n++;
      
      if (i-1 > 0)
        if (m[i-1][j] == 1)
          alive_n++;
      
      if (i-1 > 0 && j+1 < n)
        if (m[i-1][j+1] == 1)
          alive_n++;
      
      if (j-1 > 0)
        if (m[i][j-1] == 1)
          alive_n++;
      
      if (j+1 < n)
        if (m[i][j+1] == 1)
          alive_n++;
      
      if (i+1 < n && j-1 > 0)
        if (m[i+1][j-1] == 1)
          alive_n++;
      
      if (i+1 < n)
        if (m[i+1][j] == 1)
          alive_n++;
      
      if (i+1 < n && j+1 < n)
        if (m[i+1][j+1] == 1)
          alive_n++;
      
      //Rule 1
      if (alive_n < 2 && buffer[i][j] == 1)
        buffer[i][j] = 0;    //Dead
      //Rule 2
      if ((alive_n == 2 || alive_n == 3) && m[i][j] == 1)
        buffer[i][j] = 1;    //Alive
      //Rule 3
      if (alive_n > 3 && m[i][j] == 1)
        buffer[i][j] = 0;    //Dead
      //Rule 4
      if (m[i][j] == 0 && alive_n == 3)
        buffer[i][j] = 1;    //Alive
    }
    for (i = 0; i < n; i++)
      for (j = 0; j < n; j++)
        m[i][j] = buffer[i][j];
}

void draw() {
  grid();
  cells();
  apply_rules();
  delay(500);
}