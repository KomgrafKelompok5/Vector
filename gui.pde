/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:353142:
  appc.background(230);
} //_CODE_:window1:353142:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:693935:
  println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield1:693935:

public void textfield2_change1(GTextField source, GEvent event) { //_CODE_:textfield2:792332:
  println("textfield2 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield2:792332:

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:775357:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
   vectors.add(new Vector2f(int(textfield1.getText()), int(textfield2.getText())));
   textfield1.setText("");
   textfield2.setText("");
  
} //_CODE_:button1:775357:

public void textfield3_change1(GTextField source, GEvent event) { //_CODE_:textfield3:977619:
  println("textfield3 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield3:977619:

public void button2_click1(GButton source, GEvent event) { //_CODE_:button2:947754:
  println("button2 - GButton >> GEvent." + event + " @ " + millis());
  sX=int(textfield3.getText());
  sY=int(textfield4.getText());
  float sHasil=0;
  for(Vector2f v : vectors){
    if(v.x==sX&&v.y==sY)
      sHasil =length(v);
  }
   textfield3.setText("");
   textfield4.setText("");
   if(sHasil==0)
     label3.setText("Vertex Tidak ditemukan");
    else
      label3.setText(Float.toString(sHasil));
} //_CODE_:button2:947754:

public void textfield4_change1(GTextField source, GEvent event) { //_CODE_:textfield4:847512:
  println("textfield4 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield4:847512:

public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:693907:
  println("button3 - GButton >> GEvent." + event + " @ " + millis());
  if(indekVa>0){
      label4.setText(Float.toString(vectors.get(--indekVa).x)+" , "+Float.toString(vectors.get(indekVa).y));
       Va=vectors.get(indekVa);
  }
} //_CODE_:button3:693907:

public void button4_click1(GButton source, GEvent event) { //_CODE_:button4:955373:
  println("button4 - GButton >> GEvent." + event + " @ " + millis());
  if(indekVa<vectors.size()-1){
      label4.setText(Float.toString(vectors.get(++indekVa).x)+" , "+Float.toString(vectors.get(indekVa).y));
      Va=vectors.get(indekVa);
  }
} //_CODE_:button4:955373:

public void button5_click1(GButton source, GEvent event) { //_CODE_:button5:321965:
  println("button5 - GButton >> GEvent." + event + " @ " + millis());
  if(indekVb<vectors.size()-1){
      label5.setText(Float.toString(vectors.get(++indekVb).x)+" , "+Float.toString(vectors.get(indekVb).y));
      Vb=vectors.get(indekVb);
  }
} //_CODE_:button5:321965:

public void button6_click1(GButton source, GEvent event) { //_CODE_:button6:915502:
  println("button6 - GButton >> GEvent." + event + " @ " + millis());
  if(indekVb>0){
      label5.setText(Float.toString(vectors.get(--indekVb).x)+" , "+Float.toString(vectors.get(indekVb).y));
      Vb=vectors.get(indekVb);
  }
} //_CODE_:button6:915502:

public void button7_click1(GButton source, GEvent event) { //_CODE_:button7:354929:
  println("button7 - GButton >> GEvent." + event + " @ " + millis());
  pilihMenu(2);
} //_CODE_:button7:354929:

public void button8_click1(GButton source, GEvent event) { //_CODE_:button8:959597:
  println("button8 - GButton >> GEvent." + event + " @ " + millis());
  pilihMenu(5);
} //_CODE_:button8:959597:

public void button9_click1(GButton source, GEvent event) { //_CODE_:button9:881996:
  println("button9 - GButton >> GEvent." + event + " @ " + millis());
  pilihMenu(3);
} //_CODE_:button9:881996:

public void button10_click1(GButton source, GEvent event) { //_CODE_:button10:970630:
  println("button10 - GButton >> GEvent." + event + " @ " + millis());
  pilihMenu(4);
} //_CODE_:button10:970630:

public void textfield5_change1(GTextField source, GEvent event) { //_CODE_:textfield5:587145:
  println("textfield5 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield5:587145:

public void button11_click1(GButton source, GEvent event) { //_CODE_:button11:947007:
  println("button11 - GButton >> GEvent." + event + " @ " + millis());
  pilihMenu(1);
} //_CODE_:button11:947007:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Control", 0, 0, 220, 400, JAVA2D);
  window1.noLoop();
  window1.addDrawHandler(this, "win_draw1");
  textfield1 = new GTextField(window1, 15, 29, 52, 25, G4P.SCROLLBARS_NONE);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  textfield2 = new GTextField(window1, 76, 29, 52, 24, G4P.SCROLLBARS_NONE);
  textfield2.setOpaque(true);
  textfield2.addEventHandler(this, "textfield2_change1");
  button1 = new GButton(window1, 137, 26, 68, 26);
  button1.setText("Build Vector");
  button1.addEventHandler(this, "button1_click1");
  label1 = new GLabel(window1, 64, 3, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Build Vector");
  label1.setOpaque(false);
  label2 = new GLabel(window1, 64, 69, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Lenght Vector");
  label2.setOpaque(false);
  textfield3 = new GTextField(window1, 14, 96, 53, 23, G4P.SCROLLBARS_NONE);
  textfield3.setOpaque(true);
  textfield3.addEventHandler(this, "textfield3_change1");
  button2 = new GButton(window1, 137, 96, 64, 24);
  button2.setText("Length");
  button2.addEventHandler(this, "button2_click1");
  textfield4 = new GTextField(window1, 74, 97, 55, 22, G4P.SCROLLBARS_NONE);
  textfield4.setOpaque(true);
  textfield4.addEventHandler(this, "textfield4_change1");
  label3 = new GLabel(window1, 14, 125, 184, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("--");
  label3.setOpaque(false);
  label4 = new GLabel(window1, 13, 155, 183, 21);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Vektor a");
  label4.setOpaque(false);
  button3 = new GButton(window1, 63, 181, 42, 19);
  button3.setText("-");
  button3.addEventHandler(this, "button3_click1");
  button4 = new GButton(window1, 109, 182, 42, 19);
  button4.setText("+");
  button4.addEventHandler(this, "button4_click1");
  label5 = new GLabel(window1, 14, 205, 184, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("Vektor b");
  label5.setOpaque(false);
  button5 = new GButton(window1, 108, 230, 42, 19);
  button5.setText("+");
  button5.addEventHandler(this, "button5_click1");
  button6 = new GButton(window1, 62, 231, 42, 19);
  button6.setText("-");
  button6.addEventHandler(this, "button6_click1");
  label6 = new GLabel(window1, 7, 156, 35, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("V1");
  label6.setOpaque(false);
  label7 = new GLabel(window1, 9, 204, 33, 20);
  label7.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label7.setText("V2");
  label7.setOpaque(false);
  button7 = new GButton(window1, 84, 255, 45, 30);
  button7.setText("Sub");
  button7.addEventHandler(this, "button7_click1");
  button8 = new GButton(window1, 12, 326, 78, 30);
  button8.setText("Dot");
  button8.addEventHandler(this, "button8_click1");
  button9 = new GButton(window1, 147, 255, 48, 30);
  button9.setText("Norm V1");
  button9.addEventHandler(this, "button9_click1");
  button10 = new GButton(window1, 11, 291, 80, 30);
  button10.setText("Mult V1");
  button10.addEventHandler(this, "button10_click1");
  textfield5 = new GTextField(window1, 96, 291, 90, 30, G4P.SCROLLBARS_NONE);
  textfield5.setOpaque(true);
  textfield5.addEventHandler(this, "textfield5_change1");
  button11 = new GButton(window1, 20, 254, 47, 30);
  button11.setText("Add");
  button11.addEventHandler(this, "button11_click1");
  label8 = new GLabel(window1, 97, 333, 96, 20);
  label8.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label8.setText("--");
  label8.setOpaque(false);
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GTextField textfield1; 
GTextField textfield2; 
GButton button1; 
GLabel label1; 
GLabel label2; 
GTextField textfield3; 
GButton button2; 
GTextField textfield4; 
GLabel label3; 
GLabel label4; 
GButton button3; 
GButton button4; 
GLabel label5; 
GButton button5; 
GButton button6; 
GLabel label6; 
GLabel label7; 
GButton button7; 
GButton button8; 
GButton button9; 
GButton button10; 
GTextField textfield5; 
GButton button11; 
GLabel label8; 