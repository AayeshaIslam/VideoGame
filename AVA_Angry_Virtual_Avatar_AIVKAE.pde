//Sound files
import processing.sound.*;
SoundFile file;
SoundFile hitsound;
SoundFile mouseClick;
SoundFile robotSound;
SoundFile laserSound;
SoundFile explosionSound;
Sound volume;

//Images
PImage easyRobot;
PImage hardRobot;
PImage menuScreen;
PImage waveBackground;
PImage helpScreen;
PImage modesScreen;
PImage endScreen;
PImage[] waves = new PImage[6];
PImage waveBackdrop1;
PImage waveBackdrop2;
PImage waveBackdrop3;
PImage waveBackdrop4;
PImage waveBackdrop5;
PImage waveBackdrop6;

//Board-related items
Modes easy = new Modes("easy");
Modes hard = new Modes("hard");
//Board b;
int clickCount;
int score;

int easyHighScore;
int hardHighScore;

//Background booleans
boolean modeMenu;
boolean gameModes;
boolean gameStart;
boolean help;
boolean easyMode;
boolean hardMode;
boolean gameEnd;

//Miscellaneous
int index;
boolean firstDisplayed = false;

void setup() {
  size(800, 800);
  frameRate(32);

  volume = new Sound(this);
  volume.volume(0.05);
  file = new SoundFile(this, "AVA Background Music.wav");
  file.loop();
  hitsound = new SoundFile(this, "Hard Hit Sound.mp3");
  mouseClick = new SoundFile(this, "Click Sound.wav");
  robotSound = new SoundFile(this, "Robot Sound.wav");
  laserSound = new SoundFile(this, "Laser Sound.wav");
  explosionSound = new SoundFile(this, "Explosion Sound.wav");

  //b = new Board(int(random(7, 15))); //Create a new board object of random number of bombs from 5 - 25
  clickCount = 0;
  score = 0;

  easyRobot = loadImage("Easy Robot.png");
  hardRobot = loadImage("Hard Robot.png");
  menuScreen = loadImage("Menu Screen.png");
  helpScreen = loadImage("Help Screen.png");
  modesScreen = loadImage("Gamemodes Screen.png");
  endScreen = loadImage("End Screen.png");
  
  waveBackdrop1 = loadImage("Level Backdrop 1.png");
  waveBackdrop2 = loadImage("Level Backdrop 2.png");
  waveBackdrop3 = loadImage("Level Backdrop 3.png");
  waveBackdrop4 = loadImage("Level Backdrop 4.png");
  waveBackdrop4 = loadImage("Level Backdrop 5.png");
  waveBackdrop5 = loadImage("Level Backdrop 6.png");
  
  waves[0] = waveBackdrop1;
  waves[1] = waveBackdrop2;
  waves[2] = waveBackdrop3;
  waves[3] = waveBackdrop4;
  waves[4] = waveBackdrop5;
  waves[5] = waveBackdrop6;
 
 
  modeMenu = true;
  gameStart = false;
  gameModes = false;
  help = false;
  easyMode = false;
  hardMode = false;
  
  index = (int) random(0, 5);
}
void draw() {
  if (modeMenu) {
    setBackground(menuScreen);
  } 
  else if (help) {
    setBackground(helpScreen);
  } 
  else if (gameModes) {
    setBackground(modesScreen);
  } 
  else if (easyMode) {
    gameStart = true;
    setBackground(waves[index]);
    translate(width/2, height/2);
    easy.runningGame(easyRobot);
  }
  else if (hardMode) {
    gameStart = true;
    setBackground(waves[index]);
    translate(width/2, height/2);
    hard.runningGame(hardRobot);
  }
}


void mousePressed() {
  //If the game has started, keep track of click count and number of bombs
  if (gameStart && easyMode) {
    easy.clickCountCheck();
  }
  else if (gameStart && hardMode) {
    hard.clickCountCheck();
  }
  else if (gameEnd==true && mouseX>=277 && mouseX<=447 && mouseY>=691 && mouseY<=740) {
    mouseClick.play();
    if(easyMode){
     easy.restart=true;
    }
    else if (hardMode){
     hard.restart=true;
    }
  }
  else {
    options();
  }
}

void setBackground(PImage img) {
  background(img);
}

void options() {
  if (modeMenu) {
    //START BUTTON -> Goes to modes
    if (mouseX>=248 && mouseX<=550 && mouseY>=360 && mouseY<=430) {
      mouseClick.play();
      modeMenu=false;
      gameModes = true;
    }
    //HELP BUTTON
    else if (mouseX>=242 && mouseX<=555 && mouseY>=456 && mouseY<=520) {
      mouseClick.play();
      modeMenu = false;
      gameModes = false;
      help=true;
    }
    //QUIT BUTTON
    else if (mouseX>=242 && mouseX<=550 && mouseY>=540 && mouseY<=596) {
      mouseClick.play();
      exit();
    }
  } 
  else if (gameModes) {
    //EASY BUTTON
    if (mouseX<=391 && mouseX>=33 && mouseY>=365 &&mouseY<=431) {
      mouseClick.play();
      modeMenu = false;
      gameModes = false;
      easyMode = true;
      hardMode = false;
    }
    //HARD BUTTON
    else if (mouseX <=780 && mouseX >=416 && mouseY >=365 &&mouseY <=431) {
      mouseClick.play();
      modeMenu = false;
      gameModes = false;
      easyMode = false;
      hardMode = true;
    }
    //BACK BUTTON
    else if (mouseX>=271 && mouseX<=550 && mouseY>=470 && mouseY<=525) {
      mouseClick.play();
      gameModes = false;
      modeMenu = true;
    }
  } 
  else if (help) {
    //BACK BUTTON
    if (mouseX>=240 && mouseX<=524 && mouseY>=678 && mouseY<=735) {
      mouseClick.play();
      help=false;
      modeMenu = true;
    }
  }
}
