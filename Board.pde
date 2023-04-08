
class Board {
  Bomb[] bombs;
  int score;
  int finalscore;
  int highestscore;
  boolean clear;
  String diff;
  int remainingBombs;
  int wave = 1;
  float robotAngle = PI/4;
  float robotSpeed = random(0.025, 0.075);
  boolean lose = false;
  boolean mute = false;
  boolean restart;

  //Constructor
  Board(int swordCount) {
    bombs = new Bomb[swordCount];
    score = 0;
    clear = false;

    for (int i=0; i < swordCount; i++)
      bombs[i]=new Bomb(robotSpeed);
  }

  //Displays board
  void displayBoard(PImage img) {
    PFont mono;
    mono = createFont("Architype_Font.otf", 128);
    textFont(mono);
    pushMatrix();
    rotate(robotAngle);
    imageMode(CENTER);
    image(img, 0, 0);
    robotAngle += robotSpeed;
    popMatrix();

    remainingBombs = bombs.length - clickCount;
    remainingBombs = Math.max(0, remainingBombs);

    //Extra backround
    //fill(48, 67, 186);
    fill(17, 10, 97);
    //fill(40, 48, 97);
    boardText(-377, -172, 123, 313, -70, 55);
    fill(255);
    boardText(-380, -175, 120, 310, -75, 50);
  }

  void placeBomb() {
    //Need to check if previous sword has hit the robot. If it has, you can place a new sword.
    for (int i=0; i < bombs.length; i++) {
      if (bombs[i].getHit())
        bombs[i].rotateBomb();
    }
  }

  void Reset() {
    
    b.clear = true;
    clickCount = 0;
    wave++;
    clear = false;
    robotSpeed = random(0.025, 0.075);
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
    restart=false;
    //clear = false;
    robotSpeed = random(0.025, 0.075);
  //  println("Robot Speed: " + robotSpeed);
    int swordCount = int (random(7, 15));
    bombs = new Bomb[swordCount];
    for (int i=0; i < swordCount; i++)
      bombs[i]=new Bomb(robotSpeed);
  }


  void clicked(int c, SoundFile hit) {
    bombs[c].shoot();
    //Temporary score counter for now; need to first check for collisions.
    if(mute==false){
    hit.play();
    }
    if(lose==false){
    score+=1;
    }
  }

  void collisionCheck() {
    for (int i = 0; i < bombs.length; i++) {
      if (bombs[clickCount].getHit() && bombs[i].getHit() && (i != clickCount)) {

       // System.out.println("Current sword placed coordinates: X - " + bombs[clickCount].x + ", Y - " + bombs[clickCount].y);
       // System.out.println("Checking sword at i: X - " + bombs[i].x + ", Y - " + bombs[i].y);
        //System.out.println("Distance: " + dist(bombs[i].x, bombs[i].y, bombs[clickCount].x, bombs[clickCount].y));


        if (collided(bombs[i].x, bombs[i].y, bombs[clickCount].x, bombs[clickCount].y)) {
          /*Lose condition*/
         // println("COLLIDED!");
          lose = true;
          clear = true;
        }
      }
    }
  }

  boolean collided(float x1, float y1, float x2, float y2) {
    if (dist(x1, y1, x2, y2) <= 36) {
     // println("COLLIDED!");
      return true;
    }
    return false;
  }


  int getRemainingBombs() {
    return remainingBombs;
  }

  int getScore() {
    return score;
  }

  void SetDifficulty(String difficulty) {
    diff=difficulty;
  }

  void boardText(int x1, int x2, int x3, int x4, int x5, int x6) {
    textSize(25);
    text("REMAINING BOMBS: ", x1, -360);
    text(" " + remainingBombs, x2, -360);
    text("CURRENT SCORE: ", x3, -360);
    text(" " + score, x4, -360);

    textSize(40);
    text("WAVE ", x5, -260);
    text(wave, x6, -260);
  }
  void EndScreen(){
     finalscore = score;
    if(highestscore < finalscore){
    highestscore= finalscore;
    }
    //translate(width/2,height/2);
     PFont end;
    end = createFont("Architype_Font.otf", 128);
    textFont(end);
    //print("end");
    textSize(90);
     text("GAME OVER! ", 180, 160);
   // text( score, 100, 260);
  textSize(40);
    fill(255);
    // fill(17, 10, 97);
    text("FINAL SCORE: ", 220, 350);
    text( " "+score, 480, 350);
    text("WAVES COMPLETED: ", 220, 450);
    text( " "+(wave-1), 600, 450);
    text("HIGHEST SCORE: ", 220, 550);
    if(highestscore!=0){
    text( " "+highestscore, 520, 550);
    }
    else{
    text( " "+score, 520, 550);
    }
    
   // rect(277,691,170,40);
    text("TRY AGAIN",277,730);

  }
}
