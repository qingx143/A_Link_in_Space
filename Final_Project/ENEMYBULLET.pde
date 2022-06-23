class EnemyBullet extends GameObjects {
  EnemyBullet(float x, float y, float vx, float vy, color c) {
    super(x, y, vx, vy, 5, c, 1); 
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
