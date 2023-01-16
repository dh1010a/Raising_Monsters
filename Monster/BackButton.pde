class BackButton{
  int x1,y1,x2,y2,x3,y3;
  BackButton(int a1, int a2, int a3, int a4, int a5, int a6){
    x1 = a1;
    y1 = a2;
    x2 = a3;
    y2 = a4;
    x3 = a5;
    y3 = a6;
  }
  void Draw(){
    fill(255,33,33);
    triangle(x1,y1,x2,y2,x3,y3);
    rect(25, 24, 50, 12, 10);
  }
  void Stop(){
    
  }
  boolean MouseIsOver() {
      if (mouseX > 15 && mouseX < 75 && mouseY > 15 && mouseY < 45) {
        return true;
      }
      return false;
    }
}
