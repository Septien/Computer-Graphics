//Matrix to keep track of the board
int[][] board;
int n, m;
boolean blocked = true;
//Number of blocks blocked
int b_blocked;

void setup() {
  int i, j;
  int count = 0;
  
  size(900, 500);
  background(0);
  stroke(255);
  
  //Divide each side by 10
  n = width / 10;
  m = height / 10;
  
  b_blocked = (int) random(3, 24);
  
  //Initialize matrix
  board = new int[n][m];
  
  for (i = 0; i < n; i++)
    for (j = 0; j < m; j++) {
      if (count < b_blocked) {
        board[i][j] = (int) random(0, 1.2);
        count++;
      }
      else
        board[i][j] = 0;
    }
}

void draw_laberynth() {
  int i, j;
  for (i = 0; i < width; i += n)
    for (j = 0; j < height; j += m)
      rect(i, j, n, m);
}

void draw() {
}