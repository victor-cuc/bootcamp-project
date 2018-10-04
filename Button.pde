class Button {
  float xStart, yStart, buttonWidth, buttonHeight, labelTextSize;
  color buttonColor, textColor;
  String label;
  
  Button(float xStart, float yStart, float buttonWidth, float buttonHeight, String label, color textColor) {
    this.xStart = xStart;
    this.yStart = yStart;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.label = label;
    labelTextSize = 30;
    this.buttonColor = color(80);
    this.textColor = textColor;
  }
  
  void display() {
    fill(buttonColor);
    rect(xStart, yStart, buttonWidth, buttonHeight);
    
    fill(textColor);
    textSize(labelTextSize);
    textAlign(CENTER, CENTER);
    text(label, width/2, yStart+buttonHeight/2-5);
  }
  
  void changeColor(color buttonColor) {
    this.buttonColor = buttonColor;
  }
}
