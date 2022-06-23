/*
Zi Qing Xiong 
2-4
May 25, 2022
Final Project

IDEAS:
- LoZ BotW
- Tiny Link Fighting
  - Guardians 
  - Slime?
  - Final Boss: Loz Beasts Turned Bad!! :000
- Characters:
  - Link
  - Zelda //insane bullets
  - Mipha //v bullets
  - Daruk //huge bullets
  - Revali //teleportation
  - Urbosa //fast bullets
- Title Ideas
  - Hyrule Explosion
  
CRITERIA:
- Create a variety (at least 3) of enemy classes
  - have different guns and movement speeds/patterns
    ENEMIES:
    - guardians
      - shoots tiny red lazers one at a time - stay in one spot
    - guardians 2.0
      - follows player and shoots red lazers
    - boko
      - normal ones - just shoots
    BOSSES:
    - Bird 
      - wind? makes all bullets fly weirdly?
    - Elephant
      - water rises? can't touch the water
    - Scorpion
      - lava rises - lose 50% death
    - Camel
      - shoots electric bolts - moving functions go off
    
- Make your ship shootable :3

- Make enemies explode when they die (using a class-based effect like a particle class) :3

- Make a power-up class - created by enemies when they die, and they boost the starship when they contact them

RULES:
- Hyrule is under attack!!
Elephant mode - tip: save bombs!!
- if an enemy manages to reach the bottom, points will be deducted from your score

QUESTIONS:
- one use bombs are taking more bombs than needed
*/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode = 0;
final int INTRO = 1;
final int SETTING = 2;
final int SELECTION = 3;
final int MODES = 4;
final int GAME = 5;
final int PAUSE = 6;
final int GAMEOVER = 7;
final int INFO = 8;

//colours ------------------------------------------------------------------------------
color backgroundColour = #293748;
color titleColour = #FAE98B;
color buttonBaseColour = color(255, 255, 255, 100);
color buttonColour = #FFF4B4;
color textColour = #AD8D0C;

//images -------------------------------------------------------------------------------
PImage[] players = new PImage[6];
PImage[] showPlayer = new PImage[6];
PImage[] bossDisplay = new PImage[4];
PImage[] bossDisplay2 = new PImage[4];
PImage[] ganons = new PImage[4];
PImage boko, guardians, lynels;
PImage bombs;

//lists --------------------------------------------------------------------------------
ArrayList<GameObjects> objects = new ArrayList<GameObjects>();

//spaceships and stuff -----------------------------------------------------------------
Starfighter player1 = new Starfighter();
Waterblight waterboss = new Waterblight();
Windblight windboss = new Windblight();
Fireblight fireboss = new Fireblight();
Fire fireFlame = new Fire(0, 0);
Thunderblight thunderboss = new Thunderblight();
boolean thunderMode = false;

//music --------------------------------------------------------------------------------
Minim minim;
AudioPlayer main;
AudioPlayer[] soundEffects = new AudioPlayer[2];
float volumeMain = 0;
float volumeEffects = 0;
float sliderX1 = 460;
float sliderX2 = 460;

//keyboard -----------------------------------------------------------------------------
boolean upkey = false;
boolean downkey = false;
boolean leftkey = false;
boolean rightkey = false;
boolean space = false;
boolean pkey = false;
boolean akey = false;

//timers -------------------------------------------------------------------------------
int gameTimer = 0;

//other --------------------------------------------------------------------------------
PFont titleFont;
PFont gameoverFont;
int differentModes = 1;
int differentCharacters = 1;
int totalScore = 0;
int score = 0;
float hp = 500;
float hpwidth = 0;
int bombNum = 0;
int immunityTime = 0;
boolean win = false;

