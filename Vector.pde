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

void mouseClicked() {
  float x = (mouseX - width / 2.0) / gridSize;
  float y = -(mouseY - height / 2.0) / gridSize;
  vectors.add(new Vector2f(x, y));
}

void drawVector(int pilih) {
  
  if(pilih==1){
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
  else if(pilih==2){
    stroke(255, 0, 255);
     strokeWeight(1.2);
    line(0, 0, hasilVector.x * gridSize, hasilVector.y * gridSize);
    if(hasilVector.y!=0 &&hasilVector.x!=0)drawArrow(hasilVector);
    printLabel(hasilVector.x, hasilVector.y);
  }
  
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
//GUi 
int indekVa=-1;
int indekVb=-1;
Vector2f Va,Vb,hasilVector= new Vector2f(0,0);

void pilihMenu(int menu){
  switch(menu){
  case 1:
    hasilVector=add(Va, Vb);
    drawVector(2);
  break;
  case 2:
    hasilVector=sub(Va, Vb);
    drawVector(2);
  break;
  case 3:
    hasilVector=norm(Va);
    drawVector(2);
  break;
  case 4:
    hasilVector=mult(float(textfield5.getText()),Va);
    drawVector(2);
  break;
  case 5:
    label8.setText(Float.toString(dot(Va,Vb)));
  break;
  }
}


void draw() {
  background(255);
  translate(width/ 2, height/ 2);
  createGrid();
  scale(1, -1);
  /* y = 2x + 4
   * m = 2, c = 4
   */
  drawVector(1);
  drawVector(2);
  //pilihMenu(0);
  //Vector2f x= mult(10,new Vector2f(8, 6)); 
  //print(x.x +" " +x.y);
  //noLoop();
}