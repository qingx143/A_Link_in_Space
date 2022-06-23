void game() {
  fill(backgroundColour, 150);
  rect(width/2, height/2, width, height);
  addObjects();
  gameEngine();
  bossModes();
  gameScore(); //includes player lives
  gameDetails(); //bombs && immunity timer && boss pic
  gamePause();
  
  gameTimer++;
  textSize(15);
  text(gameTimer, width/2, 440);
  
  //fill(255);
  //textSize(15);
  //text(frameRate, 20, 20);
  //text(objects.size(), 20, 40);
}

//adding object ------------------------------------------------------------------------
void addObjects() {
  objects.add(0, new Star());
  if (frameCount % 200 == 0)
    objects.add(new Bokoblin());
  if (frameCount % 500 == 0 && (score >= 50 || gameTimer >= 1200))
    objects.add(new Lynel());
  if (frameCount % 1500 == 0 && (score >= 75 || gameTimer >= 3600))
    objects.add(new Guardian());
}

//game engine --------------------------------------------------------------------------
void gameEngine() {
  //show objects
  int i = 0;
  while (i < objects.size()) {
    GameObjects o = objects.get(i);
    o.act();
    o.show();
    if (o.lives == 0) 
      objects.remove(i);
    else
      i++;
  }
  
  player1.act();
  player1.show();
}

//boss modes ---------------------------------------------------------------------------
void bossModes() {
  if (gameTimer >= 10800 && differentModes == 1) {
    windboss.act();
    windboss.show();
  }
  if (gameTimer >= 10800 && differentModes == 2) {
    waterboss.act();
    waterboss.show();
  }
  if (gameTimer >= 10800 && differentModes == 3) {
    fireboss.act();
    fireboss.show();
  }
  if (gameTimer >= 10800 && differentModes == 4) {
    thunderboss.act();
    thunderboss.show();
    thunderMode = true;
  }
  else
    thunderMode = false;
}

//score --------------------------------------------------------------------------------
void gameScore() {
  fill(buttonColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 20);
  textFont(titleFont);
  text("SCORE = " + score, 725, 25);
  
  //player lives
  if (differentCharacters == 1)
    text("LINK: " + (int) hp + "/500 HP", 700, 400);
  if (differentCharacters == 2)
    text("REVALI: " + (int) hp + "/500 HP", 700, 400);
  if (differentCharacters == 3)
    text("MIPHA: " + (int) hp + "/500 HP", 700, 400);
  if (differentCharacters == 4)
    text("DARUK: " + (int) hp + "/500 HP", 700, 400);
  if (differentCharacters == 5)
    text("URBOSA: " + (int) hp + "/500 HP", 700, 400);
  if (differentCharacters == 6)
    text("ZELDA: " + (int) hp + "/500 HP", 700, 400);
  
  //HP visual
  strokeWeight(2);
  stroke(0);
  fill(buttonBaseColour); 
  rect(700, 425, 175, 15, 5);
  hpwidth = map(hp, 0, 500, 0, 175);
  rectMode(CORNER);
  noStroke();
  fill(#FF71BF);
  if (hp < 500) 
    fill(#90ED5B); //green
  if (hp <= 200)
    fill(#FCE37D); //yellow
  if (hp <= 50)
    fill(#DB4040); //red
  rect(612.5, 417.5, hpwidth, 15, 5);
  rectMode(CENTER);
  
  //gameover
  if (hp <= 0)
    mode = GAMEOVER;
}

//small details ------------------------------------------------------------------------
void gameDetails() {
  noStroke();
  fill(buttonBaseColour);
  rect(55, 65, 80, 100);
  image(bombs, 55, 55, 70, 70);
  rect(55, 98, 80, 35);
  
  //text
  fill(textColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 16);
  textFont(titleFont);
  text("BOMBS x" + bombNum, 55, 98);
  
  //immunity timer
  fill(buttonColour);
  textSize(20);
  text("IMMUNITY = " + immunityTime, 700, 380);
  
  //boss pic
  noStroke();
  fill(buttonBaseColour);
  circle(55, 395, 80);
  image(bossDisplay2[differentModes - 1], 55, 395, 80, 80);
}

//pause --------------------------------------------------------------------------------
void gamePause() {
  noStroke();
  fill(buttonBaseColour);
  rect(400, 475, 810, 55);
  
  //text
  fill(buttonColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 50);
  textFont(titleFont);
  text("press 'p' to pause", 400, 475);
  
  if (pkey)
    mode = PAUSE;
}

//clicks -------------------------------------------------------------------------------
void gameClicks() {
}
