class Bomb {
  float shootSpeed;
  float pos;
  boolean hit;
  float circleAngle = PI/4;
  float circleSpeed;
  float x = 0;
  float y = 200;

  Bomb(float tempCircleSpeed) {
    shootSpeed = 20;
    pos = 350;
    hit = false;
    circleSpeed = (tempCircleSpeed)/2.0; //somehow worked lol
  }

  void shoot() { //Might also need shoot sound effect
    while (pos >= 200) {
      strokeWeight(3);
      stroke(255, 187, 51); //Outline of bomb
      //fill(0, 255, 255); //Bomb color
      fill(0);
      ellipse(0, pos, 30, 30);
      pos -= shootSpeed;
    }
    setHit(true);
  }

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
    
    //println(clickCount + ": Global X: " + x + ", Global Y: " + y);
  
    ellipse(x, y, 30, 30);
    circleAngle += circleSpeed;
  }

  void setHit(boolean b) {
    hit=b;
  }

  boolean getHit() {
    return hit;
  }
}
