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
  float theta;
  
  Rob(int xo, int yo, int wo, int ho, color i_col, color o_color) {
    x = xo;
    y = yo;
    w = wo;
    h = ho;
    inner_color = i_col;
    outer_color = o_color;
    dir = up;
    theta = 0;
  }
  
  int get_x() {
    return x;
  }
  
  int get_y() {
    return y;
  }
  
  float get_theta() {
    return theta; 
  }
  
  int get_dir() {
    return dir;
  }
  
  void set_x(int nx) {
    x = nx;
  }
  
  void set_y(int ny) {
    y = ny;
  }
  
  void set_theta(float ntheta) {
    theta = ntheta;
  }
  
  void set_dir(int ndir) {
    dir = ndir;
  }
  
  void draw_rob() {
    pushMatrix();
      fill(outer_color);
      rotate(radians(theta));
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
  
  //noLoop();
}

void draw_laberynth() {
  int i, j;
  fill(255);
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
  int dir = r.get_dir();
  float theta = 0;
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        if (dir == up) {
          //Already oriented up. Translate up one unit
          if (ix != 0) {
            //Not on the upper border
            board[ix][iy] = 2;      //Indicate that pass through the block
            ix -= 1;
            int x = r.get_x();
            r.set_x(x-n);
          }
        }
        else {
          if (dir == left)
            theta = 90;
          else if (theta == down)
            theta = 180;
          else if (theta == right)
            theta = -90;
          r.set_theta(theta);
          r.set_dir(up);
        }
        break;
      case DOWN:
        if (dir == down) {
          //If rob is already oriented down
          if (ix != n) {
            //Not on the lower bound
            board[ix][iy] = 2;
            ix += 1;
            int x = r.get_x();
            r.set_x(x + n);
          }
          
        }
        else {
          if (dir == up)
            theta = 180.0;
          else if (dir == left)
            theta = -90.0;
          else if (dir == right)
            theta = 90.0;
          r.set_theta(theta);
          r.set_dir(down);
        }
        break;
      case LEFT:
        break;
      case RIGHT:
        break;
    }
  }
}