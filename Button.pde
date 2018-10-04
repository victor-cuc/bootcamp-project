class Button {
  float xStart, yStart, buttonWidth, buttonHeight, labelTextSize;
  color buttonColor;
  String label;
  
  Button(float xStart, float yStart, float buttonWidth, float buttonHeight, String label) {
    this.xStart = xStart;
    this.yStart = yStart;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.label = label;
    labelTextSize = 50;
    this.buttonColor = color(111, 111, 111);
  }
  
  void display() {
    fill(buttonColor);
    rect(xStart, yStart, buttonWidth, buttonHeight);
    
    fill(1);
    textSize(labelTextSize);
    textAlign(CENTER, CENTER);
    text(label, width/2, yStart+buttonHeight/2-5);
  }
  
  void changeColor(color buttonColor) {
    this.buttonColor = buttonColor;
  }
}
