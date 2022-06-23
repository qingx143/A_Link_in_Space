void pause() {
  background(backgroundColour);
  pauseChoices();
  pauseTitle();
}

//pause --------------------------------------------------------------------------------
void pauseTitle() {
  fill(titleColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 150);
  textFont(titleFont);
  text("Paused", 400, 100);
}

//choices ------------------------------------------------------------------------------
void pauseChoices() {
  //back to game
  noStroke();
  fill(buttonBaseColour);
  rect(250, 350, 250, 100);
  fill(buttonBaseColour);
  tactileRect(250, 350, 250, 100);
  rect(250, 350, 250, 100);
  
  //menu
  noStroke();
  fill(buttonBaseColour);
  rect(550, 350, 250, 100);
  fill(buttonBaseColour);
  tactileRect(550, 350, 250, 100);
  rect(550, 350, 250, 100);
  
  fill(textColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 45);
  textFont(titleFont);
  text("back to game", 250, 352);
  text("main menu", 550, 352);
}

//clicks -------------------------------------------------------------------------------
void pauseClicks() {
  rectButton(250, 350, 250, 100, GAME);
  rectButton3(550, 350, 250, 100, INTRO);
}
