ArrayList<Asteroid> aL;
ArrayList<Laser> lL;
boolean screen = false;
PFont fontA;
float sX = 400;
float sY = 300;
float sXV = 0;
float sYV = 0;
float sA = 0;
int sH = 200;

void setup() {
  fontA = createFont("Arial", 60);
  textFont(fontA);
  aL = new ArrayList<Asteroid>();
  lL = new ArrayList<Laser>();
  size(800, 600);
  for (int i = 0; i < 10; i++) {
      aL.add(new Asteroid(3,random(width),random(height)));}
}

void draw() {
  if (screen == false) {
    background(0);
    float w = textWidth("Asteroids");
    fill(255);
    text("Asteroids", (width/2)-(w/2), 200);
    rect(325, 300, 150, 100);
    w = textWidth("Start");
    fill(0);
    text("Start", (width/2)-(w/2), 375);} 
  else {
    background(0);
    spaceShip();
    fontA = createFont("Arial",16);
    fill(255);
    textFont(fontA);
    text("Health: " + sH, 300, 40);
    for (int i = 0; i < aL.size(); i++) {
      //move
      aL.get(i).update();
      //bounce
      for (int j = 0; j < aL.size(); j++) {
        if (i != j) {
          float d = sqrt(sq(aL.get(i).xC-aL.get(j).xC)+sq(aL.get(i).yC-aL.get(j).yC));
          if (d <= aL.get(i).size*10+aL.get(i).size*10) {
            aL.get(i).xV *= -1;
            aL.get(i).yV *= -1;
            aL.get(j).xV *= -1;
            aL.get(j).yV *= -1;}}}
      //laser collision
      for (int j = 0; j < lL.size(); j++ ) {
        float d = sqrt(sq(aL.get(i).xC-lL.get(j).lX)+sq(aL.get(i).yC-lL.get(j).lY));
        if (d < aL.get(i).size*10) {
          aL.get(i).size--;
          aL.add(new Asteroid(aL.get(i).size,aL.get(i).xC,aL.get(i).yC));
          lL.remove(j);}}
      //spaceship and asteroid collision
      float d = sqrt(sq(aL.get(i).xC-sX)+sq(aL.get(i).yC-sY));
      if (d < aL.get(i).size*10+15) {
        sH -= 1;}
      //draw
      aL.get(i).graph();
      //remove
      if (aL.get(i).size == 0) {
        aL.remove(i);}}
    //laser stuff
    for (int i = 0; i < lL.size(); i++) {
      lL.get(i).move();
      lL.get(i).graph();
      if (lL.get(i).lX <= 0) {
        lL.remove(i);}
      else if (lL.get(i).lY <= 0) {
        lL.remove(i);}
      else if (lL.get(i).lX >= width) {
        lL.remove(i);}
      else if (lL.get(i).lY >= height) {
        lL.remove(i);}}
  }
}

void mouseReleased() {
  if (screen == false && mouseX >= (width/2)-75 && mouseX <= (width/2)+75 && mouseY >= 300 && mouseY <= 400) {
    screen = true;}
  else if (screen == true) {
    lL.add(new Laser(sA, sX, sY));}
}

void keyPressed() {
  if (screen == true) {
    if (key == 'a' || keyCode == LEFT) {
      sA -= .25;} 
    else if (key == 'd' || keyCode == RIGHT) {
      sA += .25;}
    else if (key == 'w' || keyCode == UP) {
      sXV -=cos(sA)*1;
      sYV -= sin(sA)*1;}
    else if (key == ' ') {
      lL.add(new Laser(sA, sX, sY));}}
}

void spaceShip() {
  translate(sX, sY);
  rotate(sA);
  sX += sXV;
  sY += sYV;
  fill(255);
  triangle(15, -10, 15, 10, -20, 0);
  resetMatrix();
  if (sX <= 0) {
    sX = width;
  } else if (sX >= width) {
    sX = 0;
  } else if (sY >= height) {
    sY = 0;
  } else if (sY <= 0) {
    sY = height;
  }
}
