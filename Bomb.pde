class Bomb {
  float shootSpeed;
  float pos;
  boolean hit;
  float circleAngle = PI/4;
  float circleSpeed;
  float x = 0;
  float y = 200;

//Constructor takes in rotation speed as a parameter, then defines speed and position of bomb.
  Bomb(float tempCircleSpeed) {
    shootSpeed = 20;
    pos = 350;
    hit = false;
    circleSpeed = (tempCircleSpeed)/2.0;
  }

/*
This function is used to display the shooting of the bomb from the bottom of
the screen to the rotating bomb. Once the bomb hits the robot, the bomb's "hit"
parameter is set to true.
*/
  void shoot() {
    while (pos >= 200) {
      strokeWeight(3);
      stroke(255, 187, 51); //Outline of bomb
      fill(158, 9, 146);
      ellipse(0, pos, 30, 30);
      pos -= shootSpeed;
    }
    setHit(true);
  }

/*
This function rotates the bombs with the board by rotating coordinates to 
coordinates with respect to the entire screen. A rotation matrix implementation was
used: https://en.wikipedia.org/wiki/Rotation_matrix
*/
  void rotateBomb() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(circleAngle);
    popMatrix();

    float tempX = 200 * cos(circleAngle);
    float tempY = 200 * sin(circleAngle);

    //Rotate coordinates to coordinates with respect to entire screen
    x = tempX * cos(circleAngle) - tempY * sin(circleAngle);
    y = tempX * sin(circleAngle) + tempY * cos(circleAngle);
    
    ellipse(x, y, 30, 30);
    circleAngle += circleSpeed;
  }

//Hit setter function.
  void setHit(boolean b) {
    hit=b;
  }

//Hit getter function.
  boolean getHit() {
    return hit;
  }
}
