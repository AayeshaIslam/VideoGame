PImage robot;
PImage level;
PGraphics pg;
Sword s;
Board b;
float sp=20;
boolean click=false;
float robotAngle = 0;
float robotSpeed = 0.1;


void setup() {
  size(800, 800);
  s= new Sword();
  frameRate(10);
  level = loadImage("Level Background.png");
  robot = loadImage("Circular Rotating Robot.png");
  pg = createGraphics( 600, 400);
  background(level);

  // noLoop();
}
void draw() {
  background(level);
  pushMatrix();
  translate(width/2, height/2);
  rotate(robotAngle);
  imageMode(CENTER);
  image(robot, 0, 0);
  robotAngle += speed;
  popMatrix();
  if (click==false) {
    s.shoot(0);
  } else {
    s.shoot(sp);
  }
  //angle++;
}
void mousePressed() {
  click=!click;
}
