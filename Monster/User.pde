class User{
  String id;
  StringList monster = new StringList();
  StringList room = new StringList();  
  pocketBall pocket;
  String get_ID(){
    return id;
  }
  void push_monster(String x){
    monster.append(x);
  }
  StringList get_monster(){
    return monster;
  }
  void push_room(String x){
    room.append(x);
  }
  void make_pocketBall(){
    pocket = new pocketBall(monster, room);
  }
  pocketBall get_pocketBall(){
    return pocket;
  }
}
