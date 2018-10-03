class InputBox {
  String defaultString, inputString;
  float xStart, yStart, boxWidth, boxHeight;
  
  
  InputBox(float xStart, float yStart, float boxWidth, float boxHeight, String defaultString) {
    this.xStart = xStart;
    this.yStart = yStart;
    this.defaultString = defaultString;
    inputString = defaultString;
    this.boxHeight = boxHeight;
    this.boxWidth = boxWidth;
  }
  
  void display() {
    fill(255);
    rect(xStart, yStart, boxWidth, boxHeight);
    
    textSize(25);
    textAlign(LEFT, CENTER);
    fill(0, 0, 0);
    text(inputString, xStart+5, yStart+boxHeight/2);
  }
  
  void removeLastChar() {
    if (inputString.length() > 0) inputString = inputString.substring(0, inputString.length()-1);
  }
  
  void addChar(char key) {
    if (isDefault()) {
      inputString = "";
    }
    inputString += key;
  }
  
  void reset() {
    inputString = defaultString;
  }
  
  String getInputString() {
    return inputString;
  }
  
  boolean isDefault() {
     if (inputString.compareTo(defaultString) == 0) {
      return true;
    } else {
      return false;
    }
  }
}
