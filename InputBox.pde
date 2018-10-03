class InputBox {
  private String inputString;
  private float xStart, yStart, boxWidth, boxHeight;
  
  
  InputBox(float xStart, float yStart, float boxWidth, float boxHeight, String inputString) {
    this.xStart = xStart;
    this.yStart = yStart;
    this.inputString = inputString;
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
    inputString += key;
  }
  
  void reset() {
    inputString = "Add a new choice";
  }
  
  String getInputString() {
    return inputString;
  }
}
