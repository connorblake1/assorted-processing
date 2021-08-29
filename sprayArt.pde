//https://www.google.com/search?q=kinkaid+falcons&rlz=1C5CHFA_enUS796US796&source=lnms&tbm=isch&sa=X&ved=0ahUKEwifiK3935XfAhUGKawKHVCyCKwQ_AUIDygC&biw=1280&bih=641#imgrc=dcs-5UUTZ4RouM:

PFont colorA;
ImageEditor canvas;
ImageEditor fringe;
void setup() {
  size(800,600);
  colorA = createFont("Arial", 18);
  canvas = new ImageEditor("falconLogo2.jpg");
  fringe = new ImageEditor(canvas.width()+30,canvas.height()+30);
  fringe.startEditing();
  //makes fringe white
  for (int x = 0; x < fringe.width(); x++) {
    for (int y = 0; y < fringe.height(); y++) {
      fringe.setColorAt(255,x,y);}}
  fringe.stopEditing();
  textFont(colorA);
  noLoop();
  background(255);
  
}
void draw() {
  background(255);
  translate(200,200);
  rotate(PI/4);
  sprayCan(color(0,0,255));
  resetMatrix();
  translate(600,200);
  rotate(-PI/4);
  sprayCan(color(255,0,0));
  resetMatrix();
  fringe.drawAt(235,385);
  canvas.drawAt(250,400);
  save("kinkaidSprayArt.jpg");
}



void sprayCan(color sC) {
  canvas.startEditing();
  fringe.startEditing();
  fill(sC);
  stroke(sC);
  rect(-10,0,20,70);
  rect(-2,-5,4,5);
  //draws can above ^, prints letters below
  if (sC == color(255,0,0)) {
    rotate(PI/2);
    fill(0);
    float w = textWidth("RED");
    text("RED",w/2,7);}
  else if (sC == color(0,0,255)) {
    rotate(-PI/2);
    fill(255);
    float w = textWidth("BLUE");
    text("BLUE",-85+(w/2),7);}
  fill(sC);
  resetMatrix();
  //paint tracers
  for (int i = 0; i < 100000; i++) {
    stroke(sC,1); // ultra low opacity
    int randomX = (int)random(235,565);
    int randomY = (int)random(385,534);
    if (sC == color(255,0,0)) {
      line(600,200,randomX,randomY);
      //outside boundaries - not too many dots
      if (randomX < 251 || randomX > 549 || randomY < 401 || randomY > 519) {
        int randomInt = (int)random(10);
        if (randomInt == 1) {
          stroke(sC);
          fringe.setColorAt(color(76, 50, fringe.getBlueAt(randomX-235,randomY-385)),randomX-235,randomY-385);}}
      //inside boundaries
      else {
        //color distance to white
        float d = sqrt(sq(255-canvas.getRedAt(randomX-250,randomY-400))+sq(255-canvas.getGreenAt(randomX-250,randomY-400))+ sq(255-canvas.getBlueAt(randomX-250,randomY-400)));
        if (d> 30) {
          color cH = color(76,50, canvas.getBlueAt(randomX-250,randomY-400));
          canvas.setColorAt(cH, randomX-250,randomY-400);}}}
    else if (sC == color(0,0,255)) {
      line(200,200,randomX,randomY);
      if (randomX < 251 || randomX > 549 || randomY < 401 || randomY > 519) {
        int randomInt = (int)random(10);
        if (randomInt == 1) {
          stroke(sC);
          fringe.setColorAt(color(fringe.getRedAt(randomX-235,randomY-385), 50, 141),randomX-235,randomY-385);}}
      else {
        float d = sqrt(sq(255-canvas.getRedAt(randomX-250,randomY-400))+sq(255-canvas.getGreenAt(randomX-250,randomY-400))+ sq(255-canvas.getBlueAt(randomX-250,randomY-400)));
        if (d> 30) {
          color cH = color(canvas.getRedAt(randomX-250,randomY-400),50, 141);
          canvas.setColorAt(cH, randomX-250,randomY-400);}}
    }}
    canvas.stopEditing();
    fringe.stopEditing();
}
