class Enemy {
  float x, y, speed, size, red, blue;
  Enemy() {
    this.x = random(size, width-size);
    this.y = random(0, -300);
    this.speed = .5;
    size = random(15, 35);
  }
  void createEnemy() {
    fill(255, 0, 0);
    noStroke();
    ellipse(this.x, this.y, size, size);
  }
  void attack() {
    this.y += speed;
  }
  void delete() {
    if (this.y >height) 
      enemies.remove(this);
  }
  void death() {
    for (int i=0; i< bullet.size(); i++) {
      if (dist(bullet.get(i).x, bullet.get(i).y, this.x, this.y) < size/2) {
        enemies.remove(this);
        bullet.remove(i);
        kill++;
      }
    }
  }
  void hit() {
    if (dist(this.x, this.y, xpos, ypos) < 1)
      println("HIT");
  }
}