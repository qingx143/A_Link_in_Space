class Starfighter extends GameObjects { 
  int cooldown, threshold, timer;
  int cooldown2, threshold2;
  boolean immunity, explosion;
  
  Starfighter() {
    super(400, 400, 0, 0, 60, 255, 500);
    threshold = 12;
    cooldown = threshold;
    timer = 1200;
    immunity = false;
    explosion = false;
    threshold2 = 5;
    cooldown2 = threshold2;
  }
  
  void act() {
    super.act();
    //managing guns
    cooldown++;
    
    //powerups
    for (int i = 0; i < objects.size(); i++) {
      GameObjects obj = objects.get(i);
      if (obj instanceof BombPowerups) {
        if (collidingWith(obj)) 
          bombNum += 5;
      }
      if (obj instanceof HealthPowerups) {
        if (collidingWith(obj)) {
          lives += 50;
          hp += 50;
        }
      }
      if (obj instanceof ImmunityPowerups) {
        if (collidingWith(obj)) {
          immunity = true;
        }
      }
    }
    
    //bombs
    if (akey && bombNum > 0) {
      for (int j = 0; j < 50; j++) {
        objects.add(new BulletExplosion(x, y, #FF0000));
      }
      explosion = true;
    }
    if (explosion) {
      bombNum--;
      explosion = false;
    }
    
    //immunity
    if (immunity)
      timer--;
    if (timer <= 0) {
      immunity = false;
      timer = 1200;
    }
    immunityTime = timer/60;
    if (!immunity)
      immunityTime = 0;
    
    //collisions
    for (int i = 0; i < objects.size(); i++) {
      GameObjects obj = objects.get(i);
      if (obj instanceof EnemyBullet) {
        if (collidingWith(obj) && !immunity) {
          hp -= 5;
          lives -= 5;
          obj.lives = 0;
        }
      }
      if (obj instanceof Fire) { 
        if (collidingWith(obj)) {
          hp -= 5;
          lives -= 5;
        }
      }
    }
    
    //controlling the Starfighter
    if (thunderMode) {
      if (upkey) vy = 2;
      if (downkey) vy = -4;
      if (leftkey) vx = 4;
      if (rightkey) vx = -4;
    }
    else {
      if (upkey) vy = -2;
      if (downkey) vy = 4;
      if (leftkey) vx = -4;
      if (rightkey) vx = 4;
    }
    
    if (space && cooldown >= threshold) {
      if (differentModes == 1 && gameTimer >= 10800)
        objects.add(0, new Bullet(random(-15, 15), -10));
      if (differentCharacters == 3) {
        objects.add(0, new Bullet(0, -10));
        objects.add(0, new Bullet(5, -10));
        objects.add(0, new Bullet(-5, -10));
      }
      if (differentCharacters == 4)
        objects.add(0, new BigBullet());
      if (differentCharacters == 1 || differentCharacters == 2)
        objects.add(0, new Bullet(0, -10));
      if (differentCharacters == 6) {
        objects.add(0, new Bullet(0, 10)); //down
        objects.add(0, new Bullet(0, -10)); //up
        objects.add(0, new Bullet(-10, 1)); //left
        objects.add(0, new Bullet(10, 1)); //right
        
        objects.add(0, new Bullet(10, 10)); //SE
        objects.add(0, new Bullet(-10, 10)); //SW
        objects.add(0, new Bullet(-10, -10)); //NW
        objects.add(0, new Bullet(10, -10)); //NE
      }
      cooldown = 0;
    }
    
    cooldown2++;
    if (space && cooldown2 >= threshold2 && differentCharacters == 5) {
      objects.add(0, new Bullet(0, -10));
      cooldown2 = 0;
    }
    
    if (!upkey && !downkey) vy *= 0.9;
    if (!leftkey && !rightkey) vx *= 0.9;
    
    //borders for Starfighter
    y = min(y, 500 - size/2); //bottom
    y = max(y, size/2); //top
    
    if (differentCharacters == 2) {
      if (x >= width)
        x = 0;
      if (x <= -size/2)
        x = width + size/2;
    }
    else {
      x = min(x, 800 - size/2); //right
      x = max(x, size/2); //left
    }
  }
  
  void show() {
    super.show();
    image(showPlayer[differentCharacters - 1], x, y, size, size);
  }
}
