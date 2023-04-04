class Board {
  Sword[] swords;
  int score;
  boolean clear;
  String diff;
  int lev = 0;
  float robotAngle = 0;
  float robotSpeed = 0.1;

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
    clear = false;
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
}

