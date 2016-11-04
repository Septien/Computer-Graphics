//Matrix to keep track of the board
int[][] board;
int n, m;
boolean blocked = true;
//Number of blocks blocked
int b_blocked;
//Color of the blocks
color block = color(255, 0, 0);
//Constants to define direction
final int up = 1;
final int down = 2;
final int left = 3;
final int right = 4;

class Rob {
  //Upper left corner
  int x, y;
  //Width and height
  int w, h;
  //color of the small square
  color inner_color;
  //color of the big square
  color outer_color;
  
  Rob(int xo, int yo, int wo, int ho, color i_col, color o_color) {
    x = xo;
    y = yo;
    w = wo;
    h = ho;
    inner_color = i_col;
    outer_color = o_color;
  }
  
  void draw_rob() {
    fill(outer_color);
    rect(x, y, w, h);
    fill(inner_color);
    rect(x-5, y-5, w-5, h-5);
  }
}

void setup() {
  int i, j;
  
  size(900, 500);
  background(255);
  stroke(0);
  
  //Divide each side by 10
  n = width / 10;
  m = height / 10;
  
  b_blocked = (int) random(3, 24);
  
  //Initialize matrix
  board = new int[n][m];
  
  for (i = 0; i < n; i++)
    for (j = 0; j < m; j++)
      board[i][j] = (int) random(0, 1.2);
  
  noLoop();
}

void draw_laberynth() {
  int i, j;
  for (i = 0; i < width; i += n)
    for (j = 0; j < height; j += m)
      rect(i, j, n, m);
}

void draw_obstacles() {
  int i, j;
  for (i = 0; i < n; i++)
    for (j = 0; j < m; j++)
      if (board[i][j] == 1) {
        fill(block);
        rect(i*n, j*m, n, m);
      }
}

void draw() {
  draw_laberynth();
  draw_obstacles();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) 
      ;
    else if (keyCode == DOWN)
      ;
    else if (keyCode == LEFT)
      ;
    else if (keyCode == RIGHT)
      ;
    else
      ;
  }
}