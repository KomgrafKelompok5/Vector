import g4p_controls.*;

int gridSize = 10;
int zoomFactor = 1;
int sX, sY;
public class Vector2f {
  float x, y;

  public Vector2f(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

Vector2f add(Vector2f v1, Vector2f v2) {
  float x = v1.x + v2.x;
  float y = v1.y + v2.y;
  

  return new Vector2f(x, y);
}

Vector2f sub(Vector2f v1, Vector2f v2) {
  float x = v1.x - v2.x;
  float y = v1.y - v2.y;
  return new Vector2f(x, y);
}

Vector2f mult(float scalar, Vector2f v) {
  float x = scalar * v.x;
  float y = scalar * v.y;
  return new Vector2f(x, y);
}

float length(Vector2f v) {
  return sqrt(v.x * v.x + v.y * v.y);
}

Vector2f norm(Vector2f v) {
  float _length = length(v);
  float x = v.x / _length;
  float y = v.y / _length;
  return new Vector2f(x, y);
}

float dot(Vector2f v1, Vector2f v2) {
  return v1.x * v2.x + v1.y + v2.y;
}

void createGrid() {
  //Text Config
  fill(0, 128, 192);
  float textOffSide = gridSize / 8;
  textAlign(RIGHT, TOP);
  textSize(gridSize / 3);
  //Line Config
  stroke(0, 128, 192);
  //Draw Coordinate System
  for (int y = -height / 2, index = height / (gridSize * 2); 
    y <= height / 2; y += gridSize) {
    strokeWeight(y == 0 ? 1.2 : 0.3);
    text(index--, -textOffSide, y + textOffSide);
    ellipseMode(RADIUS);
    ellipse(0, y, gridSize / 15, gridSize / 15);
    line(-width / 2, y, width / 2, y);
  }
  for (int x = -width / 2, index = -width / (gridSize * 2); 
    x <= width / 2; x += gridSize) {
    strokeWeight(x == 0 ? 1.2 : 0.3);
    text(index++, x - textOffSide, textOffSide);
    ellipseMode(RADIUS);
    ellipse(x, 0, gridSize / 15, gridSize / 15);
    line(x, -height / 2, x, height / 2);
  }
}

//Zoom Coordinate System
float clamp(float val, float min, float max) {
  return val < min ? min : val > max ? max : val;
}

void mouseWheel(MouseEvent event) {
  zoomFactor = (int)clamp(zoomFactor - event.getCount(), 1, 4);
  gridSize = 10 * zoomFactor;
}

ArrayList<Vector2f> vectors = new ArrayList();
ArrayList<String> listVectors = new ArrayList();

void mouseClicked() {
  float x = (mouseX - width / 2.0) / gridSize;
  float y = -(mouseY - height / 2.0) / gridSize;
  vectors.add(new Vector2f(x, y));
}

void drawVector() {
  pushMatrix();
  stroke(255, 0, 0);
  strokeWeight(1.2);
  for (Vector2f vector : vectors) {
    line(0, 0, vector.x * gridSize, vector.y * gridSize);
    drawArrow(vector);
    printLabel(vector.x, vector.y);
  }
  popMatrix();
}

void drawArrow(Vector2f v) {
  float alpha = (float)Math.atan2(v.y, v.x);
  float x = v.x * gridSize;
  float y = v.y * gridSize;
  //print(PI / 2 + alpha);
  pushMatrix();
  fill(255, 0, 0);
  translate(x, y);
  rotate(PI / 2 + alpha);
  float r = zoomFactor * 3;
  beginShape();
  vertex(0, 0);
  vertex(-r, r * 3);
  vertex(r, r * 3);
  endShape();
  popMatrix();
}

void printLabel(float x, float y) {
  textSize(gridSize / 3);
  pushMatrix();
  fill(0, 128, 192);
  scale(1, -1);
  text("(" +nfc(x, 2) +", " +nfc(y, 2) +")", x * gridSize, -y * gridSize);
  popMatrix();
}

void setup() {
  size(1200, 720);
   createGUI();
}

void draw() {
  background(255);
  translate(width/ 2, height/ 2);
  createGrid();
  scale(1, -1);
  /* y = 2x + 4
   * m = 2, c = 4
   */
  //drawVector();
  print(dot (new Vector2f(8,6),new Vector2f(3,6)));
}