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

int clickCount = 0;
void setup() {
  size(800, 800);
  s = new Sword();
  s2 = new Sword();
  frameRate(10);
  level = loadImage("Level Background.png");
  robot = loadImage("Circular Rotating Robot.png");
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
  
  if (s.getHit()) {
    translate(width/2, height/2);
    rotate(robotAngle);
    //println("Sword 1 angle: " + robotAngle);
    ellipseMode(CORNER);
    ellipse(0, 200, 30, 30);
    //rotate(robotAngle);
  }
  
  if (s2.getHit()) {
    //translate(width/2, height/2);
    rotate(robotAngle);
    //println("Sword 2 angle: " + robotAngle);
    //ellipseMode(CORNER);
    ellipse(0, 200, 30, 30);
    rotate(robotAngle);
  }
  
  
}


void mousePressed() {
  clickCount++;
  println("Current click count: " + clickCount);
  //click=!click;
  s.shoot();
  s.setHit(true);
  
  if (clickCount == 2) {
    s2.shoot();
    s2.setHit(true);
  }

  //s.shoot();
}
//Class circle
