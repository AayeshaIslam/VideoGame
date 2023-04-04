import processing.sound.*;
SoundFile file;
SoundFile hitsound;

PImage robot;
PImage level;
Sword s;
Sword s2;
Board b;
float sp=20;
boolean click=false;
float robotAngle = 0;
float robotSpeed = 0.1;
float coor;
float r=0;
float x;
float y;

int clickCount = -1;
void setup() {
  size(800, 800);
  s = new Sword();
  s2 = new Sword();
  b= new Board(7);
 
  frameRate(10);
  level = loadImage("level.png");
  robot = loadImage("Circular_Rotating_Robot.png");
  background(level);
  
  //file = new SoundFile(this, "Dystopian_Synthwave_Retrowave_-_Lost_City_Royalty_Free_Copyright_Safe_Music.mp3");
  //file.loop();
  hitsound = new SoundFile(this, "Hard_Hit_Sound_Effect.mp3");

  // noLoop();
}
void draw() {
  background(level);
  pushMatrix();
  translate(width/2, height/2);
  rotate(robotAngle);
  imageMode(CENTER);
  image(robot, 0, 0);
  robotAngle += robotSpeed;
  popMatrix();
  
  translate(width/2, height/2);
  /*
  if (s.getHit()) {
    s.rotateSword();
  }
  
  if (s2.getHit()) {
    s2.rotateSword();
  }
  */
  b.arrayrotate();
  
}


void mousePressed() {
  clickCount++;
  println("Current click count: " + clickCount);
  /*
  s.shoot();
  
  if (clickCount == 2) {
    s2.shoot();
  }
*/
if(clickCount<b.swords.length){
b.clicker(clickCount);
}
  //s.shoot();
}
