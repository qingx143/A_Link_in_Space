abstract class GameObjects {
  float x, y, vx, vy, size;
  color c;
  int lives;
  
  GameObjects(float x, float y, float vx, float vy, float size, color c, int lives) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.size = size;
    this.c = c;
    this.lives = lives;
  }
  
  boolean collidingWith(GameObjects obj) {
    return (dist(obj.x, obj.y, x, y) < obj.size/2 + size/2);
  }
  
  boolean offScreen() {
    return (x < 0 || x > width || y < -50 || y > height + 200);
  }
  
  void act() {
    x += vx;
    y += vy;
  }
  
  void show() {
    noStroke();
    fill(c);
  }
}
