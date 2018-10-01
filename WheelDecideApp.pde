//import java.util.ArrayList;

Wheel wheel;
Button button;

boolean spinning;

void setup() {
  background(190, 200, 210);
  size(600, 900);

  wheel = new Wheel();
  wheel.optionsList.add("Pizza");
  wheel.optionsList.add("Mexican");
  wheel.optionsList.add("Chinese");
  wheel.optionsList.add("Indian");
  wheel.optionsList.add("Burgers");
  spinning = false;
  
  button = new Button(width-200, height-100);
}

void draw() {


  if (spinning) {
    wheel.rotateWheel();
    wheel.drawWheel();
  }
  else {  
    wheel.drawWheel();
  }
  button.display();
}

void mouseClicked() {
  if (mouseX>button.xStart && mouseX<(button.xStart+Button.WIDTH) && mouseY>button.yStart && mouseY<(button.yStart+Button.HEIGHT)) {
    println("Click");
    spinning = true;
  }
  //wheel.optionsList.add("Example");
  //println(wheel.optionsList);
}
