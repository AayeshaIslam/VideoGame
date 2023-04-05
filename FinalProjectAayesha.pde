
class Board {
  Sword[] swords;
  int score;
  boolean clear;
  String diff;
  int lev = 1;
  float robotAngle = 0;
  float robotSpeed = 0.1;
    int remBomb;
    int scorefinal=0;
    int scoredis=0;

  Board(int swordCount /*might need parameters for level to display level text*/) {
    swords = new Sword[swordCount];
    score = 0;
    clear = false;

    for (int i=0; i < swordCount; i++)
      swords[i]=new Sword();
  }

  int getScore() {
    return score;
  }

  void addScore(boolean b) {
    if (b)
      score+=1;
  }

  void Reset() {
    //Also need to display score screen
    //score=0;
   // scoredis+=scorefinal;
     b.IncreaseLev();
    clear = false;
    int swordCount= int (random(7,15));
     swords = new Sword[swordCount];
     for (int i=0; i < swordCount; i++)
      swords[i]=new Sword();
   
  }

  void SetDifficulty(String difficulty) {
    diff=difficulty;
  }

  void IncreaseLev() {
    if (clear) {
      lev++;
      //Display level text
    }
  }

  void placeBomb() {
    for (int i=0; i < swords.length; i++) {
      if (swords[i].getHit()) {
        swords[i].rotateSword();
      }
    }
  }

  void displayBoard(PImage img) {
    background(level);
    pushMatrix();
    rotate(robotAngle);
    imageMode(CENTER);
    image(img, 0, 0);
    robotAngle += robotSpeed;
    popMatrix();
  }
  
  void clicked(int c) {
    swords[c].shoot();
    score++;
  }
   void display() {
     PFont mono;
      mono = createFont("gamerfont3.otf", 128);
      textFont(mono);
    b.remBomb = b.swords.length - clickCount;
    b.remBomb = Math.max(0, b.remBomb);
   

    textSize(40);
    text("Remaining Bombs: ", -380, -360);
    text("Level ", -100, -260);
     text("Current Score: ", 60, -360);

    textSize(40);
    text(remBomb, -60, -360);
    
    text(lev, 50, -260);
    text(score, 340, -360);
    //score = clickCount;
   /*
    if(b.remBomb == 0){
      score = b.swords.length;
       scorefinal = score;
    println(scorefinal);
    }*/
   // println(score);
    
    
  }
  int getremainingb(){
  return remBomb;
  }
}
