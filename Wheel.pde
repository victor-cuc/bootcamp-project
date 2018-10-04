import org.gicentre.utils.colour.*;

class Wheel {
  
  float arcAngle;
  float rotationAngle; //use this when drawing
  ColourTable colourTable;
  
  
  float speed;
  ArrayList<String> optionsList;
  
  Wheel() {
    rotationAngle = 2*PI;
    speed = random(0.2, 0.5);
    optionsList = new ArrayList<String>();
    colourTable = ColourTable.getPresetColourTable(ColourTable.RD_YL_GN,0,10);
  }
  
  int getWinnerIndex() {
    /** Calculates how many times the arcAngle the wheel has spun and rounds it. 
    As the wheel rotates clockwise, this gives the index from the end of the list. **/
    //println(rotationAngle%(2*PI)/arcAngle);
    int indexFromEnd = (int) Math.ceil(rotationAngle%(2*PI)/arcAngle);
    // Gives the index from start
    return optionsList.size()-indexFromEnd;
  }
  
  void drawWheel() {
    arcAngle = 2*PI/optionsList.size();
    float startAngle = 0;
    float endAngle = arcAngle;
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(rotationAngle);
    for (int i=0; i<optionsList.size(); i++) {
      fill(colourTable.findColour(i));
      arc(0, 0, 500, 500, startAngle, endAngle); //<>// //<>// //<>//
      
      pushMatrix();
      rotate((startAngle+endAngle)/2);
      textAlign(CENTER, CENTER);
      if (optionsList.get(i).length() <= 10) {
        textSize(32);
      } else {
        textSize(20);
      }
      fill(255, 191, 0);
      text(optionsList.get(i), 130, 0);
      popMatrix();
      
      startAngle = endAngle;
      endAngle += arcAngle;
    }
    popMatrix();
  }
  
  
  void rotateWheel() {
    if (speed > 0) {
      rotationAngle += speed;
      speed -= 0.002;
    } else {
      spinning = false;
      isDisplayingResult = true;//reset spinning state
      speed = random(0.2, 0.5); //set the speed to a new random one for the next rotation
      println(optionsList.get(getWinnerIndex()));
      println(rotationAngle);
    }
  }
  
  boolean containsIgnoreCase(String str){
    for(String i : optionsList){
        if(i.equalsIgnoreCase(str))
            return true;
    }
    return false;
  }
  
  void addChoice(String str) {
    if (!containsIgnoreCase(str) && optionsList.size() <= 10) optionsList.add(str);
  }
  
  void showStartingWheel() {
    fill(10);
    ellipse(width/2, height/2, 500, 500);
    
    fill(255, 191, 0);
    textSize(80);
    textAlign(CENTER, BOTTOM);
    text("WHEEL", width/2, height/2);
    
    fill(255, 191, 0);
    textAlign(CENTER, TOP);
    textSize(80);
    text("DECIDE", width/2, height/2);
    
    fill(255);
    textAlign(CENTER, TOP);
    textSize(30);
    text("Add options to start", width/2, height/2+100);
  }
  
  int getIndex(float x, float y) {
    int index;
    float xCenter = width/2;
    float yCenter = height/2;
    double atanAngle = Math.atan((height/2-y) / (x-width/2));
    float angleFromStart = 0;
    //quadrant 1
    if (x>xCenter && y<yCenter) {
      angleFromStart = 2*PI - (float)atanAngle;
    } else if (x>xCenter && y>yCenter) {
      angleFromStart = -(float)atanAngle;
    } else if (x<xCenter && y>yCenter) {
      angleFromStart = PI-(float)atanAngle;
    } else if (x<xCenter && y<yCenter) {
      angleFromStart = PI-(float)atanAngle;
    }
    
    index = optionsList.size() - (int) Math.ceil((rotationAngle-angleFromStart)%(2*PI)/arcAngle);
    
    //println(Math.toDegrees((rotationAngle-angleFromStart)%(2*PI)/arcAngle));
    //println("INDEX OF CLICK", index);
    return index;
  }
}
