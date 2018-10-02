Wheel wheel;
Button button;
InputBox inputBox;

boolean spinning;

void setup() {
  background(190, 200, 210);
  size(900, 600);

  wheel = new Wheel();
  wheel.optionsList.add("Pizza");
  wheel.optionsList.add("Mexican");
  wheel.optionsList.add("Chinese");
  wheel.optionsList.add("Indian");
  wheel.optionsList.add("Burgers");
  spinning = false;
  
  button = new Button(width-200, height-100);
  inputBox = new InputBox();
}

void draw() {
  background(190, 200, 210);

  if (spinning) {
    wheel.rotateWheel();
    wheel.drawWheel();
  }
  else {  
    wheel.drawWheel();
  }
  button.display();
  inputBox.display();
  
  fill(255, 191, 0);
  triangle(width/2+235, height/2, width/2+265, height/2+15, width/2+265, height/2-15);
}

void mouseClicked() {
  if (mouseX>button.xStart && mouseX<(button.xStart+Button.WIDTH) && mouseY>button.yStart && mouseY<(button.yStart+Button.HEIGHT)) {
    println("Spin button clicked");
    spinning = true;
  }
  //wheel.optionsList.add("Example");
  //println(wheel.optionsList);
}


void keyPressed() {
  println(key);
  if (keyCode == BACKSPACE) {
    inputBox.removeLastChar();
  } else if (keyCode == DELETE) {
    inputBox.reset();
  } else if (keyCode == ENTER) {
    wheel.addUniqueChoice(inputBox.getInputString());
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    inputBox.addChar(key);
  }
}
