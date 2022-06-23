class Bokoblin extends GameObjects {
  int cooldown, threshold;
  float hpWidthEnemy;
  boolean healthPowerup;
  int healthNum;

  Bokoblin() {
    super(random(20, 780), -20, 0, 3, 40, #DB4040, 2);
    threshold = 20;
    cooldown = threshold;
    hpWidthEnemy = 30;
    
    //powerups
    healthNum = (int) random(1, 50);
    if (healthNum <= 25) healthPowerup = true;
  }

  void act() {
    super.act();
    cooldown++;

    //shoot
    if (cooldown >= threshold) {
      objects.add(0, new EnemyBullet(x, y, 0, 10, #FF0000));
      cooldown = 0;
    }

    hpWidthEnemy = map(lives, 0, 2, 0, 30);

    //collisions
    for (int i = 0; i < objects.size(); i++) {
      GameObjects obj = objects.get(i);
      if (obj.lives > 0 && obj instanceof Bullet) {
        if (collidingWith(obj)) {
          score++;
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
          score += 3;
          lives -= 2;
          obj.lives = 0;
        }
      }
    }

    if (lives <= 0) 
      score += 3;
    
    if (lives == 0) {
      //explosion
      for (int i = 0; i < 50; i++) {
        objects.add(new Particles(x, y, #DE2C00, 10, 0.3));
      }
      
      //powerups
      if (healthPowerup)
        objects.add(new HealthPowerups(x, y));
      healthPowerup = false;
    }

    //removes if it goes off
    if (offScreen()) {
      lives = 0;
      score -= 3;
    }
  }

  void show() {
    super.show();
    circle(x, y, size);
    image(boko, x, y, size, size);

    //hp
    strokeWeight(1);
    stroke(0);
    fill(buttonBaseColour);
    rect(x, y - 30, 30, 5);
    rectMode(CORNER);
    fill(#DB4040); //red
    noStroke();
    rect(x - 15, y - 30 - 2.5, hpWidthEnemy, 5);
    rectMode(CENTER);
  }
}
