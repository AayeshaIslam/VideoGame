
class Board {
  Sword[] swords;
  int score;
  boolean clear;
  String diff;
  int lev = 1;
  float robotAngle = 0;
  float robotSpeed = 0.1;
    int remBomb;

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
    score=0;
     b.IncreaseLev();
    clear = false;
    int swordCount= int (random(5,15));
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
  }
   void display() {
    b.remBomb = b.swords.length - clickCount;
    b.remBomb = Math.max(0, b.remBomb);
   

    textSize(30);
    text("Remaining Bombs Left: ", -380, -360);
    text("Current Score ", -380, -260);
     text("Level ", 80, -360);

    textSize(65);
    text(remBomb, -70, -350);
    
    text(score, -70, -250);
    text(lev, 250, -350);
    score = clickCount;
    if(b.remBomb == 0){
      score = b.swords.length;
    }
    println(score);
    
    
  }
  int getremainingb(){
  return remBomb;
  }
}
