float xpos, ypos, xvel =0, size=25, y, x;
Bullets b;
shooter s;
int kill =0;
boolean gameMode = false;
ArrayList<PVector> bullet = new ArrayList<PVector>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
void setup() {
  size(640, 480);
  xpos = width/2;
  ypos = height-size/2;
  b = new Bullets();
  s = new shooter();
  for (int i=0; i< 5; i++) 
    enemies.add(new Enemy());
}
void draw() {
  background(0);
  if (!gameMode) {
    fill(0, 255, 0);
    textSize(15);
    textAlign(CENTER);
    text("Click here to play the game. \nPress Space to shoot and left and right keys to move around\n  X to Exit the Game", width/2, height/2);
    if (mousePressed)
      gameMode = true;
  } else {
    s.create();
    s.update();
    for (int i=0; i < bullet.size(); i++) {
      b.createBullets(bullet.get(i));
      b.fire(bullet.get(i));
      if (bullet.get(i).y < 0) 
        bullet.remove(i);
    }
    for (int i=0; i < enemies.size(); i++) {
      enemies.get(i).createEnemy();
      enemies.get(i).attack();
      enemies.get(i).delete();
      enemies.get(i).hit();
      enemies.get(i).death();
    }
    if (frameCount % 100 == 0) 
      enemies.add(new Enemy());
    s.updateScore();
  }
}

void keyPressed() {
  if (keyCode == RIGHT) 
    xvel = 6;
  else if (keyCode == LEFT) 
    xvel = -6;  
  if (keyCode == ' ') 
    bullet.add(new PVector(xpos, ypos-size/2));
  if (key == 'x')
    exit();
}
void keyReleased() {
  xvel =0;
}