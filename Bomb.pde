class Bomb {
  float shootSpeed;
  float pos;
  boolean hit;
  float circleAngle = PI/4;
  float circleSpeed;
  float x = 0;
  float y = 200;

/*Constructor takes in rotation speed as a parameter*/
  Bomb(float tempCircleSpeed) {
    shootSpeed = 20;
    pos = 350;
    hit = false;
    circleSpeed = (tempCircleSpeed)/2.0; 
  }
/*Draws and Controls movement of each bomb from when it is first shor until 
it reaches the board and sets the corresponding booleans*/
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
/*Rotates the bombs with the board by Rotating coordinates to coordinates with respect to the entire screen*/
  void rotateBomb() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(circleAngle);
    popMatrix();
  //200 is the robot radius
    float tempX = 200 * cos(circleAngle);
    float tempY = 200 * sin(circleAngle);

    //Rotate coordinates to coordinates with respect to entire screen
    x = tempX * cos(circleAngle) - tempY * sin(circleAngle);
    y = tempX * sin(circleAngle) + tempY * cos(circleAngle);
    
    //println(clickCount + ": Global X: " + x + ", Global Y: " + y);
  
    ellipse(x, y, 30, 30);
    circleAngle += circleSpeed;
  }
/*Setter and getter for the hit boolean of each bomb*/
  void setHit(boolean b) {
    hit=b;
  }

  boolean getHit() {
    return hit;
  }
}
