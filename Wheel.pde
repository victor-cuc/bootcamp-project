class Wheel {
  
  int slices = 1;
  float rotationAngle = 0;
  float speed = random(0.2, 0.5);
  ArrayList<String> optionsList = new ArrayList<String>();
  
  void setSlices(int slices) {
    this.slices = slices;
  }
  
  void drawWheel() {
    float angle = 2*PI/slices;
    float startAngle = 0;
    float endAngle = angle;
    
    //pushMatrix();
    //translate(width/2, height/2);
    for (int i=0; i<slices; i++) {
      fill(85*i, 55*i, 45*i);
      arc(0, 0, 500, 500, startAngle, endAngle); //<>// //<>//
      
      pushMatrix();
      rotate((startAngle+endAngle)/2);
      textSize(32);
      fill(200, 202, 00);
      text(optionsList.get(i), 100, 0);
      popMatrix();
      
      startAngle = endAngle;
      endAngle += angle;
    }
    //popMatrix();
  }
  
  
  void rotateWheel() {
    if (speed > 0) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(rotationAngle);
      drawWheel();
      popMatrix();
      rotationAngle += speed;
      speed -= 0.002;
    } else {
      spinning = false;
      speed = random(0.2, 0.5);
    }
  }
}
