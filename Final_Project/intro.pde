void intro() {
  background(backgroundColour);
  introTitle();
  introOptions();
}

//title --------------------------------------------------------------------------------
void introTitle() {
  fill(titleColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 125);
  textFont(titleFont);
  text("A Link in Space", 400, 100);
}

//options ------------------------------------------------------------------------------
void introOptions() {
  noStroke();
  fill(buttonBaseColour);
  rect(400, 325, 600, 250, 10); //base
  
  //top left
  fill(buttonColour);
  tactileRect(260, 270, 250, 80);
  rect(260, 270, 250, 80); //top left
  
  //top right
  noStroke();
  fill(buttonColour);
  tactileRect(535, 270, 250, 80);
  rect(535, 270, 250, 80); //top right
  
  //bottom left
  noStroke();
  fill(buttonColour);
  tactileRect(260, 375, 250, 80);
  rect(260, 375, 250, 80); //bottom left
  
  //bottom right
  noStroke();
  fill(buttonColour);
  tactileRect(535, 375, 250, 80);
  rect(535, 375, 250, 80); //bottom right
  
  //info
  noStroke();
  fill(buttonColour);
  tactileRect(60, 30, 90, 35);
  rect(60, 30, 90, 35);
  
  //text for options
  fill(textColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 50);
  textFont(titleFont);
  text("play", 260, 275);
  text("modes", 535, 275);
  text("characters", 260, 380);
  text("settings", 535, 380);
  textSize(20);
  text("info", 60, 30);
}

//clicks -------------------------------------------------------------------------------
void introClicks() {
  rectButton3(260, 270, 250, 80, GAME);
  rectButton(535, 270, 250, 80, MODES);
  rectButton(260, 375, 250, 80, SELECTION);
  rectButton(535, 375, 250, 80, SETTING);
  rectButton(60, 30, 90, 35, INFO);
}
