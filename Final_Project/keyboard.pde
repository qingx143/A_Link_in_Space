void keyPressed() {
  if (keyCode == UP)
    upkey = true;
  if (keyCode == DOWN)
    downkey = true;
  if (keyCode == LEFT)
    leftkey = true;
  if (keyCode == RIGHT)
    rightkey = true;
  if (key == ' ') 
    space = true;
  if (key == 'P' || key == 'p')
    pkey = true;
  if (key == 'A' || key == 'a')
    akey = true;
}

void keyReleased() {
  if (keyCode == UP)
    upkey = false;
  if (keyCode == DOWN)
    downkey = false;
  if (keyCode == LEFT)
    leftkey = false;
  if (keyCode == RIGHT)
    rightkey = false;
  if (key == ' ')
    space = false;
  if (key == 'P' || key == 'p')
    pkey = false;
  if (key == 'A' || key == 'a')
    akey = false;
}
