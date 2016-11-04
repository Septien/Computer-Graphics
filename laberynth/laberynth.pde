//Matrix to keep track of the board
int[][] board;
int n, m;
boolean blocked = true;
//Number of blocks blocked
int b_blocked;

void setup() {
  int i, j;
  
  size(900, 500);
  background(0);
  stroke(255);
  
  //Divide each side by 10
  n = width / 10;
  m = height / 10;
  
  b_blocked = (int) random(0, 11);
  
  //Initialize matrix
  board = new int[n][m];
}

void draw() {
}