class Windblight extends GameObjects {
  int threshold, cooldown;
  float hpWidthEnemy;
  
  Windblight() {
    super(400, -200, 0, 1, 200, #00FF00, 1200);
    threshold = 15;
    cooldown = threshold;
    hpWidthEnemy = 500;
  }
  
  void act() {
    super.act();
    if (y >= 80)
      vy = 0;
      
    //bullets
    cooldown++;
    if (cooldown >= threshold) {
      for (int i = 0; i < 10; i++) {
        objects.add(new EnemyBullet(x, y, random(-30, 30), 10, #88C2E0));
      }
      cooldown = 0;
    }
      
    //collisions
    for (int i = 0; i < objects.size(); i++) {
      GameObjects obj = objects.get(i);
      if (obj.lives > 0 && obj instanceof Bullet) {
        if (collidingWith(obj)) {
          score += 10;
          lives -= 5;
          obj.lives = 0;
        }
      }
      if (obj instanceof BulletExplosion) {
        if (collidingWith(obj)) {
          lives -= 10; 
          obj.lives = 0;
        }
      }
    }
    
    hpWidthEnemy = map(lives, 0, 1200, 0, 500);
    
    //death
    if (lives <= 0) {
      win = true;
      mode = GAMEOVER;
    }
  }
  
  void show() {
    super.show();
    image(ganons[differentModes - 1], x, y, size, size);
      
    strokeWeight(3);
    stroke(0);
    fill(buttonBaseColour);
    rect(400, 40, 500, 60, 30);
    
    noStroke();
    rectMode(CORNER);
    fill(#90F54A); //green
    if (lives <= 200)
      fill(#FCE37D); //yellow
    if (lives <= 50)
      fill(#DB4040); //red
    rect(150, 10, hpWidthEnemy, 60, 30);
    rectMode(CENTER);
    
    fill(textColour);
    titleFont = createFont("The Wild Breath of Zelda.otf", 30);
    textFont(titleFont);
    text("WINDBLIGHT GANON: " + (int) lives + "/1200 HP", 400, 40);
  }
}

//water -------------------------------------------------------------------------------------------------------------------------------------------------------------------
class Waterblight extends GameObjects {
  int threshold, cooldown;
  float hpWidthEnemy;
  
  Waterblight() {
    super(400, -200, 0, 1, 200, #00FF00, 1200);
    threshold = 7;
    cooldown = threshold;
    hpWidthEnemy = 500;
  }
  
  void act() {
    super.act();
    if (y >= 80)
      vy = 0;
      
    //bullets
    cooldown++;
    if (cooldown >= threshold) {
      objects.add(0, new EnemyBullet(x, y, -20, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, -18, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, -16, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, -14, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, -12, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, -10, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, -8, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, -6, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, -4, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, -2, 10, #B9F0FF)); //down
      
      objects.add(0, new EnemyBullet(x, y, 0, 10, #B9F0FF)); //down
      
      objects.add(0, new EnemyBullet(x, y, 2, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, 4, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, 6, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, 8, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, 10, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, 12, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, 14, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, 16, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, 18, 10, #B9F0FF)); //down
      objects.add(0, new EnemyBullet(x, y, 20, 10, #B9F0FF)); //down
      cooldown = 0;
    }
    
    //collisions
    for (int i = 0; i < objects.size(); i++) {
      GameObjects obj = objects.get(i);
      if (obj.lives > 0 && obj instanceof Bullet) {
        if (collidingWith(obj)) {
          score += 10;
          lives -= 5;
          obj.lives = 0;
        }
      }
      if (obj instanceof BulletExplosion) {
        if (collidingWith(obj)) {
          lives -= 10; 
          obj.lives = 0;
        }
      }
    }
    
    hpWidthEnemy = map(lives, 0, 1200, 0, 500);
    
    //death
    if (lives <= 0) {
      win = true;
      mode = GAMEOVER;
    }
  }
  
  void show() {
    super.show();
    image(ganons[differentModes - 1], x, y, size, size);
      
    strokeWeight(3);
    stroke(0);
    fill(buttonBaseColour);
    rect(400, 40, 500, 60, 30);
    
    noStroke();
    rectMode(CORNER);
    fill(#90F54A); //green
    if (lives <= 200)
      fill(#FCE37D); //yellow
    if (lives <= 50)
      fill(#DB4040); //red
    rect(150, 10, hpWidthEnemy, 60, 30);
    rectMode(CENTER);
    
    fill(textColour);
    titleFont = createFont("The Wild Breath of Zelda.otf", 30);
    textFont(titleFont);
    text("WATERBLIGHT GANON: " + (int) lives + "/1200 HP", 400, 40);
  }
}

//fire --------------------------------------------------------------------------------------------------------------------------------------------------------------------
class Fire extends GameObjects {
  float dieSp;
  
  Fire(float x, float y) {
    super(x, y, random(-5, 5), random(-5, 5), random(1, 15), #FF0000, 1);
    dieSp = 0.5;
  }
  
  void act() {
    super.act();
    size -= dieSp;
  }
  
  void show() {
    super.show();
    circle(x, y, size);
    if (size <= 0)
      lives = 0;
    if (collidingWith(player1))
      lives = 0;
  }
}

class Fireblight extends GameObjects {
  int threshold, cooldown;
  int hold, cool;
  float hpWidthEnemy;
  int randomNumx, randomNumy, randomNumx1, randomNumy1, randomNumx2, randomNumy2, randomNumx3, randomNumy3, randomNumx4, randomNumy4;
  
  Fireblight() {
    super(400, -200, 0, 1, 200, #00FF00, 1200);
    threshold = 10;
    cooldown = threshold;
    hold = 1200;
    cool = hold;
    hpWidthEnemy = 500;
    randomNumx = (int) random(50, 350);
    randomNumy = (int) random(50, 250);
    randomNumx1 = (int) random(450, 750);
    randomNumy1 = (int) random(50, 250);
    randomNumx2 = (int) random(50, 750);
    randomNumy2 = (int) random(250, 450);
    randomNumx3 = (int) random(450, 750);
    randomNumy3 = (int) random(250, 450);
    randomNumx4 = (int) random(250, 550);
    randomNumy4 = (int) random(50, 450);
  }
  
  void act() {
    super.act();
    if (y >= 80)
      vy = 0;
      
    //bullets
    cooldown++;
    if (cooldown >= threshold) {
      objects.add(new EnemyBullet(x, y, 0, 10, #F0552E));
      objects.add(new EnemyBullet(x, y, -10, 10, #F0552E));
      objects.add(new EnemyBullet(x, y, 10, 10, #F0552E));
      cooldown = 0;
    }
    
    cool++;
    if (cool >= hold) {
      for (int i = 0; i < 10; i++) {
        objects.add(new Fire(randomNumx, randomNumy));
      }
      hold = 0;
    }
    if (cool >= hold) {
      for (int i = 0; i < 10; i++) {
        objects.add(new Fire(randomNumx1, randomNumy1));
      }
      hold = 0;
    }
    if (cool >= hold) {
      for (int i = 0; i < 10; i++) {
        objects.add(new Fire(randomNumx2, randomNumy2));
      }
      hold = 0;
    }
    if (cool >= hold) {
      for (int i = 0; i < 10; i++) {
        objects.add(new Fire(randomNumx3, randomNumy3));
      }
      hold = 0;
    }
    if (cool >= hold) {
      for (int i = 0; i < 10; i++) {
        objects.add(new Fire(randomNumx4, randomNumy4));
      }
      hold = 0;
    }
    
    //collisions
    for (int i = 0; i < objects.size(); i++) {
      GameObjects obj = objects.get(i);
      if (obj.lives > 0 && obj instanceof Bullet) {
        if (collidingWith(obj)) {
          score += 10;
          lives -= 5;
          obj.lives = 0;
        }
      }
      if (obj instanceof BulletExplosion) {
        if (collidingWith(obj)) {
          lives -= 10; 
          obj.lives = 0;
        }
      }
    }
    
    hpWidthEnemy = map(lives, 0, 1200, 0, 500);
    
    //death
    if (lives <= 0) {
      win = true;
      mode = GAMEOVER;
    }
  }
  
  void show() {
    super.show();
    image(ganons[differentModes - 1], x, y, size, size);
      
    strokeWeight(3);
    stroke(0);
    fill(buttonBaseColour);
    rect(400, 40, 500, 60, 30);
    
    noStroke();
    rectMode(CORNER);
    fill(#90F54A); //green
    if (lives <= 200)
      fill(#FCE37D); //yellow
    if (lives <= 50)
      fill(#DB4040); //red
    rect(150, 10, hpWidthEnemy, 60, 30);
    rectMode(CENTER);
    
    fill(textColour);
    titleFont = createFont("The Wild Breath of Zelda.otf", 30);
    textFont(titleFont);
    text("FIREBLIGHT GANON: " + (int) lives + "/1200 HP", 400, 40);
  }
}

//thunder -----------------------------------------------------------------------------------------------------------------------------------------------------------------
class Thunderblight extends GameObjects {
  int threshold, cooldown;
  float hpWidthEnemy;
  
  Thunderblight() {
    super(400, -200, 0, 1, 200, #00FF00, 1200);
    threshold = 15;
    cooldown = threshold;
    hpWidthEnemy = 500;
  }
  
  void act() {
    super.act();
    if (y >= 80)
      vy = 0;
      
  //bullets
    cooldown++;
    if (cooldown >= threshold) {
      objects.add(new EnemyBullet(x, y, 0, 10, #FFD746));
      objects.add(new EnemyBullet(x, y, -10, 10, #FFD746));
      objects.add(new EnemyBullet(x, y, 10, 10, #FFD746));
      objects.add(new EnemyBullet(x, y, -5, 10, #FFD746));
      objects.add(new EnemyBullet(x, y, 5, 10, #FFD746));
      objects.add(new EnemyBullet(x, y, -15, 10, #FFD746));
      objects.add(new EnemyBullet(x, y, 15, 10, #FFD746));
      cooldown = 0;
    }
      
    //collisions
    for (int i = 0; i < objects.size(); i++) {
      GameObjects obj = objects.get(i);
      if (obj.lives > 0 && obj instanceof Bullet) {
        if (collidingWith(obj)) {
          score += 10;
          lives -= 5;
          obj.lives = 0;
        }
      }
      if (obj instanceof BulletExplosion) {
        if (collidingWith(obj)) {
          lives -= 10; 
          obj.lives = 0;
        }
      }
    }
    
    hpWidthEnemy = map(lives, 0, 1200, 0, 500);
    
    //death
    if (lives <= 0) {
      win = true;
      mode = GAMEOVER;
    }
  }
  
  void show() {
    super.show();
    image(ganons[differentModes - 1], x, y, size, size);
      
    strokeWeight(3);
    stroke(0);
    fill(buttonBaseColour);
    rect(400, 40, 500, 60, 30);
    
    noStroke();
    rectMode(CORNER);
    fill(#90F54A); //green
    if (lives <= 200)
      fill(#FCE37D); //yellow
    if (lives <= 50)
      fill(#DB4040); //red
    rect(150, 10, hpWidthEnemy, 60, 30);
    rectMode(CENTER);
    
    fill(textColour);
    titleFont = createFont("The Wild Breath of Zelda.otf", 30);
    textFont(titleFont);
    text("THUNDERBLIGHT GANON: " + (int) lives + "/1200 HP", 400, 40);
  }
}
