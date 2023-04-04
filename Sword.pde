class Sword {
  float speed;
  float pos;
  boolean hit;
  float circleAngle = 0;
  float circleSpeed = 0.1;

  Sword() {
    speed = 20;
    pos = 350;
    hit = false;
  }

  void shoot() {
    while (pos >= 200) {
      noStroke();
      fill(255);
      ellipse(0, pos, 30, 30);
      pos -= speed;
    }
    setHit(true);
  }


  void setHit(boolean b) {
    hit=b;
  }

  boolean getHit() {
    return hit;
  }

  void rotateSword() {
    pushMatrix();
    rotate(circleAngle);
    circleAngle += circleSpeed;
    ellipse(0, 200, 30, 30);
    popMatrix();
  }
}
