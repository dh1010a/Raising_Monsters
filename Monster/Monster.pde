import processing.sound.*;
PImage[] backImage, monsterImage, handImage, soapImage;
int i = 0, stageNum = 0;
String title = "몬스터  키우기";
int user_cnt = 0, user_num = 0;
int select_user = 0;
Table table;
StringList monsters, room;
User[] users = new User[10];
StartButton[] button_list = new StartButton[10];
PImage sun, person, backpack, backImage2, inven, ball, roomback, bed, window, tabl, home;
StartButton play = new StartButton("플레이");
int backAlpha = 0, pocket_num, frame, frame_dir = 1;
String pocket_name;
boolean firstClicked = false, mainDir = false, sound_play = false;
int maintargetX = 0, mainCharX= 50,maintargetY = 0, mainCharY= 50;
PFont f1,f2;
SoundFile stage0music;
SoundFile jump, foot, homefoot; 
BackButton backbutton;
OptionButton[] option_list;
int Option_time, jump_time;
boolean action1 = false, action2 = false, action3 = false, action4 = false, action5 = false;


void setup() {
  table = loadTable("data.csv", "header");
  size(800, 480);
  smooth();
  stage0music = new SoundFile(this, "back_sound.wav");
  jump = new SoundFile(this, "jump.wav");
  foot = new SoundFile(this, "footsound.wav");
  homefoot = new SoundFile(this, "homefoot.wav");
  sun = loadImage("sun.png");
  home = loadImage("home.jpg");
  backpack = loadImage("backpack.png");
  person = loadImage("person.png");
  bed = loadImage("bed.png");
  window = loadImage("window.png");
  backImage = new PImage[2];
  monsterImage = new PImage[5];
  handImage = new PImage[5];
  soapImage = new PImage[5];
  tabl = loadImage("tablerb.png");
  backImage[0] = loadImage("back.png");
  backImage[1] = loadImage("back.png");
  monsterImage[0] = loadImage("pika.png");
  monsterImage[1] = loadImage("ggobbok.png");
  monsterImage[2] = loadImage("cat.png");
  monsterImage[3] = loadImage("bear.png");
  monsterImage[4] = loadImage("elephant.png");
  for (int i = 1; i < 6; i++){
    handImage[i-1] = loadImage("hand"+i+"r.png");
  }
  for (int i = 1; i < 6; i++){
    soapImage[i-1] = loadImage("soap"+i+".png");
  }
  backImage2 = loadImage("back2.png");
  inven = loadImage("inven.png");
  ball = loadImage("pocketball.png");
  ball.resize(60,60);
  imageMode(CENTER);
  roomback = loadImage("roomback.png");
  monsters = new StringList();
  room = new StringList();
  monsters.append("pika");
  monsters.append("ggobbok");
  monsters.append("cat");
  monsters.append("bear");
  monsters.append("elephant");
  room.append("table");
  room.append("chair");
  room.append("window");
  room.append("bed");
  get_user();
}

void draw() {
  background(0);
  switch(stageNum) {
  case 0:
    stage1();
    break;
  case 1:
    stage2();
    break;
  case 2:
    stage3();
    break;
  case 3:
    stage4();
    break;
  case 4:
    stage5();
    break;
  }
}

