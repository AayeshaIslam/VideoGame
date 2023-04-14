class Board {
  Bomb[] bombs;
  //int score;
  boolean clear;
  String difficulty;
  
  int swordCount;
  float robotSpeed;
  
  int remainingBombs;
  int wave = 1;
  float robotAngle = PI/4;
  //float robotSpeed = random(0.025, 0.075);
  
  boolean lose = false;
  boolean mute = false;

  //Constructor
  Board(int _swordCount, float _robotSpeed) {
    swordCount = _swordCount;
    robotSpeed = _robotSpeed;
    bombs = new Bomb[swordCount];
    score = 0;
    clear = false;

    for (int i=0; i < swordCount; i++)
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
    fill(255);
    boardText(-380, -175, 120, 310, -75, 50);
  }

  //Bomb Placement
  void placeBomb() {
    //Need to check if previous sword has hit the robot. If it has, you can place a new sword.
    for (int i=0; i < bombs.length; i++) {
      if (bombs[i].getHit())
        bombs[i].rotateBomb();
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
    }
    else if (hardMode) {
      robotSpeed = random(0.076, 0.1);
    }
    //robotSpeed = random(0.025, 0.075);
    println("Robot Speed: " + robotSpeed);
    int swordCount = int (random(7, 15));
    bombs = new Bomb[swordCount];
    for (int i=0; i < swordCount; i++)
      bombs[i]=new Bomb(robotSpeed);
  }


  void clicked(int c, SoundFile hit) {
    bombs[c].shoot();
    if (!mute)
      hit.play();
    if (!lose)
      score+=1;
  }

/*Lose condition*/
  void collisionCheck() {
    for (int i = 0; i < bombs.length; i++) {
      if (bombs[clickCount].getHit() && bombs[i].getHit() && (i != clickCount)) {
        if (dist(bombs[i].x, bombs[i].y, bombs[clickCount].x, bombs[clickCount].y) <=36) {
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
    
    //textSize(20);
    //text("HIGH SCORE: ", x5, -340);
    //text(" " , highScore);

    textSize(40);
    text("WAVE ", x5, -260); //Change to x7
    text(wave, x6, -260); //Change to x8
  }

  void EndScreen() {
    PFont f = createFont("Architype Font.otf", 128);
    textFont(f);
    //translate(width/2, height/2);
    //print("end");
    textSize(90);
    text("GAME OVER! ", 0, 0);
    // text( score, 100, 260);
    textSize(40);
    fill(255);
    // fill(17, 10, 97);
    text("FINAL SCORE: ", 220, 350);
    text( " "+score, 480, 350);
    text("WAVES COMPLETED: ", 220, 450);
    text( " "+wave, 600, 450);
    text("HIGHEST SCORE: ", 220, 550);
    text( " "+score, 520, 550);
  }
}
