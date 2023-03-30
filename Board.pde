Sword[] swords;
int score;
boolean clear;
String diff;
int lev=0;
class Board{
Board(int num){
swords= new Sword[num];
score=0;
clear = false;

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
}
void SetDifficulty(String difficulty){
diff=difficulty;
}
void IncreaseLev(){
if(clear==true){
lev++;
}
}
}
