import processing.sound.*;
SoundFile file;
SoundFile hitsound;

PImage robot;
PImage level;
PImage menu;
boolean modeMenu;
boolean gameStart;
Board b;
int clickCount;

void setup() {
  size(800, 800);
  clickCount = 0;
  b = new Board(8);
  frameRate(10);
  level = loadImage("level.png");
  robot = loadImage("Circular_Rotating_Robot.png");
  menu = loadImage("Menu Screen.png");
  //background(level);
  modeMenu=true;
  gameStart=false;
  //file = new SoundFile(this, "Dystopian_Synthwave_Retrowave_-_Lost_City_Royalty_Free_Copyright_Safe_Music.mp3");
  //file.loop();
  hitsound = new SoundFile(this, "Hard_Hit_Sound_Effect.mp3");
}
void draw() {
// println(mouseX,mouseY);
  if(modeMenu){
  setbg(menu);
  }
  else{
    gameStart=true;
    setbg(level);
  translate(width/2, height/2);

  b.displayBoard(robot);
  
  //Goes through array and checks if a bomb has not been placed at the current index.
  b.placeBomb();
  b.display();
  if(b.getremainingb()==0){
  b.clear=true;
  clickCount=0;
  b.Reset();
  //b.IncreaseLev();
  }
   //println("lev",b.lev); 
  }
}

void setbg(PImage img){
background(img);
}
void mousePressed() {
  if(modeMenu){
    if(mouseX>=248 && mouseX<=550 && mouseY>=360 && mouseY<=430){
    modeMenu=false;
    }
    else if (mouseX>=242 && mouseX<=550 && mouseY>=540 && mouseY<=596){
    exit();
    }
  }
  if(modeMenu==false && gameStart==true){
  if (clickCount < b.swords.length) {
    println("Current click count: " + clickCount);
    b.clicked(clickCount);
  }
  
  clickCount++;
  }
}
