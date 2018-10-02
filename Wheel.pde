class Wheel {
  
  float arcAngle;
  float rotationAngle; //use this when drawing
  
  
  float speed;
  ArrayList<String> optionsList;
  
  Wheel() {
    rotationAngle = 0;
    speed = random(0.2, 0.5);
    optionsList = new ArrayList<String>();
  }
  
  String getWinner() {
    /** Calculates how many times the arcAngle the wheel has spun and rounds it. 
    As the wheel rotates clockwise, this gives the index from the end of the list. **/
    int indexFromEnd = (int) Math.ceil(rotationAngle%(2*PI)/arcAngle);
    // Gives the index from start
    int winnerIndex = optionsList.size()-indexFromEnd;
    return optionsList.get(winnerIndex);
  }
  
  void drawWheel() {
    arcAngle = 2*PI/optionsList.size();
    float startAngle = 0;
    float endAngle = arcAngle;
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(rotationAngle);
    for (int i=0; i<optionsList.size(); i++) {
      fill(85*i, 55*i, 45*i);
      arc(0, 0, 500, 500, startAngle, endAngle); //<>// //<>// //<>//
      
      pushMatrix();
      rotate((startAngle+endAngle)/2);
      textAlign(LEFT);
      textSize(32);
      fill(200, 202, 00);
      text(optionsList.get(i), 100, 0);
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
      println(getWinner());
    }
  }
  
  boolean containsIgnoreCase(String str){
    for(String i : optionsList){
        if(i.equalsIgnoreCase(str))
            return true;
    }
    return false;
  }
  
  void addUniqueChoice(String str) {
    if (!containsIgnoreCase(str)) optionsList.add(str);
  }
}
