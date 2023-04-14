class Board {
  Bomb[] bombs;
  //int score;
  boolean clear;
  String difficulty;
  
  //int score;
  int finalscore;
  int highestscore;
  
  int swordCount;
  float robotSpeed;
  
  int remainingBombs;
  int wave = 1;
  float robotAngle = PI/4;
  //float robotSpeed = random(0.025, 0.075);
  
  boolean lose = false;
  boolean mute = false;
  //boolean restart;

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
  void ResetAfterLose() {
    lose=false;
    /*
    finalscore = score;
    if(highestscore < finalscore){
    highestscore= finalscore;
    }*/
    score=0;
    clear = true;
    clickCount = 0;
    wave=1;
    //restart=false;
    //clear = false;
    //robotSpeed = random(0.025, 0.075);
  //  println("Robot Speed: " + robotSpeed);
  if (easyMode) {
      robotSpeed = random(0.025, 0.075);
    }
    else if (hardMode) {
      robotSpeed = random(0.076, 0.1);
    }
    int swordCount = int (random(7, 15));
    bombs = new Bomb[swordCount];
    for (int i=0; i < swordCount; i++)
      bombs[i]=new Bomb(robotSpeed);
  }

  void clicked(int c, SoundFile hit) {
    fill(0);
    bombs[c].shoot();
    if (!mute)
    //  hit.play();
    if (!lose)
      score+=1;
  }

/*Lose condition*/
  void collisionCheck() {
    for (int i = 0; i < bombs.length; i++) {
      if (bombs[clickCount].getHit() && bombs[i].getHit() && (i != clickCount)) {
        if (dist(bombs[i].x, bombs[i].y, bombs[clickCount].x, bombs[clickCount].y) <=40) {
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
void EndScreen(PImage p){
  background(p);
     finalscore = score;
    if(highestscore < finalscore){
    highestscore= finalscore;
    }
    //translate(width/2,height/2);
     PFont end;
    end = createFont("Architype Font.otf", 128);
    textFont(end);
    //print("end");
    textSize(90);
    // text("GAME OVER! ", -90, 160);
   // text( score, 100, 260);
  textSize(90);
    fill(255);
    // fill(17, 10, 97);
    //text("FINAL SCORE: ", 220, 350);
    text( " "+score, -55, 15);
    textSize(30);
    text( " "+score, 30, 140);
    //text("WAVES COMPLETED: ", 220, 450);
    text( " "+(wave-1), 30, 185);
    //text("HIGHEST SCORE: ", 220, 550);
    if(highestscore!=0){
    text( " "+highestscore, 30, 235);
    }
    else{
    text( " "+score, 30, 235);
    }
    
   // rect(277,691,170,40);
    text("TRY AGAIN",277,730);

  }
}