void stage1(){
  image(backImage[0], width/2 + i, height/2, width, height);
  image(backImage[1], i-width/2, height/2, width, height);
  f1 = createFont("RixInooAriDuri_Pro Regular.otf", 80);
  f2 = createFont("NotoSansKR-Bold.otf", 40, true);
  textFont(f1);
  fill(0, 200);
  text(title, width/2, 130);
  textAlign(CENTER);
  if (!sound_play){
    stage0music.play();
    sound_play = true;
  }
  MoveButton t1 = new MoveButton(480,330,498,300,515,330);
  MoveButton t2 = new MoveButton(480,340,498,370,515,340);
  if (select_user == 0){
    t1.Draw();
    t2.Draw();
    button_list[user_num].Draw();
  }
  else{
     play.Draw();
  }
  println(users[user_num].get_monster());
  if (i < 800){
    i++;
  }
  else
      i = 0;
  if (mousePressed){
    if (t2.MouseIsOver()){
      user_num = (user_num+1) % user_cnt;
    }
    if (t1.MouseIsOver()){
      user_num = (user_num+user_cnt-1) % user_cnt;
    }
    if (play.MouseIsOver() && select_user == 1){
      stageNum++;
      if (sound_play){
      stage0music.stop();
      sound_play = false;
    }
    }
    if (button_list[user_num].MouseIsOver()){
      select_user = 1;
    }
    
    delay(100);
  }
}
void stage2(){
  if (backAlpha < 255) {
    tint(backAlpha);
  } else {
    stageNum = 1;
  }
  backbutton = new BackButton(15,30,30,45,30,15);
  image(backImage2, width/2, height/2, width, height);
  sun.resize(130,130);
  image(sun,  width - 80,  80);
  backpack.resize(70,70);
  image(backpack, 50, 90);
  textFont(f2);
  textSize(20);
  fill(0);
  text("인벤토리", 50, 130);
  backbutton.Draw();
  person.resize(100,155);
  backAlpha+=4;
  if (mainCharX > maintargetX) {
    mainCharX-=2;
    mainDir = true;
    if (!sound_play){
      foot.play();
      sound_play = true;
    }
  }
  if (mainCharX < maintargetX) {
    mainCharX+=2;
    mainDir = false;
    if (!sound_play){
      foot.play();
      sound_play = true;
    }
  }
  if (abs(mainCharX - maintargetX) < 5){
    foot.stop();
    foot.stop();
    foot.stop();
  }
  
  if (mainDir == true) {
    pushMatrix();
    scale(-1.0, 1.0);
    image(person, -mainCharX, 350);
    popMatrix();
  } else {
    image(person, mainCharX, 350);
  }
  if (mainCharX > 650){
    stageNum = 4;
    backAlpha = 0;
    mainCharX = 650;
    foot.stop();
    foot.stop();
    sound_play = false;
  }
  if (mousePressed){
    if (mouseX > 30 && mouseX < 80 && mouseY > 60 && mouseY < 120){
      stageNum++;
      backAlpha = 0;
    }
    if (backbutton.MouseIsOver()){
      foot.stop();
      foot.stop();
      stageNum -= 1;
      sound_play=false;
      select_user=0;
      backAlpha = 0;
    }
  }
}
void stage3(){
  pocketBall pocket;
  if (backAlpha < 255) {
    tint(backAlpha);
  } else {
    stageNum = 2;
  }
  image(inven, width/2, height/2, width, height);
  backbutton.Draw();
  backAlpha += 4;
  pocket = users[user_num].pocket;
  pocket.Draw();
  if (pocket.MouseIsOver()){
      pocket.show_name();
    }
  if (mousePressed){
    if (backbutton.MouseIsOver()){
      stageNum -= 1;
    }
    if (pocket.MouseIsOver()){
      stageNum += 1;
      backAlpha=0;
      pocket_name = pocket.get_pocketname();
    }
    delay(50);
  }
}
void stage4(){
  PImage pocketmon;
  if (backAlpha < 255) {
    tint(backAlpha);
  } else {
    stageNum = 3;
  }
  image(roomback, width/2, height/2, width, height);
  backbutton.Draw();
  backAlpha += 4;
  for (int i=0; i < monsters.size();i++){
    if(pocket_name.equals(monsters.get(i))){
      pocket_num = i;
    }
  }
  pocketmon = monsterImage[pocket_num];
  pocketmon.resize(70,80);
  if (maintargetX < 100){
    maintargetX = 100;
  }
  if (maintargetY < 100){
    maintargetY = 100;
  }
  if (maintargetX > 100 && maintargetY > 100){
    
    if (mainCharX > maintargetX) {
      mainCharX-=3;
      mainDir = true;
    }
    if (mainCharX < maintargetX) {
      mainCharX+=3;
      mainDir = false;
    }
    if (mainCharY > maintargetY) {
      mainCharY-=3;
    }
    if (mainCharY < maintargetY) {
      mainCharY+=3;
    }
    if (mainDir == true) {
      pushMatrix();
      scale(-1.0, 1.0);
      image(pocketmon, -mainCharX, mainCharY);
      popMatrix();
    } else {
      image(pocketmon, mainCharX, mainCharY);
    }
  }
  else{
    image(pocketmon, mainCharX, mainCharY);
  }
  option_list = new OptionButton[10];
  option_list[0] = new OptionButton(10, 100, "놀아주기");
  option_list[0].Draw();
  option_list[1] = new OptionButton(10, 150, "씻겨주기");
  option_list[1].Draw();
  option_list[2] = new OptionButton(10, 200, "침대놓기");
  option_list[2].Draw();
  option_list[3] = new OptionButton(10, 250, "창문놓기");
  option_list[3].Draw();
  option_list[4] = new OptionButton(10, 300, "탁자놓기");
  option_list[4].Draw();
  
  if (action1 && Option_time < 30){
    if (frame >= 4){
      frame_dir = -1;
    }
    if (frame <= 0){
      frame_dir = 1;
    }
    frame += frame_dir;
    Option_time++;
    PImage tmp = handImage[frame];
    tmp.resize(50,50);
    image(tmp, mainCharX, mainCharY);
    delay(20);
  }
  if (action2 && Option_time < 30){
    if (frame >= 4){
      frame_dir = -1;
    }
    if (frame <= 0){
      frame_dir = 1;
    }
    frame += frame_dir;
    Option_time++;
    PImage tmp = soapImage[frame];
    tmp.resize(50,50);
    image(tmp, mainCharX, mainCharY);
    sound_play = true;
    delay(20);
  }
  if (action3){
    PImage tmp = bed;
    tmp.resize(200,200);
    image(tmp, 700, 200);
  }
  if (action4){
    PImage tmp = window;
    tmp.resize(100,100);
    image(tmp, 500, 50);
    image(tmp, 300, 50);
  }
  if (action5){
    PImage tmp = tabl;
    tmp.resize(150,150);
    image(tmp, 300, 200);
  }
  if (Option_time >= 60 && Option_time < 90){
    if (frame >= 4){
      frame_dir = -1;
    }
    if (frame <= 0){
      frame_dir = 1;
    }
    frame += frame_dir;
    mainCharY += frame_dir * 5;
    if (!sound_play){
      jump.play();
      sound_play = true;
    }
    delay(20);
    if(Option_time % 10 == 0){
      sound_play = false;
    }
  }
  if (Option_time < 100 && Option_time >= 30)
    Option_time++;
  
  if (mousePressed){
    if (backbutton.MouseIsOver()){
      stageNum -= 1;
      backAlpha = 0;
    }
    if (option_list[0].MouseIsOver()){
      action1 = true;
      action2 = false;
      frame = 0;
      Option_time = 0;
    }
    else if (option_list[1].MouseIsOver()){
      action2 = true;
      action1 = false;
      frame = 0;
      Option_time = 0;
    }
    else if (option_list[2].MouseIsOver()){
      action3 = !action3;
      action2 = false;
      action1 = false;
      frame = 0;
      Option_time = 0;
    }
    else if (option_list[3].MouseIsOver()){
      action4 = !action4;
      action2 = false;
      action1 = false;
      frame = 0;
      Option_time = 0;
    }
    else if (option_list[4].MouseIsOver()){
      action5 = !action5;
      action2 = false;
      action1 = false;
      frame = 0;
      Option_time = 0;
    }
    delay(50);
  }
}

