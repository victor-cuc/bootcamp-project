Wheel wheel;
Button spinButton;
InputBox inputBox;

boolean spinning;
boolean isDisplayingResult;

void setup() {
  background(190, 200, 210);
  size(1200, 800);

  wheel = new Wheel();
  //wheel.optionsList.add("Pizza");
  //wheel.optionsList.add("Mexican");
  //wheel.optionsList.add("Chinese");
  //wheel.optionsList.add("Indian");
  //wheel.optionsList.add("Burgers");
  
  spinning = false;
  isDisplayingResult = false;
  
  spinButton = new Button(200, 70, (width-200)/2, height-100);
  inputBox = new InputBox(50, 200, 300, 50, "Add a new choice");
}

void draw() {
  background(190, 200, 210);
  spinButton.display();
  inputBox.display();

  if (wheel.optionsList.size() > 0) {
    if (spinning) {
      wheel.rotateWheel();
      wheel.drawWheel();
    } else {  
      wheel.drawWheel();
    }
    
    if (isDisplayingResult) {
      displayWinner(wheel.getWinner());
    }
    
    fill(255, 191, 0);
    triangle(width/2+235, height/2, width/2+265, height/2+15, width/2+265, height/2-15);
  } else {
    wheel.showStartingWheel();
  }
}

void mouseClicked() {
  if (wheel.optionsList.size() > 0 && mouseX>spinButton.xStart && mouseX<(spinButton.xStart+spinButton.buttonWidth) && mouseY>spinButton.yStart && mouseY<(spinButton.yStart+spinButton.buttonHeight)) {
    println("Spin button clicked");
    spinning = true;
    isDisplayingResult = false;
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
    inputBox.reset();
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    inputBox.addChar(key);
  }
}

void displayWinner(String winner) {
  fill(1);
  textSize(70);
  textAlign(CENTER);
  text(winner, width/2, 85);
}
