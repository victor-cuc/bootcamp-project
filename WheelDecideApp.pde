Wheel wheel;
Button spinButton, resetButton;;
InputBox inputBox;

boolean spinning;
boolean isDisplayingResult;

void setup() {
  background(249, 217, 89);
  size(1200, 800);

  spinning = false;
  isDisplayingResult = false;
  
  wheel = new Wheel();
  //wheel.addChoice("Pizza");
  //wheel.addChoice("Chinese");
  //wheel.addChoice("Burgers");
  
  spinButton = new Button((width-200)/2, height-130, 200, 60, "SPIN", color(0));
  spinButton.labelTextSize = 50;
  spinButton.changeColor(color(255, 191, 0));
  resetButton = new Button((width-150)/2, height-60, 150, 40, "RESET", color(255, 191, 0));
  inputBox = new InputBox(20, height/2-25, 300, 50, "Add a new choice");
}

void draw() {
  background(249, 217, 89);
  spinButton.display();
  resetButton.display();
  inputBox.display();

  if (wheel.optionsList.size() > 0) {
    if (spinning) {
      wheel.rotateWheel();
      wheel.drawWheel();
    } else {  
      wheel.drawWheel();
    }
    
    if (isDisplayingResult) {
      displayWinner(wheel.optionsList.get(wheel.getWinnerIndex()), wheel.colourTable.findColour(wheel.getWinnerIndex()));
    }
    
    fill(255, 191, 0);
    triangle(width/2+235, height/2, width/2+265, height/2+15, width/2+265, height/2-15);
  } else {
    wheel.showStartingWheel();
  }
}

void mouseClicked() {
  if (wheel.optionsList.size() > 1 && mouseX>spinButton.xStart && mouseX<(spinButton.xStart+spinButton.buttonWidth) && mouseY>spinButton.yStart && mouseY<(spinButton.yStart+spinButton.buttonHeight)) {
    println("Spin button clicked");
    spinning = true;
    isDisplayingResult = false;
  } 
  
  else if (mouseX>resetButton.xStart && mouseX<(resetButton.xStart+resetButton.buttonWidth) && mouseY>resetButton.yStart && mouseY<(resetButton.yStart+resetButton.buttonHeight)) {
    wheel.optionsList.clear();
    wheel.rotationAngle = 2*PI; //reset wheel to start position
  }
  
  else if (mouseX>inputBox.xStart && mouseX<(inputBox.xStart+inputBox.boxWidth) && mouseY>inputBox.yStart && mouseY<(inputBox.yStart+inputBox.boxHeight)) {
    println("Input box clicked");
    if (inputBox.isDefault()) {
      inputBox.inputString = "";
    }
  }
  else if (clickedInsideWheel() && wheel.optionsList.size() > 0) {
    int indexToRemove = wheel.getIndex(mouseX, mouseY);
    println("Removed item at index " + indexToRemove);
    wheel.optionsList.remove(indexToRemove);
  }
}

void keyPressed() {
  //println(key);
  if (keyCode == BACKSPACE) {
    inputBox.removeLastChar();
  } else if (keyCode == DELETE) {
    inputBox.reset();
  } else if (keyCode == ENTER) {
    println(inputBox.inputString);
    wheel.addChoice(inputBox.getInputString());
    inputBox.reset();
    isDisplayingResult = false;
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    inputBox.addChar(key);
  }
}

void displayWinner(String winner, color winnerTextColor) {
  fill(winnerTextColor);
  textSize(70);
  textAlign(CENTER);
  text(winner, width/2, 85);
}

boolean clickedInsideWheel() {
  double distanceFromCenter = Math.sqrt(Math.pow((mouseX-width/2), 2) + Math.pow((mouseY-height/2), 2));
  if (
    mouseX > width/2-250 && mouseX < width/2+250 && 
    mouseY > height/2-250 && mouseY < height/2+250 &&
    distanceFromCenter <= 250
    ) {
    println("Clicked inside the wheel");
    return true;
  }
  else 
    return false;
}
