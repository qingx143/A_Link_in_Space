class Guardian extends GameObjects {
  int cooldown, threshold;
  float hpWidthEnemy;
  boolean healthPowerup, immunityPowerup, bombPowerup;
  int powerupNum;
  
  Guardian() {
    super(random(50, 750), -20, 0, 1, 100, #DB4040, 15);
    threshold = 7;
    cooldown = threshold;
    hpWidthEnemy = 30;
    
    //powerups
    powerupNum = (int) random(1, 50);
    if (powerupNum <= 15) immunityPowerup = true;
    else if (powerupNum <= 35) bombPowerup = true;
    else healthPowerup = true;
  }
  
  void act() {
    super.act();
    cooldown++;
    
    //shoot
    if (cooldown >= threshold) {
      objects.add(0, new EnemyBullet(x, y, 0, 10, #FF0000)); //down
      objects.add(0, new EnemyBullet(x, y, 0, -10, #FF0000)); //up
      objects.add(0, new EnemyBullet(x, y, -10, 1, #FF0000)); //left
      objects.add(0, new EnemyBullet(x, y, 10, 1, #FF0000)); //right
      
      objects.add(0, new EnemyBullet(x, y, 10, 10, #FF0000)); //SE
      objects.add(0, new EnemyBullet(x, y, -10, 10, #FF0000)); //SW
      objects.add(0, new EnemyBullet(x, y, -10, -10, #FF0000)); //NW
      objects.add(0, new EnemyBullet(x, y, 10, -10, #FF0000)); //NE
      cooldown = 0;
    }
    
    hpWidthEnemy = map(lives, 0, 15, 0, 30);
    
    //collisions
    for (int i = 0; i < objects.size(); i++) {
      GameObjects obj = objects.get(i);
      if (obj.lives > 0 && obj instanceof Bullet) {
        if (collidingWith(obj)) {
          score += 5;
          lives--;
          obj.lives = 0;
        }
      }
      if (obj instanceof BulletExplosion) {
        if (collidingWith(obj))
          lives = 0;
      }
      if (obj instanceof BigBullet) {
        if (collidingWith(obj)) {
          score += 5;
          lives -= 5;
          obj.lives = 0;
        }
      }
    }
    
    if (lives <= 0) {
      score += 30;
      
      //powerups
      if (bombPowerup)
        objects.add(new BombPowerups(x, y));
      bombPowerup = false;
      
      if (immunityPowerup)
        objects.add(new ImmunityPowerups(x, y));
      immunityPowerup = false;
      
      if (healthPowerup)
        objects.add(new HealthPowerups(x, y));
      healthPowerup = false;
    }
    
    if (lives == 0) {
      //explosion
      for (int i = 0; i < 70; i++) {
        objects.add(new Particles(x, y, #DE004E, 25, 1));
      }
    }
    
    //removes if it goes off
    if (offScreen()) {
      lives = 0;
      score -= 30;
    }
  }
  
  void show() {
    super.show();
    circle(x, y, size);
    image(guardians, x, y, size, size);
    
    //hp
    strokeWeight(1);
    stroke(0);
    fill(buttonBaseColour);
    rect(x, y - 60, 30, 5);
    rectMode(CORNER);
    fill(#DB4040); //red
    noStroke();
    rect(x - 15, y - 60 - 2.5, hpWidthEnemy, 5);
    rectMode(CENTER);
  }
}
