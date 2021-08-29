/*In this game, the 2 players (tanks) alternate trying to hit eachother with
artillery shells. To play, use the + or - buttons to change the power and
move with the large arrows. Use the mouse to aim, and when you are ligned up,
click to fire. Once a tank loses all of its health, press "r" to restart it all.
With every shot, the turn will switch to the other player.*/
int x1 = 100;
int x2 = 1100;
float a1= 0;
float a2= 0;
float h1;
float h2;
int hp1 = 50;
int hp2 = 50;
int p1 = 0;
int p2 = 0;
PFont fontA;
Shell myShell;
int turn = 1;
void setup() {
  myShell = new Shell(0);
  size(1200,800);
  fontA = createFont("Arial", 30);
  textFont(fontA);}
  
void draw() {
  background(23,215,249);
  toolBar();
  fill(234,235,131);
  rect(0,400,width,400);
  tank(1, x1,a1);
  resetMatrix();
  tank(-1,x2,a2);
  resetMatrix();
  myShell.move();
  fill(0);
  fontA = createFont("Arial", 20);
  textFont(fontA);
  if (turn == 1) {
    text("Player 1", 530,30);
    if (-(atan2(-mouseY+400,mouseX-x1)) >= -PI/2 && -(atan2(-mouseY+400,mouseX-x1)) <= 0) {
      a1 = -(atan2(-mouseY+400,mouseX-x1));}}
  else if (turn == -1) {
    text("Player 2", 530,30);
    if (atan2(-mouseY+400,x2-mouseX) <= PI/2 && atan2(-mouseY+400,x2-mouseX) >= 0) {
      a2 = atan2(-mouseY+400,x2-mouseX);}}
  if (hp1 <= 0) {
    fill(0);
    fontA = createFont("Arial", 60);
    textFont(fontA);
    float w = textWidth("Player 2 Wins!");
    text("Player 2 Wins!",600-(w/2),400);} 
  else if (hp2 <= 0) {
    fill(0);
    fontA = createFont("Arial", 60);
    textFont(fontA);
    float w = textWidth("Player 1 Wins!");
    text("Player 1 Wins!",600-(w/2),400);}
}
  
void tank(int o, int tankX, float angle) {
  noStroke();
  translate(tankX,400);
  fill(128);
  rect(-20*o,-5,40*o,10);
  rect(-16*o,-10,24*o,8);
  rotate(angle);
  rect(0,-10,29*o,4);
  resetMatrix();
  translate(-tankX,-400);}
  
void mouseReleased() {
  if (mouseX >= 10 && mouseX <= 40 && mouseY <= 40 && mouseY >= 10) {
    if (turn == 1 && x1 >= 0) {
      x1 -= 10;}
    else if (turn == -1 && x2 >= 700) {
      x2 -= 10;}}
  else if (mouseX >= 50 && mouseX <= 80 && mouseY <= 40 && mouseY >= 10) {
    if (turn == 1 && x1 <= 500) {
      x1 += 10;}
    else if (turn == -1 && x2 <= width){
      x2 += 10;}}
  else if (mouseX >= 90 && mouseX <= 120 && mouseY <= 40 && mouseY >= 10) {
    if (turn == 1) {
      p1-=5;}
    else if (turn == -1){
      p2-=5;}}
  else if (mouseX >= 130 && mouseX <= 160 && mouseY <= 40 && mouseY >= 10) {
    if (turn == 1) {
      p1+=5;}
    else if (turn == -1){
      p2+=5;}}
  else {
    if (turn == 1) {
      if (-(atan2(-mouseY+400,mouseX-x1)) <= -PI/2) {
        h1 = -PI/2;}
      else {
        h1 = -(atan2(-mouseY+400,mouseX-x1));}
      myShell = new Shell(turn);
      turn = -1;}
    else if (turn == -1) {
      if (atan2(-mouseY+400,x2-mouseX) >= PI/2) {
        h2 = PI/2;}
      else {
        h2 = atan2(-mouseY+400,x2-mouseX);}
      myShell = new Shell(turn);
      turn = 1;}}
  }
    
void toolBar() {
  resetMatrix();
  fill(255);
  rect(10,10,30,30);
  rect(50,10,30,30);
  rect(90,10,30,30);
  rect(130,10,30,30);
  fill(0);
  triangle(15,25,35,15,35,35);
  triangle(55,15,55,35,75,25);
  rect(95,20,20,10);
  rect(140,15,10,20);
  rect(135,20,20,10);
  fill(255);
  rect(170,10,80,30);
  rect(260,10,80,30);
  rect(350,10,80,30);
  rect(440,10,80,30);
  fill(0);
  fontA = createFont("Arial", 12);
  textFont(fontA);
  if (turn == 1) {
    text("Power:" + p1, 175,35);}
  else if (turn == -1) {
    text("Power:" + p2, 175,35);}
  if (turn == 1) {
    text("Angle:" + (int)(h1*57),265,35);}
  else if (turn == -1) {
    text("Angle:" + (int)(h2*57),265,35);}
  //hp
  text("P1 Health:" + hp1, 350,35);
  text("P2 Health:" + hp2, 440, 35);
}

void keyPressed() {
  if (key == 'r') {
    background(23,215,249);
    toolBar();
    fill(234,235,131);
    rect(0,400,width,400);
    tank(1, x1,a1);
    resetMatrix();
    tank(-1,x2,a2);
    hp1 = 50;
    hp2 = 50;
    p1 = 0;
    p2 = 0;
    x1 = 100;
    x2 = 1100;}}
