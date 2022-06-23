class Lynel extends GameObjects {
  int cooldown, threshold;
  float hpWidthEnemy;
  boolean healthPowerup, immunityPowerup, bombPowerup;
  int powerupNum;
  
  Lynel() {
    super(random(30, 770), -20, 0, 2, 60, #DB4040, 5);
    threshold = 20;
    cooldown = threshold;
    hpWidthEnemy = 30;
    
    //powerups
    powerupNum = (int) random(1, 50);
    if (powerupNum <= 10) immunityPowerup = true;
    else if (powerupNum <= 25) bombPowerup = true;
    else if (powerupNum <= 35) healthPowerup = true;
  }
  
  void act() {
    super.act();
    cooldown++;
    
    //shoot
    if (cooldown >= threshold) {
      objects.add(0, new EnemyBullet(x, y, 0, 10, #FF0000));
      objects.add(0, new EnemyBullet(x + 10, y, 0, 10, #FF0000));
      objects.add(0, new EnemyBullet(x - 10, y, 0, 10, #FF0000));
      cooldown = 0;
    }
    
    hpWidthEnemy = map(lives, 0, 5, 0, 30);
    
    //collisions
    for (int i = 0; i < objects.size(); i++) {
      GameObjects obj = objects.get(i);
      if (obj.lives > 0 && obj instanceof Bullet) {
        if (collidingWith(obj)) {
          score += 2;
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
          score += 4;
          lives -= 3;
          obj.lives = 0;
        }
      }
    }
    
    if (lives <= 0) {
      score += 7;
      
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
      for (int i = 0; i < 50; i++) {
        objects.add(new Particles(x, y, #83380C, 15, 0.7));
      }
    }
    
    //removes if it goes off
    if (offScreen()) {
      lives = 0;
      score -= 7;
    }
  }
  
  void show() {
    super.show();
    circle(x, y, size);
    image(lynels, x, y, size, size);
    
    //hp
    strokeWeight(1);
    stroke(0);
    fill(buttonBaseColour);
    rect(x, y - 40, 30, 5);
    rectMode(CORNER);
    fill(#DB4040); //red
    noStroke();
    rect(x - 15, y - 40 - 2.5, hpWidthEnemy, 5);
    rectMode(CENTER);
  }
}
