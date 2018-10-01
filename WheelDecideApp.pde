//import java.util.ArrayList;

Wheel wheel = new Wheel();

boolean spinning;

void setup() {
  background(190, 200, 210);
  size(900, 600);

  wheel.optionsList.add("Pizza");
  wheel.optionsList.add("Mexican");
  wheel.optionsList.add("Chinese");
  wheel.optionsList.add("Indian");
  wheel.optionsList.add("Burgers");
  wheel.setSlices(wheel.optionsList.size());

  spinning = false;
  //pushMatrix();
  //translate(width/2, height/2);
  //wheel.drawWheel();
  //popMatrix();
}

void draw() {

  if (spinning) wheel.rotateWheel();

  fill(100);
  rect(700, 500, 150, 50);
  fill(1);
  textSize(30);
  text("Spin", 720, 530);
}

void mouseClicked() {
  if (mouseX>700 && mouseX<850 && mouseY>500 && mouseY<550) {
    println("Click");
    spinning = true;
  }
}
