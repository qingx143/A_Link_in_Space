void modes() {
  background(backgroundColour);
  modesTitle();
  modesSelection();
  modesPreview();
  backButton();
}

//title --------------------------------------------------------------------------------
void modesTitle() {
  fill(titleColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 150);
  textFont(titleFont);
  text("Modes", 400, 100);
}

//selection ----------------------------------------------------------------------------
void modesSelection() {
  //mode 1
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(115, 320, 175, 250);
  modeButtonClick(1);
  rect(115, 320, 175, 250);
  image(bossDisplay[0], 115, 283, 173, 173);
  fill(buttonBaseColour);
  rect(115, 407, 175, 75);
  
  //mode 2
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(305, 320, 175, 250);
  modeButtonClick(2);
  rect(305, 320, 175, 250);
  image(bossDisplay[1], 305, 283, 173, 173);
  fill(buttonBaseColour);
  rect(305, 407, 175, 75);
  
  //mode 3
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(495, 329, 175, 259);
  modeButtonClick(3);
  rect(495, 320, 175, 250);
  image(bossDisplay[2], 495, 283, 173, 173);
  fill(buttonBaseColour);
  rect(495, 407, 175, 75);
  
  //mode 4
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(685, 320, 175, 250);
  modeButtonClick(4);
  rect(685, 320, 175, 250);
  image(bossDisplay[3], 685, 283, 173, 173);
  fill(buttonBaseColour);
  rect(685, 407, 175, 75);
  
  //text
  fill(textColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 25);
  textFont(titleFont);
  text("Divine Beast", 115, 393); //mode 1
  text("Divine Beast", 305, 393); //mode 2
  text("Divine Beast", 495, 393); //mode 3
  text("Divine Beast", 685, 393); //mode 4
  textSize(35);
  text("vah Medoh", 115, 420);
  text("vah Ruta", 305, 420);
  text("vah Rudania", 495, 420);
  text("vah Naboris", 685, 420);
}

//button click colour change -----------------------------------------------------------
void modeButtonClick(int num) {
  if (differentModes == num) {
    strokeWeight(3);
    stroke(#AD8D0C);
    fill(#FAE697);
  }
}

//preview ------------------------------------------------------------------------------
void modesPreview() {
  strokeWeight(3);
  stroke(#AD8D0C);
  fill(#FAE697);
  square(685, 100, 125);
  image(bossDisplay[differentModes-1], 685, 100, 123, 123);
}

//clicks -------------------------------------------------------------------------------
void modesClicks() {
  //back button
  rectButton(70, 50, 90, 50, INTRO);
  
  //selection
  differentModes = rectButtonChange(115, 320, 175, 250, differentModes, 1);
  differentModes = rectButtonChange(305, 320, 175, 250, differentModes, 2);
  differentModes = rectButtonChange(495, 329, 175, 259, differentModes, 3);
  differentModes = rectButtonChange(685, 320, 175, 250, differentModes, 4);
}
