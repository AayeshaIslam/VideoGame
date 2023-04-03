PImage robot;
PImage level;
PGraphics pg;
Sword s;
Board b;
float sp=20;
boolean click=false;
float robotAngle = 0;
float robotSpeed = 0.1;
float coor;
float r=0;
void setup() {
  size(800, 800);
  s= new Sword();
  frameRate(10);
  level = loadImage("level.png");
  robot = loadImage("Circular_Rotating_Robot.png");
  pg = createGraphics( 600, 400);
  background(level);

  // noLoop();
}
void draw() {
  // println(mouseX,mouseY);
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
    //float p=s.shoot(-20);
    //println(p);
  }
  if (s.gethit()==true) {
    translate(width/2, height/2);
    rotate(robotAngle);
    rectMode(CENTER);
    rect(150, 170, 30, 70);
    r+=robotSpeed;
  }
  //angle++;
}
void mousePressed() {
  click=!click;
}
//Class circle
