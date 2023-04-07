//Sound files
import processing.sound.*;
SoundFile file;
SoundFile hitsound;
SoundFile mouseClick;
SoundFile robotSound;
Sound volume;

//Images
PImage robot;
PImage menu;
PImage waveBackground;
PImage help;
PImage modes;
//Board-related items
Board b;
int clickCount;
int score;

//Background booleans
boolean modeMenu;
boolean gameStart;
boolean helpBool = false;
boolean modesBool = false;
boolean easyMode = false;
boolean finScreen = false;

void setup() {
  size(800, 800);
  frameRate(32);
 
  volume = new Sound(this);
  volume.volume(0.05);
  //if (b.mute==false){
  file = new SoundFile(this, "bgsound.wav");
 
  file.loop();
  
  hitsound = new SoundFile(this, "Hard_Hit_Sound_Effect.mp3");
  mouseClick = new SoundFile(this, "Click_Sound.wav");
  robotSound = new SoundFile(this, "Robot_Sound.wav");
 // }
  b = new Board(int(random(5, 25))); //Create a new board object of random number of bombs from 5 - 25
  clickCount = 0;
  score = 0;

  waveBackground = loadImage("level.png");
  robot = loadImage("Circular_Rotating_Robot.png");
  menu = loadImage("Menu Screen.png");
  help = loadImage("Help_Screen.png");
  modes = loadImage("Gamemodes_Screen.png");

  modeMenu = true;
  gameStart = false;
}
void draw() {

  if (modeMenu) {
    setBackground(menu);
  if(helpBool){
  setBackground(help);
  }
  if(modesBool){
  setBackground(modes);
  }
  } 
  else if(b.lose){
    //print("lose");
  setBackground(waveBackground);
  fill(255);
  b.EndScreen();
  }
   
  else {
    gameStart = true;

    setBackground(waveBackground);
    translate(width/2, height/2);
    b.displayBoard(robot);

    b.placeBomb(); //Goes through array and checks if a bomb has not been placed at the current index.
    if (b.getRemainingBombs() == 0) {
      if(b.mute==false){
      robotSound.play();
      }
      b.Reset();
    }
  }
}


void mousePressed() {
    println(mouseX," ",mouseY);
  if (modeMenu) {
    menuOptions();
  }
  else if (gameStart) {
    if (clickCount < b.bombs.length) {
      b.clicked(clickCount, hitsound);
      b.collisionCheck();
      clickCount++;
    }
  }
}

void setBackground(PImage img) {
  background(img);
}

void menuOptions() {
  //START BUTTON -> Goes to modes
  if (modesBool==false && mouseX>=248 && mouseX<=550 && mouseY>=360 && mouseY<=430) { 
    if(b.mute==false){
    mouseClick.play();
    }
   
    modesBool = true;
    println("modesbool",modesBool);
  } 
  //QUIT BUTTON
  else if (mouseX>=242 && mouseX<=550 && mouseY>=540 && mouseY<=596) {
    if(b.mute==false){
    mouseClick.play();
    }
    exit();
  }
  else if(mouseX>=242 && mouseX<=555 && mouseY>=456 && mouseY<=520){
     helpBool=true;
  }
  else if(modesBool==true) {
    if(mouseX<=391 && mouseX>=33 && mouseY>=365 &&mouseY<=431){
      easyMode = true;
    }
  }
  if(helpBool==true && mouseX>=240 && mouseX<=524 && mouseY>=678 && mouseY<=735){
  helpBool=false;
  }
  
  if(modesBool==true && easyMode==true){
  modeMenu=false;
 
  }
  //Need one more condition for "HELP" button
}
