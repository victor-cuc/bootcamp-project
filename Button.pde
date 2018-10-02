class Button {
  float xStart, yStart, buttonWidth, buttonHeight;
  
  Button(float buttonWidth, float buttonHeight, float xStart, float yStart) {
    this.xStart = xStart;
    this.yStart = yStart;
    this.buttonHeight = buttonHeight;
    this.buttonWidth = buttonWidth;
  }
  
  void display() {
    fill(255, 191, 0);
    rect(xStart, yStart, buttonWidth, buttonHeight);
    
    fill(1);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("SPIN", width/2, yStart+buttonHeight/2-5);
  }
}
