class InputBox {
  private String inputString;
  
  InputBox() {
    inputString = "Add a new choice";
  }
  
  void display() {
    fill(0, 0, 0);
    text(inputString, 0, 0, width, height);
  }
  
  void removeLastChar() {
    if (inputString.length() > 0) inputString = inputString.substring(0, inputString.length()-1);
  }
  
  void addChar(char key) {
    inputString += key;
  }
  
  void reset() {
    inputString = "";
  }
  
  String getInputString() {
    return inputString;
  }
}