void setup() {
  size(800, 500); // middle = (400, 250);
  background(backgroundColour);
  
  //sound ------------------------------------------------------------------------------
  minim = new Minim(this);
  main = minim.loadFile("bossMusic.mp3");
  soundEffects[0] = minim.loadFile("choices.mp3");
  soundEffects[1] = minim.loadFile("selection.mp3");
  
  //images -----------------------------------------------------------------------------
  players[0] = loadImage("player1.jpeg");
  players[1] = loadImage("player2.jpeg");
  players[2] = loadImage("player3.jpeg");
  players[3] = loadImage("player4.jpeg");
  players[4] = loadImage("player5.jpeg");
  players[5] = loadImage("player6.jpeg");
  
  showPlayer[0] = loadImage("Different1.PNG");
  showPlayer[1] = loadImage("Different2.PNG");
  showPlayer[2] = loadImage("Different3.PNG");
  showPlayer[3] = loadImage("Different4.PNG");
  showPlayer[4] = loadImage("Different5.PNG");
  showPlayer[5] = loadImage("Different6.PNG");
  
  bossDisplay[0] = loadImage("Boss1Mode.jpeg");
  bossDisplay[1] = loadImage("Boss2Mode.jpeg");
  bossDisplay[2] = loadImage("Boss3Mode.jpeg");
  bossDisplay[3] = loadImage("Boss4Mode.jpeg");
  
  bossDisplay2[0] = loadImage("Boss1.PNG");
  bossDisplay2[1] = loadImage("Boss2.PNG");
  bossDisplay2[2] = loadImage("Boss3.PNG");
  bossDisplay2[3] = loadImage("Boss4.PNG");
  
  ganons[0] = loadImage("ActualBoss1.PNG");
  ganons[1] = loadImage("ActualBoss2.PNG");
  ganons[2] = loadImage("ActualBoss3.PNG");
  ganons[3] = loadImage("ActualBoss4.PNG");
  
  boko = loadImage("Bokoblin.PNG");
  guardians = loadImage("Guardian.PNG");
  lynels = loadImage("Lynel.PNG");
  bombs = loadImage("Bomb.PNG");
  
  //other ------------------------------------------------------------------------------
  
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  
  main.loop();
  mode = INTRO;
}

void draw() {
  if (mode == INTRO) 
    intro();
  else if (mode == SETTING) 
    setting();
  else if (mode == SELECTION) 
    selection();
  else if (mode == MODES)
    modes();
  else if (mode == GAME) 
    game();
  else if (mode == PAUSE) 
    pause();
  else if (mode == GAMEOVER) 
    gameover();
  else if (mode == INFO)
    info();
  else 
    println("Error: Mode = " + mode);
}

//back button --------------------------------------------------------------------------
void backButton() {
  noStroke();
  fill(buttonColour);
  tactileRect(70, 50, 90, 50);
  rect(70, 50, 90, 50);
  
  //text
  fill(textColour);
  titleFont = createFont("The Wild Breath of Zelda.otf", 30);
  textFont(titleFont);
  text("back", 70, 52);
}

//tactile rectangular buttons ----------------------------------------------------------
void tactileRect(float x, float y, int w, int h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    strokeWeight(3);
    stroke(#AD8D0C);
    fill(#FAE697);
  }
}

//tactile rectangular buttons ----------------------------------------------------------
void tactileRect2(float x, float y, int w, int h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    strokeWeight(3);
    stroke(#FAE697);
  }
}

//tactile rectangular buttons ----------------------------------------------------------
void tactileRect3(float x, float y, int w, int h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    strokeWeight(2);
    stroke(220);
  }
}

//rectangle buttons --------------------------------------------------------------------
void rectButton(float x, float y, int w, int h, int modeNum) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2)  {
    soundEffects[0].rewind();
    soundEffects[0].play();
    mode = modeNum;
  }
}

//rectangle buttons --------------------------------------------------------------------
void rectButton2(float x, float y, int w, int h) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) 
    exit();
}

//rectangle buttons --------------------------------------------------------------------
void rectButton3(float x, float y, int w, int h, int modeNum) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    soundEffects[1].rewind();
    soundEffects[1].play();
    reset();
    mode = modeNum;
  }
}

//rectangle change buttons -------------------------------------------------------------
int rectButtonChange(float x, float y, int w, int h, int oldInt, int newInt) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) { 
    soundEffects[1].rewind();
    soundEffects[1].play();
    oldInt = newInt;
  }
  return oldInt;
}

//rectangle change buttons -------------------------------------------------------------
int rectButtonChange2(float x, float y, int w, int h, int oldInt, int newInt, boolean modeTrue, boolean modeFalse, boolean modeFalse2, boolean modeFalse3) {
  if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    soundEffects[0].rewind();
    soundEffects[0].play();
    oldInt = newInt;
    modeTrue = true;
    modeFalse = false;
    modeFalse2 = false;
    modeFalse3 = false;
  }
  return oldInt;
}
