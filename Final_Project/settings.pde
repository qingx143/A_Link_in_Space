void setting() {
  background(backgroundColour);
  settingsTitle();
  settingsButtonBase();
  settingsSelection();
  settingsSliders();
  settingsMute();
  backButton();
  
  main.setGain(volumeMain);
  for (int i = 0; i < soundEffects.length; i++) {
    soundEffects[i].setGain(volumeEffects);
  }
}

//title --------------------------------------------------------------------------------
void settingsTitle() {
  fill(titleColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 150);
  textFont(titleFont);
  text("Settings", 400, 100);
}

//button base --------------------------------------------------------------------------
void settingsButtonBase() {
  noStroke();
  fill(buttonBaseColour);
  rect(400, 300, 600, 250, 10);
}

//selection ----------------------------------------------------------------------------
void settingsSelection() {
  strokeWeight(5);
  stroke(backgroundColour);
  line(120, 300, 680, 300); //separating line
  noStroke();
  fill(buttonColour);
  rect(460, 220, 455, 55, 5); //bgm
  rect(460, 345, 455, 55, 5); //sfx
  
  //text
  fill(titleColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 70);
  textFont(titleFont);
  text("bgm", 170, 230);
  text("sfx", 170, 355);

  gameoverFont = createFont("Louis George Cafe.ttf", 23);
  textFont(gameoverFont);
  text("Adjusts the volume of the music", 280, 275);
  text("Adjusts the volume of the sound effects", 315, 397);
}

//sliders ------------------------------------------------------------------------------
void settingsSliders() {
  strokeWeight(3);
  stroke(textColour);
  line(250, 220, 670, 220);
  line(250, 345, 670, 345);
  
  volumeMain = map(sliderX1, 250, 670, -35, 35);
  volumeEffects = map(sliderX2, 250, 670, -35, 35);
  
  fill(buttonColour);
  stroke(textColour);
  if (dist(sliderX1, 220, mouseX, mouseY) <= 12.5)
    stroke(255);
  circle(sliderX1, 220, 25);
  
  stroke(textColour);
  if (dist(sliderX2, 345, mouseX, mouseY) <= 12.5)
    stroke(255);
  circle(sliderX2, 345, 25);
}

//mute buttons -------------------------------------------------------------------------
void settingsMute() {
  strokeWeight(3);
  stroke(buttonBaseColour);
  noFill();
  if (mouseX >= 650 && mouseX <= 670 && mouseY >= 265 && mouseY <= 285) {
    if (!main.isMuted()) {
      fill(titleColour);
      text("mute", 615, 272);
      fill(buttonColour);
    }
  }
  if (main.isMuted()) {
    fill(titleColour);
    text("muted", 615, 272);
    fill(buttonColour);
  }
  square(660, 275, 20);
  
  noFill();
  if (mouseX >= 650 && mouseX <= 670 && mouseY >= 390 && mouseY <= 410) {
    if (!soundEffects[0].isMuted()) {
      fill(titleColour);
      text("mute", 615, 397);
      fill(buttonColour);
    }
  }
  if (soundEffects[0].isMuted()) {
    fill(titleColour);
    text("muted", 615, 397);
    fill(buttonColour);
  }
  square(660, 400, 20);
}

//clicks -------------------------------------------------------------------------------
void settingsClicks() {
  //back button
  rectButton(70, 50, 90, 50, INTRO);
  
  //mute buttons
  if (mouseX >= 650 && mouseX <= 670 && mouseY >= 265 && mouseY <= 285) { 
    soundEffects[1].rewind();
    soundEffects[1].play();
    if (main.isMuted())
      main.unmute();
    else
      main.mute();
  }
  if (mouseX >= 650 && mouseX <= 670 && mouseY >= 390 && mouseY <= 410) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    if (soundEffects[1].isMuted())
      for (int i = 0; i < soundEffects.length; i++) {
        soundEffects[i].unmute();
      }
    else
      for (int i = 0; i < soundEffects.length; i++) {
        soundEffects[i].mute();
      }
  }
  
  if (mouseX >= 250 && mouseX <= 670 && mouseY >= 220 - 12.5 && mouseY <= 232.5) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    sliderX1 = mouseX;
  }
  if (mouseX >= 250 && mouseX <= 670 && mouseY >= 345 - 12.5 && mouseY <= 357.5) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    sliderX2 = mouseX;
  }
}

//mouse drags --------------------------------------------------------------------------
void settingsClicksDrags() {  
  if (mouseX >= 250 && mouseX <= 670 && mouseY >= 220 - 12.5 && mouseY <= 232.5) 
    sliderX1 = mouseX;
  if (mouseX >= 250 && mouseX <= 670 && mouseY >= 345 - 12.5 && mouseY <= 357.5) 
    sliderX2 = mouseX;
}
