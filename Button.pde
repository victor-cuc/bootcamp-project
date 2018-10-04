class Button {
  float xStart, yStart, buttonWidth, buttonHeight, labelTextSize;
  float red, green, blue;
  String label;
  
  Button(float xStart, float yStart, float buttonWidth, float buttonHeight, String label) {
    this.xStart = xStart;
    this.yStart = yStart;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.label = label;
    labelTextSize = 50;
    red = 255;
    green = 191;
    blue = 0;
  }
  
  void display() {
    fill(red, green, blue);
    rect(xStart, yStart, buttonWidth, buttonHeight);
    
    fill(1);
    textSize(labelTextSize);
    textAlign(CENTER, CENTER);
    text(label, width/2, yStart+buttonHeight/2-5);
  }
  
  void changeColor(float red, float green, float blue) {
    this.red = red;
    this.green = green;
    this.blue = blue;
  }
}
