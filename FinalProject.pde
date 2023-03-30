PImage img; 
PGraphics pg;
Sword s;
float sp=20;
boolean click=false;
void setup(){
  size(800,800);
  s= new Sword();
frameRate(32);
  img= loadImage( "http://reesephoto.files.wordpress.com/2012/07/swallowtail-on-red-flowers.jpg" );
  pg = createGraphics( 600, 400);
  

 
 // noLoop();
}
void draw(){
   pg.beginDraw();
  pg.background(0);
  pg.noStroke();
  pg.fill(255);
  pg.smooth();
  pg.ellipse(400,200,400,400);
  pg.endDraw();
  img.mask( pg.get() ); // This is the magic.
  background(128,200,30);
  image( img, 0, 0 );
  if(click==false){
  s.shoot(0);
  }
  else{
  s.shoot(sp);
  }
 
  
}
void mousePressed(){
click=!click;
}
