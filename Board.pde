class Board {
  Bomb[] bombs;
  //int score;
  boolean clear;
  String difficulty;
  
  int finalScore;
  int highScore;

  int bombCount;
  float robotSpeed;

  int remainingBombs;
  int wave = 1;
  float robotAngle = PI/4;

  boolean lose = false;
  boolean mute = false;

  //Constructor
  Board(int _bombCount, float _robotSpeed) {
    bombCount = _bombCount;
    robotSpeed = _robotSpeed;
    bombs = new Bomb[bombCount];
    score = 0;
    clear = false;

    for (int i=0; i < bombCount; i++)
      bombs[i]=new Bomb(robotSpeed);
  }

  //Displays board
  void displayBoard(PImage img) {
    PFont f = createFont("Architype Font.otf", 128);
    textFont(f);
    pushMatrix();
    rotate(robotAngle);
    imageMode(CENTER);
    image(img, 0, 0);
    robotAngle += robotSpeed;
    popMatrix();

    remainingBombs = bombs.length - clickCount;
    remainingBombs = Math.max(0, remainingBombs);

    //Extra backround
    fill(17, 10, 97);
    boardText(-377, -172, 123, 313, -70, 55);
    fill(255); //Fill color of bomb
    boardText(-380, -175, 120, 310, -75, 50);
  }

  //Bomb Placement
  void placeBomb() {
    fill(158, 9, 146);
    //Need to check if previous sword has hit the robot. If it has, you can place a new sword.
    for (int i=0; i < bombs.length; i++) {
      if (bombs[i].getHit())
        bombs[i].rotateBomb();
      fill(158, 9, 146);
    }
  }

  //Reset board for next level
  void ResetNextLevel() {
    clear = true;
    clickCount = 0;
    wave++;
    clear = false;
    if (easyMode) {
      robotSpeed = random(0.025, 0.075);
    } else if (hardMode) {
      robotSpeed = random(0.076, 0.1);
    }

    index = (int) random(0, 5);
    background(waves[index]);
    //robotSpeed = random(0.025, 0.075);
    println("Robot Speed: " + robotSpeed);
    int bombCount = int (random(7, 15));
    bombs = new Bomb[bombCount];
    for (int i=0; i < bombCount; i++)
      bombs[i]=new Bomb(robotSpeed);
  }

  void ResetAfterLose() {
    lose=false;
    score=0;
    clear = true;
    clickCount = 0;
    wave=1;
    if (easyMode) {
      bombCount = int (random(7, 15));
      robotSpeed = random(0.025, 0.075);
    } else if (hardMode) {
      bombCount = int (random(10, 30));
      robotSpeed = random(0.076, 0.1);
    }
    bombs = new Bomb[bombCount];
    for (int i=0; i < bombCount; i++)
      bombs[i]=new Bomb(robotSpeed);
  }


  void clicked(int c, SoundFile hit) {
    bombs[c].shoot();
    if (!mute)
      hit.play();
    if (!lose)
      if (easyMode)
        score+=1;
      else if (hardMode)
        score+=2;
  }

  /*Lose condition*/
  void collisionCheck() {
    for (int i = 0; i < bombs.length; i++) {
      if (bombs[clickCount].getHit() && bombs[i].getHit() && (i != clickCount)) {
        if (dist(bombs[i].x, bombs[i].y, bombs[clickCount].x, bombs[clickCount].y) <= 36) {
          println("COLLIDED!");
          lose = true;
          clear = true;
        }
      }
    }
  }

  void boardText(int x1, int x2, int x3, int x4, int x5, int x6/*, int x7, int x8*/) {
    textSize(25);
    text("REMAINING BOMBS: ", x1, -360);
    text(" " + remainingBombs, x2, -360);
    text("CURRENT SCORE: ", x3, -360);
    text(" " + score, x4, -360);

    textSize(40);
    text("WAVE ", x5, -260); //Change to x7
    text(wave, x6, -260); //Change to x8
  }

  void displayEndScreen(PImage p) {
    background(p);
    finalScore = score;
    if (highScore < finalScore) {
      highScore = finalScore;
    }
    PFont end;
    end = createFont("Architype Font.otf", 128);
    textFont(end);
    textSize(90);
    fill(255);
    //Bombs placed
    if (easyMode) {
      text( " " + score, -75, 15);
    }
    else if (hardMode) {
      text( " " + score/2, -75, 15);
    }
    textSize(30);
    //Total Score
    text( " "+ score, 30, 140);
    text( " "+ (wave-1), 30, 185);
    
    if (highScore!=0) {
      text( " " + highScore, 30, 235);
    } 
    else {
      text( " " + score, 30, 235);
    }
  }
}
