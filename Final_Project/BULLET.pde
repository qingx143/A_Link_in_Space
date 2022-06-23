class Bullet extends GameObjects {
  Bullet(float vx, float vy) {
    super(player1.x, player1.y, vx, vy, 5, #FF0000, 1);
  }
  
  void act() {
    super.act();
    if (offScreen()) 
      lives = 0;
  }
  
  void show() {
    super.show();
    square(x, y, size);
  }
}

class BigBullet extends GameObjects {
  BigBullet() {
    super(player1.x, player1.y, 0, -7, 12, #FF0000, 1);
  }
  
  void act() {
    super.act();
    if (offScreen()) 
      lives = 0;
  }
  
  void show() {
    super.show();
    square(x, y, size);
  }
}
