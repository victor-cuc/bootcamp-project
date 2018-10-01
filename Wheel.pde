class Wheel {
  
  int slices = 1;
  
  void setSlices(int slices) {
    this.slices = slices;
  }
  
  void drawWheel() {
    float angle = 2*PI/slices;
    float startAngle = 0;
    float endAngle = angle;
    
    for (int i=0; i<slices; i++) {
      fill(random(0, 255), random(0, 255), random(0, 255));
      arc(width/2, height/2, 500, 500, startAngle, endAngle);
      startAngle = endAngle; //<>//
      endAngle += angle; //<>//
    }
  }
}
