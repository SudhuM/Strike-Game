class shooter {

  void create() {
    fill(255);
    noStroke();
    ellipse(xpos, ypos, 15, size);
  } 

  void update() {
    if ((xpos - size) > width) {
      xpos = width-(size/2);
    }
    if ((xpos + size) < 0) {
      xpos = xpos + (size/2);
    }
    xpos +=xvel;
  }

  void updateScore() {
    fill(255, 225, 0);
    textSize(15);
    text("Kill: " + kill, 20, 20);
  }
}