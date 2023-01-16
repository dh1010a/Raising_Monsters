class pocketBall{
  StringList pocket, room;
  int dx=0, dy=0, cnt = 0, w = 77, num, pocket_num;
  
  pocketBall(StringList x, StringList y){
    pocket = x;
    room = y;
    cnt = pocket.size();
  }
  String get_pocketname(){
    return pocket.get(num);
  }
  void Draw(){
    for (int i = 0; i < cnt; i++){
      image(ball, 55 + i * w, 140);
    }
  }
  void show_name(){
    textFont(f1);
    fill(0);
    textSize(40);
    text(pocket.get(num), width/2, 50);
  }
  boolean MouseIsOver() {
    for (int i = 0; i < cnt; i++){
      if (mouseX > 55 + i * w - 30 && mouseX < 55 + i * w + 30 && mouseY > 140 - 30 && mouseY < 140 + 30) {
        num = i;
        return true;
      }
    }
    return false;
  }
}
