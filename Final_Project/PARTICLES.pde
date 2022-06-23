class Particles extends GameObjects {
  float dieSp;
  
  Particles(float x, float y, color c, int maxSize, float dieSpeed) {
    super(x, y, random(-5, 5), random(-5, 5), random(1, maxSize), c, 1);
    dieSp = dieSpeed;
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
  }
}
