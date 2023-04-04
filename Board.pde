

class Board{
  Sword[] swords;
int score;
boolean clear;
String diff;
int lev=0;
Board(int num){
swords= new Sword[num];
score=0;
clear = false;
 for (int i=0;i<num;i++){
  swords[i]=new Sword();
  
  }
}
int getScore(){
return score;
}
void addScore(boolean b){
if (b==true){
score=score+1;
}

}
void Reset(){
score=0;
clear = false;

}
void Rotate(){
//Rotation and translation functionality
pushMatrix();
  translate(width/2, height/2);
  rotate(robotAngle);
  imageMode(CENTER);
  image(robot, 0, 0);
  robotAngle += robotSpeed;
  popMatrix();
}
void SetDifficulty(String difficulty){
diff=difficulty;
}
void IncreaseLev(){
if(clear==true){
lev++;
}
}
void arrayrotate(){
  for(int i=0;i<swords.length;i++){
if (swords[i].getHit()) {
    swords[i].rotateSword();
    }
  }

}
void clicker(int c){
swords[c].shoot();

}
}
