void setup() {
  size(600, 400);
  background(0);
  stroke(255);
}

void drawLeftArm() {
  pushMatrix();
    translate(12, 32);    //Pivote
    rotate(radians(135));
    rect(-12, 0, 12, 32);
  popMatrix();
}

void drawRightArm() {
  pushMatrix();
    translate(66, 32);    //Pivote
    rotate(radians(-45));
    rect(0, 0, 12, 37);
  popMatrix();
}

void drawRobot() {
  noStroke();
  rect(14, 32, 50, 50);
  drawLeftArm();
  drawRightArm();
  rect(22, 84, 16, 50);
  rect(40, 84, 16, 50);
}

void draw() {
  drawRobot();
}