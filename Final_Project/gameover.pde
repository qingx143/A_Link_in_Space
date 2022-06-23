void gameover() {
  if (!win)
    background(0);
  else
    background(backgroundColour);
  gameoverTitle();
  gameoverOptions();
  totalScore += score;
}

//title --------------------------------------------------------------------------------
void gameoverTitle() {
  titleFont = createFont("The Wild Breath of Zelda.otf", 150);
  textFont(titleFont);
  if (!win) {
    fill(#DB2F14);
    text("Game Over", 400, 160);
  }
  fill(titleColour);
  textSize(100);
  if (win) {
    text("Congratulations!", 400, 120);
    textSize(80);
    text("you have defeated ganon", 400, 200);
  }
}

//options ------------------------------------------------------------------------------
void gameoverOptions() {
  //choices
  strokeWeight(2);
  stroke(50);
  if (!win)
    fill(0);
  fill(buttonBaseColour);
  tactileRect3(400, 300, 320, 45);
  rect(400, 300, 320, 45, 5);
  strokeWeight(2);
  stroke(50);
  tactileRect3(400, 360, 320, 45);
  rect(400, 360, 320, 45, 5);
  
  //text
  fill(220);
  gameoverFont = createFont("Louis George Cafe.ttf", 20);
  textFont(gameoverFont);
  if (!win)
    text("Retry", 400, 300);
  else
    text("Play Again", 400, 300);
  text("Exit", 400, 360);
}

void reset() {
  score = 0;
  hp = 500;
  hpwidth = 0;
  bombNum = 0;
  immunityTime = 0;
  gameTimer = 0;
  for (int i = 0; i < objects.size(); i++) {
    objects.remove(i);
  }
  player1.x = 400;
  player1.y = 400;
  windboss.x = 400;
  windboss.y = -200;
  thunderboss.x = 400;
  thunderboss.y = -200;
  waterboss.x = 400;
  waterboss.y = -200;
  fireboss.x = 400;
  fireboss.y = -200;
}

//clicks -------------------------------------------------------------------------------
void gameoverClicks() {
  rectButton3(400, 300, 320, 45, INTRO);
  rectButton2(400, 360, 320, 45);
}
