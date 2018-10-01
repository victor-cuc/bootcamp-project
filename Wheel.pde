class Wheel {
  
  int slices = 1;
  ArrayList<String> optionsList = new ArrayList<String>();
  
  void setSlices(int slices) {
    this.slices = slices;
  }
  
  void drawWheel() {
    float angle = 2*PI/slices;
    float startAngle = 0;
    float endAngle = angle;
    
    for (int i=0; i<slices; i++) {
      println(startAngle, endAngle);
      fill(random(0, 255), random(0, 255), random(0, 255));
      arc(width/2, height/2, 500, 500, startAngle, endAngle); //<>// //<>//
      
      pushMatrix();
      translate(450, 300);
      rotate((startAngle+endAngle)/2);
      textSize(32);
      fill(200, 202, 00);
      text(optionsList.get(i), 100, 0);
      popMatrix();
      
      startAngle = endAngle;
      endAngle += angle;
    }
  }
  
}