void stage5(){
  if (backAlpha < 255) {
    tint(backAlpha);
  } else {
    stageNum = 4;
  }
  person.resize(150,205);
  image(home, width/2, height/2, width, height);
  backbutton = new BackButton(15,30,30,45,30,15);
  backbutton.Draw();
  backAlpha+=4;
  if (mainCharX > maintargetX) {
    mainCharX-=3;
    mainDir = true;
    if (!sound_play){
      homefoot.play();
      sound_play = true;
    }
  }
  if (mainCharX < maintargetX) {
    mainCharX+=3;
    mainDir = false;
    if (!sound_play){
      homefoot.play();
      sound_play = true;
    }
  }
  if (mainDir == true) {
    pushMatrix();
    scale(-1.0, 1.0);
    image(person, -mainCharX, 350);
    popMatrix();
  } else {
    image(person, mainCharX, 350);
  }
  if (abs(mainCharX - maintargetX) < 5){
    homefoot.stop();
    homefoot.stop();
    homefoot.stop();
  }
  if (mousePressed){
    if (backbutton.MouseIsOver()){
      stageNum = 2;
      backAlpha = 0;
      sound_play = true;
    }
  }
}

void get_user(){
  for (TableRow row : table.rows()) {
    String id_1 = row.getString("name");
    User tmp = new User();
    StartButton tmpb = new StartButton(id_1);
    tmp.id = id_1;
    for (int i = 0; i < room.size();i++){
      String ts = row.getString(room.get(i));
      println(ts);
      if(ts.equals("yes")){
        tmp.push_room(room.get(i));
      }
      tmp.make_pocketBall();
    }
    for (int i = 0; i < monsters.size();i++){
      String ts = row.getString(monsters.get(i));
      println(ts);
      if(ts.equals("yes")){
        tmp.push_monster(monsters.get(i));
      }
      tmp.make_pocketBall();
    }
    users[user_cnt] = tmp;
    button_list[user_cnt] = tmpb;
    user_cnt++;
  }
}



void mouseClicked() {
  if (stageNum == 1 && firstClicked == false) {
    firstClicked = true;
  }
  if (stageNum == 1 && firstClicked == true) {
    maintargetX = mouseX;
    sound_play = false;
  }
  if (stageNum == 3 && firstClicked == false) {
    firstClicked = true;
  }
  if (stageNum == 3 && firstClicked == true) {
    maintargetX = mouseX;
    maintargetY = mouseY;
  }
  if (stageNum == 4 && firstClicked == true) {
    maintargetX = mouseX;
    sound_play = false;
  }
}
