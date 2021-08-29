float x = 5;
float y = 20;
int lineNumber;
float w = 0;
int pageNum = 0;
float spacer;
int counter = 0;
String holder;
boolean Cont;
float angle;
TextReader Rime;
PFont fontA;
void setup() {
  size(600,600);
  lineNumber=1;
  background(0);
  Rime = new TextReader("RotAM.txt");
  fontA = createFont("Times", 12);
  textFont(fontA);
  colorMode(HSB, 100,100,100);
}
void draw() {
  while(y  <= height) {
        if (Rime.isAtEnd() == true) {
          noLoop();
          return;}
        fontA = createFont(PFont.list()[(int)(36*noise(.15*counter + 4000))], 10 + 10*noise(.005*x+3000,.005*y+12000));
        textFont(fontA);
        holder = Rime.nextWord();
        w = textWidth(holder) + 2;
        if (w + x >= width) {
          x = 5;
          spacer = 0;
          lineNumber++;
          y = lineNumber * 20;} 
        if (w >= 30) {
          spacer = 5;}
        translate(x,y);
        angle = -PI/6 + (PI/3)*noise(.002* x+ 1000 + pageNum * 10,  .002 *y + 10000 + pageNum * 10);
        rotate(angle);
        fill(100* noise(.001*x+1000 + 10*pageNum,.001*y+5000 + 10*pageNum),100,100);
        text(holder, 0,0);
        resetMatrix();
        x += w -2 +(20* noise(.002*counter));
        y += w*sin(angle);
        counter++;}
    if (y >= height && Cont == true) {
      background(0);
      y = 20;
      lineNumber= 1;
      Cont = false;}
}
void keyPressed() {
  if (key == ' ') {
    Cont = true;
    pageNum++;}}
