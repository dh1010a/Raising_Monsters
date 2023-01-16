class OptionButton{
  int x1,y1,x2,y2,x3,y3;
  String Input;
  OptionButton(int a1, int a2, String x){
    x1 = a1;
    y1 = a2;
    Input = x;
  }
  void Draw(){
    fill(255);
    rect(x1, y1, 80, 40, 10);
    fill(0);
    textFont(f2);
    textSize(20);
    
    text(Input, x1 + 40, y1 + 17);
  }
  void Stop(){
    
  }
  boolean MouseIsOver() {
      if (mouseX > x1 && mouseX < x1 + 50 && mouseY > y1 && mouseY < y1 + 30) {
        return true;
      }
      return false;
    }
}
