class Star extends GameObjects {
  Star() {
    super(random(width), 0, 0, 0, random(1, 5), 255, 1);
    vy = size;
  }
  
  void act(){ 
    super.act();
    if (y - size/2 > height) 
      lives = 0;
  }
  
  void show() {
    super.show();
    square(x, y, size);
  }
}
