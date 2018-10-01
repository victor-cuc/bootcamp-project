//import java.util.ArrayList;

Wheel wheel = new Wheel();

void setup() {
  background(190, 200, 210);
  size(900, 600);
  
  wheel.optionsList.add("Pizza");
  wheel.optionsList.add("Mexican");
  wheel.optionsList.add("Chinese");
  wheel.optionsList.add("Indian");
  wheel.optionsList.add("Burgers");
  wheel.setSlices(wheel.optionsList.size());
  wheel.drawWheel();
}

void draw() {
}
