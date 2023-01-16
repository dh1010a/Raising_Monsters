class MoveButton{
  int x1,y1,x2,y2,x3,y3;
  MoveButton(int a1, int a2, int a3, int a4, int a5, int a6){
    x1 = a1;
    y1 = a2;
    x2 = a3;
    y2 = a4;
    x3 = a5;
    y3 = a6;
  }
  void Draw(){
    fill(255,33,33);
    noStroke();
    triangle(x1,y1,x2,y2,x3,y3);
  }
  void Stop(){
    
  }
  boolean MouseIsOver() {
      if (mouseX > x1 && mouseX < (x3) && mouseY > y2 && mouseY < (y3)) {
        return true;
      }
      else if (mouseX > x1 && mouseX < (x3) && mouseY > y3 && mouseY < (y2)) {
        return true;
      }
      return false;
    }
}
