class Sword {
  float speed;
  float pos;
  boolean hit;

  Sword() {
    speed = 20;
    pos = 750;
    hit = false;
  }
  
  void shoot() {
    while (pos != 630) {
      ellipse(width/2, pos, 30, 30);
      pos -= speed;
      println("Position: " + pos);
    }
    setHit(true);
  }


  void setHit(boolean b) {
    hit=b;
  }
  
  boolean getHit() {
    return hit;
  }
}


