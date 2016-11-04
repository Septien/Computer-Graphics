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
//Initial position of Rob
int ix, iy;

class Rob {
  //Upper left corner
  int x, y;
  //Width and height
  int w, h;
  //color of the small square
  color inner_color;
  //color of the big square
  color outer_color;
  //Direction of Rob
  int dir;
  
  Rob(int xo, int yo, int wo, int ho, color i_col, color o_color) {
    x = xo;
    y = yo;
    w = wo;
    h = ho;
    inner_color = i_col;
    outer_color = o_color;
    dir = up;
  }
  
  void draw_rob() {
    pushMatrix();
      fill(outer_color);
      translate(x, y);
      rect(0, 0, w, h);
      pushMatrix();
        fill(inner_color);
        translate(x+5, y+5);
        rect(0, 0, w-10, h-40);
      popMatrix();
    popMatrix();
  }
}

Rob r;

void setup() {
  int i, j;
  
  size(500, 500);
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
  board[0][0] = 0;
  r = new Rob(0, 0, n , m, color(0, 255, 0), color(0, 0, 255));
  
  ix = 0;
  iy = 0;
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
  r.draw_rob();
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