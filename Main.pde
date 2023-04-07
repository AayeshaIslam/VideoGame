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

//Board-related items
Board b;
int clickCount;
int score;

//Background booleans
boolean modeMenu;
boolean gameStart;

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

  b = new Board(int(random(5, 25))); //Create a new board object of random number of bombs from 5 - 25
  clickCount = 0;
  score = 0;

  waveBackground = loadImage("Level Background.png");
  robot = loadImage("Circular Rotating Robot.png");
  menu = loadImage("Menu Screen.png");

  modeMenu = true;
  gameStart = false;
}
void draw() {
  if (modeMenu) {
    setBackground(menu);
  } 
  else {
    gameStart = true;

    setBackground(waveBackground);
    translate(width/2, height/2);
    b.displayBoard(robot);

    b.placeBomb(); //Goes through array and checks if a bomb has not been placed at the current index.
    if (b.getRemainingBombs() == 0) {
      robotSound.play();
      b.Reset();
    }
  }
}


void mousePressed() {
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
  if (mouseX>=248 && mouseX<=550 && mouseY>=360 && mouseY<=430) { 
    mouseClick.play();
    modeMenu=false;
  } 
  //QUIT BUTTON
  else if (mouseX>=242 && mouseX<=550 && mouseY>=540 && mouseY<=596) {
    mouseClick.play();
    exit();
  }
  //Need one more condition for "HELP" button
}
