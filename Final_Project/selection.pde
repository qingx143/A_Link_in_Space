void selection() {
  background(backgroundColour);
  selectionTitle();
  selectionChoices();
  selectionTotal();
  backButton();
}

//title --------------------------------------------------------------------------------
void selectionTitle() {
  fill(titleColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 150);
  textFont(titleFont);
  text("Selection", 400, 100);
}

//choices ------------------------------------------------------------------------------
void selectionChoices() {
  //selected
  strokeWeight(3);
  stroke(#AD8D0C);
  fill(#FAE697);
  rect(400, 225, 335, 140); 
  //base for selected
  noStroke();
  fill(#AD8D0C);
  square(302, 225, 140);
  
  //selected character if statements
  if (differentCharacters == 1)
    image(players[0], 301, 225, 130, 130);
    
  if (differentCharacters == 2) 
    image(players[1], 301, 225, 130, 130);
    
  if (differentCharacters == 3)
    image(players[2], 301, 225, 130, 130);
    
  if (differentCharacters == 4)
    image(players[3], 301, 225, 130, 130);
    
  if (differentCharacters == 5)
    image(players[4], 301, 225, 130, 130);
    
  if (differentCharacters == 6)
    image(players[5], 301, 225, 130, 130);
  
  //text
  fill(textColour);
  strokeWeight(3);
  stroke(textColour);
  line(387, 202, 550, 202);
  titleFont = createFont("The Wild Breath of Zelda.otf", 50);
  textFont(titleFont);
  if (differentCharacters == 1) {
    text("Link", 467, 190);
    textSize(35);
    text("hylian", 467, 235);
    text("champion", 467, 265);
  }
  
  if (differentCharacters == 2) {
    text("Revali", 467, 190);
    textSize(35);
    text("rito", 467, 235);
    text("champion", 467, 265);
  }
  
  if (differentCharacters == 3) {
    text("Mipha", 467, 190);
    textSize(35);
    text("zora", 467, 235);
    text("champion", 467, 265);
  }
  
  if (differentCharacters == 4) {
    text("Daruk", 467, 190);
    textSize(35);
    text("goron", 467, 235);
    text("champion", 467, 265);
  }
  
  if (differentCharacters == 5) {
    text("Urbosa", 467, 190);
    textSize(35);
    text("gerudo", 467, 235);
    text("champion", 467, 265);
  }
  
  if (differentCharacters == 6) {
    text("Zelda", 467, 190);
    textSize(35);
    text("hylian", 467, 235);
    text("princess", 467, 265);
  }
  
  //choices images
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(100, 400, 110, 110);
  selectionButtonClick(1);
  square(100, 400, 110);
  image(players[0], 101, 401, 107, 107);
  
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(220, 400, 110, 110);
  selectionButtonClick(2);
  square(220, 400, 110);
  image(players[1], 221, 401, 107, 107);
  if (totalScore < 50) {
    fill(0, 0, 0, 200);
    square(220, 400, 110);
    selectionUnlock(220, 50);
  }
  
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(340, 400, 110, 110);
  selectionButtonClick(3);
  square(340, 400, 110);
  image(players[2], 341, 401, 107, 107);
  if (totalScore < 120) {
    fill(0, 0, 0, 200);
    square(340, 400, 110);  
    selectionUnlock(340, 120);
  }
  
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(460, 400, 110, 110);
  selectionButtonClick(4);
  square(460, 400, 110);
  image(players[3], 461, 401, 107, 107);
  if (totalScore < 200) {
    fill(0, 0, 0, 200);
    square(460, 400, 110);
    selectionUnlock(460, 200);
  }
  
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(580, 400, 110, 110);
  selectionButtonClick(5);
  square(580, 400, 110);
  image(players[4], 581, 401, 107, 107);
  if (totalScore < 300) {
    fill(0, 0, 0, 200);
    square(580, 400, 110);
    selectionUnlock(580, 300);
  }
  
  noStroke();
  fill(buttonBaseColour);
  tactileRect2(700, 400, 110, 110);
  selectionButtonClick(6);
  square(700, 400, 110);
  image(players[5], 701, 401, 107, 107);
  if (totalScore < 500) {
    fill(0, 0, 0, 200);
    square(700, 400, 110);
    selectionUnlock(700, 500);
  }
}

//unlocking text -----------------------------------------------------------------------
void selectionUnlock(int x, int num) {
  fill(titleColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 18);
  textFont(titleFont);
  text("unlocks when", x, 397);
  textSize(15);
  text("total score = " + num, x, 410);
}

//button click colour change -----------------------------------------------------------
void selectionButtonClick(int num) {
  if (differentCharacters == num) {
    strokeWeight(3);
    stroke(#AD8D0C);
    fill(#FAE697);
  }
}

//total score number display -----------------------------------------------------------
void selectionTotal() {
  fill(titleColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 25);
  textFont(titleFont);
  text("total score = " + totalScore, 650, 25);
}

//clicks -------------------------------------------------------------------------------
void selectionClicks() {
  //back button
  rectButton(70, 50, 90, 50, INTRO);
  
  //characters
  differentCharacters = rectButtonChange(100, 400, 110, 110, differentCharacters, 1);
  if (totalScore >= 50)
    differentCharacters = rectButtonChange(220, 400, 110, 110, differentCharacters, 2);
  if (totalScore >= 120)
    differentCharacters = rectButtonChange(340, 400, 110, 110, differentCharacters, 3);
  if (totalScore >= 200)
    differentCharacters = rectButtonChange(460, 400, 110, 110, differentCharacters, 4);
  if (totalScore >= 300)
    differentCharacters = rectButtonChange(580, 400, 110, 110, differentCharacters, 5);
  if (totalScore >= 500)
    differentCharacters = rectButtonChange(700, 400, 110, 110, differentCharacters, 6);
}
