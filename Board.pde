class Board {
  Bomb[] bombs;
  boolean clear;
  String difficulty;
  
  int finalScore;
  int highScore;

  int bombCount;
  float robotSpeed;

  int remainingBombs;
  int wave = 1;
  float robotAngle = PI/4;
  int negateSpeed;

  boolean lose = false;
  boolean mute = false;

  //Constructor
  /* 
  Constructor parameters accept randomly generated values for number of 
  bombs and robot speed, and uses those values to make a new array of bombs 
  and set their speed. 
  */
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
  /* 
  This function takes in the board image as a parameter and rotates it 
  according to the robot speed. It also calculates the stats of the game and 
  calls the function which displays them. 
  */
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
  /*
  This function controls the color of the bombs, and 
  determines which bombs have hit the board and thus need to be rotated.
  */
  void placeBomb() {
    fill(158, 9, 146);
    for (int i=0; i < bombs.length; i++) {
      if (bombs[i].getHit())
        bombs[i].rotateBomb();
      fill(158, 9, 146);
    }
  }

  //Reset board for next level
  /* 
  This is a reset function for each wave, it determines a new robot speed,
  a new background, makes a new array of bombs, and increments the wave. 
  */
  void ResetNextLevel() {
    clear = true;
    clickCount = 0;
    wave++;
    clear = false;
    if (easyMode) {
      robotSpeed = random(0.025, 0.075);
    } else if (hardMode) {
      negateSpeed = int (random(0, 1));
      if (negateSpeed == 0) {
        robotSpeed = random(0.076, 0.1);
      }
      else if (negateSpeed == 1) {
        robotSpeed = random(-0.1, -0.076);
      }
    }

    index = (int) random(0, 5);
    background(waves[index]);
    int bombCount = int (random(7, 15));
    bombs = new Bomb[bombCount];
    for (int i=0; i < bombCount; i++)
      bombs[i]=new Bomb(robotSpeed);
  }

/* 
This is the reset function for the whole game, and is called if the game is lost. 
It resets the stats, makes a new robot speed, and a new array of bombs. 
*/
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
      
      negateSpeed = int (random(0, 1));
      if (negateSpeed == 0) {
        robotSpeed = random(0.076, 0.1);
      }
      else if (negateSpeed == 1) {
        robotSpeed = random(-0.1, -0.076);
      }
    }
    bombs = new Bomb[bombCount];
    for (int i=0; i < bombCount; i++)
      bombs[i]=new Bomb(robotSpeed);
  }

/* 
The score is incremented within this function, along with the clicking sound.
Additionally, the shoot function is called here, which controls the 
movement of the bomb until it reaches the board. 
*/
  void clicked(int c) {
    bombs[c].shoot();
    if (!mute)
      hitsound.play();
    if (!lose)
      if (easyMode)
        score+=1;
       else if (hardMode)
         score+=2;
  }

  //Lose condition
/* 
Check if a collision occured between two bombs by taking into account 
the distance between them. If the distance is less than 36 
(radius+stroke of two circles), the lose condition is set to true.
*/
  void collisionCheck() {
    for (int i = 0; i < bombs.length; i++) {
      if (bombs[clickCount].getHit() && bombs[i].getHit() && (i != clickCount)) {
        if (dist(bombs[i].x, bombs[i].y, bombs[clickCount].x, bombs[clickCount].y) <= 36) {
          lose = true;
          clear = true;
        }
      }
    }
  }

//Formatting the text for the stats, such as coordinates and text size.
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
  
/* 
This function takes in an image as a parameter to set the image for the endscreen.
The highscore is calculated, and formatting is done to 
show the text for the stats such as text size, and coordinates. 
*/
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
