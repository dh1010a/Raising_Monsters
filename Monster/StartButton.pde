class StartButton{
  String label;
  
  StartButton(String labelB){
    label = labelB;
  }
  
  void Draw(){
    fill(255);
    rect(325, 300, 150, 70, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(30);
    text(label, 400, 330);
    }
    void Stop(){
      
    }
    boolean MouseIsOver() {
      if (mouseX > 340 && mouseX < (460) && mouseY > 300 && mouseY < (380)) {
        return true;
      }
      return false;
    }
}
