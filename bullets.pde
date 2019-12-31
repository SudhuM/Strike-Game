class Bullets {
  int bulletSpeed = 8;
  void createBullets(PVector p) {
    stroke(0, 0, 255);
    strokeWeight(6);
    point(p.x, p.y);
  }
  void fire(PVector p) {
    p.y -= bulletSpeed;
  }
}