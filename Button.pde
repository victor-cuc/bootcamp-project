class Button {
  float xStart, yStart;
  
  static final float WIDTH = 150;
  static final float HEIGHT = 50;

  Button(float xStart, float yStart) {
    this.xStart = xStart;
    this.yStart = yStart;
  }
  
  void display() {
    fill(255, 191, 0);
    rect(xStart, yStart, WIDTH, HEIGHT);
    
    fill(1);
    textSize(30);
    text("Spin", xStart+44, yStart+33);
  }
}
