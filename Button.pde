class Button {
  float xStart, yStart;
  
  static final float WIDTH = 200;
  static final float HEIGHT = 70;

  Button() {
    xStart = (width-WIDTH)/2;
    yStart = height-100;
  }
  
  void display() {
    fill(255, 191, 0);
    rect(xStart, yStart, WIDTH, HEIGHT);
    
    fill(1);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("SPIN", width/2, yStart+HEIGHT/2-5);
  }
}
