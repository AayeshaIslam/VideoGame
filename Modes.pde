class Modes {
  int easyHighScore = 0;
  int hardHighScore;
  Board b;
  boolean easy;
  boolean hard;
  boolean restart;
  boolean explosionPlayed = false;

/*
Constructor takes in the mode as a parameter. 
Based on that, it sets the easy or hard booleans for the board and makes a new board 
object with a randomized number of bombs and robot speed, if the mode is hard, 
the number of bombs and robot speed is significantly higher.
*/
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

/*
This function is called when the game starts. It displays the board along 
with rotation, places the bombs that have been shot, checks whether the game 
is in a win or lose state, and continues or restarts the game based on those booleans.
*/
  void runningGame(PImage robot) {
    b.displayBoard(robot);

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
      if (easy)
        b.displayEndScreen(easyEndScreen);
      else if (hard)
        b.displayEndScreen(hardEndScreen);
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

/*
Increments clickcount while there are bombs left, 
checks for collisions, and calls clicked which has shooting 
and user interaction functionality. */
  void clickCountCheck() {
    if (clickCount < b.bombs.length) {
      b.clicked(clickCount);
      b.collisionCheck();
      clickCount++;
    }
  }
}
