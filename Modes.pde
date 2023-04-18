class Modes {
  int easyHighScore = 0;
  int hardHighScore;
  Board b;
  boolean easy;
  boolean hard;
  boolean restart;
  boolean explosionPlayed = false;

  Modes(String mode) {
    if (mode == "easy") {
      easy = true;
      hard = false;
      b = new Board((int(random(7, 15))), random(0.025, 0.075));
    } 
    else if (mode == "hard") {
      easy = false;
      hard = true;
      b = new Board((int(random(10, 30))), random(0.076, 0.1));
    }
  }

  void runningGame(PImage robot) {
    b.displayBoard(robot);
    println("Robot Speed: " + b.robotSpeed);

    b.placeBomb(); //Goes through array and checks if a bomb has not been placed at the current index.
    if (b.remainingBombs == 0 && easy) {
      robotSound.play();
      b.ResetNextLevel();
    }
    else if (b.remainingBombs == 0 && hard) {
      laserSound.play();
      b.ResetNextLevel();
    }
    else if (b.lose) {
      if (!explosionPlayed) {
        explosionSound.play();
      }
      
      explosionPlayed = true;
      gameEnd = true;
      b.displayEndScreen(endScreen);
      gameStart = false;

      if (restart) {
        modeMenu= true;
        gameModes = false;
        easyMode= false;
        help = false;
        b.ResetAfterLose();
        restart=false;
        explosionPlayed = false;
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
