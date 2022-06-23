class BombPowerups extends GameObjects {
  BombPowerups(float x, float y) {
    super(x, y, 0, 0, 10, #0000FF, 1);
  }
  
  void act() {
    super.act();
    if (collidingWith(player1))
      lives = 0;
  }
  
  void show() {
    super.show();
    circle(x, y, size);
  }
}

class BulletExplosion extends GameObjects {
  BulletExplosion(float x, float y, color c) {
    super(x, y, random(-5, 5), random(-5, 5), 10, c, 1);
  }
  
  void act() {
    super.act();
  }
  
  void show() {
    super.show();
    circle(x, y, size);
    if (offScreen())
      lives = 0;
  }
}

//health powerups ----------------------------------------------------------------------
class HealthPowerups extends GameObjects {
  HealthPowerups(float x, float y) {
    super(x, y, 0, 0, 10, #FF0000, 1);
  }
  
  void act() {
    super.act();
    if (collidingWith(player1))
      lives = 0;
  }
  
  void show() {
    super.show();
    circle(x, y, size);
  }
}

//immunity powerups --------------------------------------------------------------------
class ImmunityPowerups extends GameObjects {
  ImmunityPowerups(float x, float y) {
    super(x, y, 0, 0, 10, #00FF00, 1);
  }
  
  void act() {
    super.act();
    if (collidingWith(player1))
      lives = 0;
  }
  
  void show() {
    super.show();
    circle(x, y, size);
  }
}
