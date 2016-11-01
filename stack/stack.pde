void setup() {
  size(600, 400);
  background(0);
  stroke(255);
}

void draw() {
  pushMatrix();
    fill(255, 0, 0);
    rotate(radians(30));
    translate(70, 70);
    scale(2.0);
    rect(0, 0, 20, 20);
  popMatrix();
  
  pushMatrix();
    fill(255);
    translate(70, 70);
    rotate(radians(30));
    scale(2.0);
    rect(0, 0, 20, 20);
  popMatrix();
}