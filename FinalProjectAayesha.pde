 import processing.sound.*;
 SoundFile file;
 SoundFile hitsound;
PImage robot;
PImage level;
PImage menu;
PGraphics pg;
Sword s;
Board b;
float sp=20;
boolean click=false;
boolean menubool=true;
float robotAngle = 0;
float robotSpeed = 0.1;
float coor;
float r=0;
int soundcount=0;
void setup() {
  size(800, 800);
  s= new Sword();
  frameRate(10);
  level = loadImage("level.png");
  robot = loadImage("Circular_Rotating_Robot.png");
  menu = loadImage("Menu Screen.png");
  pg = createGraphics( 600, 400);
  background(level);
  file = new SoundFile(this, "bgsound.mp3");
  file.loop();
  hitsound = new SoundFile(this, "Hard_Hit_Sound_Effect.mp3");
 if(s.gethit()==true){
   print("wassap");
 hitsound.play();
 }
  // noLoop();
}
void draw() {
 if(menubool==false){
  background(level);
  // b.Rotate();
  pushMatrix();
  translate(width/2, height/2);
  rotate(robotAngle);
  imageMode(CENTER);
  image(robot, 0, 0);
  robotAngle += robotSpeed;
  popMatrix();
  if (click==false && s.gethit()==false) {
    coor= s.shoot(0);
    coor=  s.shoot(sp);
  } else {
  }
  if (coor<=635) {
    //click=false;
    s.hit(true);
    if(soundcount==0){
    hitsound.play();
    soundcount++;
    }
   // hitsound.stop();
    //float p=s.shoot(-20);
    //println(p);
  }
  if (s.gethit()==true) {
    translate(width/2, height/2);
    rotate(robotAngle);
    rectMode(CORNER);
    rect(130, 130, 30, 70);
    //r+=robotSpeed;
  }
  //angle++;
 }
 else{
 background(menu);
 }
}
void mousePressed() {
  //click=!click;
  menubool=false;
}
//Class circle
