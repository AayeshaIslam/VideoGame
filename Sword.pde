float speed;
float Pos;
boolean hit;
class Sword {
Sword() {
 speed = 20;
 Pos = 750;
 hit = false;
}
float shoot(float sp){
//background(255);
//speed=sp;
if(sp==0){
rect(width/2,Pos+speed,30,70);

//speed-=20;

}
else if(sp<0){
rect(width/2,Pos+speed,30,70);

speed+=20;
}
else{
rect(width/2,Pos+speed,30,70);

speed-=20;

}
return Pos+speed;
}
void hit(boolean b){
hit=b;
}
boolean gethit(){

return hit;
}
}
