class Modes {
  int highScore = 0;
  Board b;
  boolean easy;
  boolean hard;
  boolean restart;
  Modes(String mode) {
    if (mode == "easy") {
      easy = true;
      hard = false;
      b = new Board((int(random(7, 15))), random(0.025, 0.075));
    } 
    else if (mode == "hard") {
      easy = false;
      hard = true;
      b = new Board((int(random(20, 30))), random(0.076, 0.1));
    }
  }

  void runningGame(PImage robot, PImage loseBackground) {
    b.displayBoard(robot);
    println("Robot Speed: " + b.robotSpeed);

    b.placeBomb(); //Goes through array and checks if a bomb has not been placed at the current index.
    if (b.remainingBombs == 0) {
      robotSound.play();
      b.ResetNextLevel();
    } 
    else if (b.lose) {
     // background(loseBackground);
      endingScreen=true;
      b.EndScreen(endScreen);
      gameStart = false;
      if(restart==true){
         modeMenu=true;
        gameModes=false;
        easyMode=false;
      b.ResetAfterLose();
      restart=false;
      }
    }
  }

  void clickCountCheck() {
    if (clickCount < b.bombs.length) {
      b.clicked(clickCount, hitsound);
      b.collisionCheck();
      clickCount++;
    }
  }
}
