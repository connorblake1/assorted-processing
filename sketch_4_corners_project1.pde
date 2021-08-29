PImage ballImage;
void setup() {
  size(800,800);
  //noLoop();
  ballImage = loadImage("beachBallPic.png");
}
void draw() {
    ellipseMode(CENTER);
    colorMode(RGB);
    
    
  //shape 1 - rainbow sunflower
    //background
    //grass
    fill(0,163,0);
    rect(0,275,400,125);
    //sky
    fill(0,194,252);
    rect(0,0,400,275);
    //setting center for flower
    translate(200,150);
    //stem of flower
    noFill();
    strokeWeight(10);
    stroke(0,255,0);
    beginShape();
      vertex(0,75);
      bezierVertex(-30,290, 30,105,0,245);
    endShape();
    strokeWeight(1);
    stroke(0);
    //yellow petals
    fill(441,250,41);
    for (int petals = 0; petals <= 26; petals ++) {
      pushMatrix();
        rotate(petals*PI*13.8/180);
        //prints 26 petals rotating 360/26 each time
        ellipse(100,0,100,50);
      popMatrix();}
    colorMode(HSB);
    //seed spiral in middle
    for (int xt = 0; xt <= 1200; xt++) {
      pushMatrix();
        //turns by golden angle so closely nested like a real sunflower
        rotate(137.507*PI*xt/180);
        //changes color as turns more
        fill(xt/4,255,255);
        ellipse(xt/10,0,10,5);
      popMatrix();}
  //shape2 - fractal
    //https://www.google.com/search?q=beachball+png&rlz=1C5CHFA_enUS796US796&source=lnms&tbm=isch&sa=X&ved=0ahUKEwiqidLr7rXdAhUqvlkKHd6pDNIQ_AUICigB&biw=1280&bih=726#imgrc=ezOMsXmmvcYy4M:
    //This is the base layer of code that I used to make the fractal
    
    //for (int layer5 = 0; layer5 <= 6; layer5++) {
    //   scale(.5);
      //makes it get smaller every time it copies the whole thing
    //   image(ballImage, 0, -64);
    //   pushMatrix();
    //     translate(64,0);
    //     rotate(PI/2);
    //     translate(64,0);
      //     this is where the next method is implemented
    //     scale(.5);
    //     image(ballImage, 0, -64);
      //prints one below each beach ball
    //   popMatrix();
    //   pushMatrix();
    //     translate(64,-64);
    //     rotate(-PI/2);
      //     this is where the next method is implemented
    //     scale(.5);
    //     image(ballImage, 0, -64);
      //prints one above each beach ball
    //   popMatrix();
    //   translate(128,0);}
      //moves it forward to the next set
      //repeats 6 times
    
    
    //moves to new spot
    translate(400,50);
    colorMode(RGB);
    fill(0,109,330);
    //background
    rect(-200,-200,400,400);
    //big ball in center
    //image sized 128,128
    image(ballImage, -64,-64);
    
  //this loop is to repeat the pattern in all four directions (loop)
  for (int rotater = 0; rotater <= 4; rotater++) {
    pushMatrix();
      translate(64,0);
      fractal1();
      //see above and in method for notes
    popMatrix();
    rotate(PI/2);}
    
    
 //shape 3 - warped magenta blue thing
     resetMatrix();
     translate(200,600);
     colorMode(RGB);
     fill(223,19,211);
     rect(-200,-200,400,400);
     strokeWeight(3);
     stroke(0,0,255);
       for (int repeater = 0; repeater <= 4; repeater++) {
         //rotates it 4 times
         quarterCircleIN();
         rotate(PI/2);}
       for (int repeater1 = 0; repeater1 <= 4; repeater1++) {
         //rotates it 4 times
         quarterCircleOUT();
         rotate(PI/2);}
 //shape 4 - opical illusion where phantom black dots should appear in the white circles
   resetMatrix();
   strokeWeight(1);
   stroke(0,0,0);
   translate(400,400);
   fill(0);
   rect(0,0,400,400);
   stroke(128);
   fill(128);
   //grid of grey lines
   for (int liner = 10; liner <= 400; liner+= 41) {
     rect(liner,0,6,400);}
   for (int liner1 = 10; liner1 <= 400; liner1 += 41) {
     rect(0,liner1,400,6);}
   //grid of white dots
   fill(255);
   for (int liner = 13; liner <= 400; liner+= 41) {
     for (int liner1 = 13; liner1 <= 400; liner1 += 41) {
       ellipse(liner,liner1,12,12);}}
   strokeWeight(1);
   stroke(0);
}

  //shape 2
  //it runs each set of 6 beach balls with one on top and bottom but after the first one it tries the run the whole thing again (this happens twice)To see the progression comment out the 2 "fractal2();" in the method fractal1()
void fractal1() {
  for (int layer = 0; layer <= 6; layer++) {
      scale(.5);
      image(ballImage, 0, -64);
      pushMatrix();
        translate(64,64);
        rotate(PI/2);
        fractal2();
        //this sends it to the run the whole thing over again on the ball it just made
        scale(.5);
        image(ballImage, 0, -64);
      popMatrix();
      pushMatrix();
        translate(64,-64);
        rotate(-PI/2);
        fractal2();
        //this sends it to the run the whole thing over again on the ball it just made
        scale(.5);
        image(ballImage, 0, -64);
      popMatrix();
      translate(128,0);}
}
void fractal2() {
  for (int layer = 0; layer <= 6; layer++) {
      scale(.5);
      image(ballImage, 0, -64);
      pushMatrix();
        translate(64,64);
        rotate(PI/2);
        fractal3();
        //this continues like above
        scale(.5);
        image(ballImage, 0, -64);
      popMatrix();
      pushMatrix();
        translate(64,-64);
        rotate(-PI/2);
        fractal3();
        scale(.5);
        image(ballImage, 0, -64);
      popMatrix();
      translate(128,0);}
}
void fractal3() {
  for (int layer = 0; layer <= 6; layer++) {
      scale(.5);
      image(ballImage, 0, -64);
      pushMatrix();
        translate(64,64);
        rotate(PI/2);
        fractal4();
        scale(.5);
        image(ballImage, 0, -64);
      popMatrix();
      pushMatrix();
        translate(64,-64);
        rotate(-PI/2);
        fractal4();
        scale(.5);
        image(ballImage, 0, -64);
      popMatrix();
      translate(128,0);}
}
void fractal4() {
  for (int layer = 0; layer <= 6; layer++) {
      scale(.5);
      image(ballImage, 0, -64);
      pushMatrix();
        translate(64,64);
        rotate(PI/2);
        scale(.5);
        image(ballImage, 0, -64);
      popMatrix();
      pushMatrix();
        translate(64,-64);
        rotate(-PI/2);
        scale(.5);
        image(ballImage, 0, -64);
      popMatrix();
      translate(128,0);}
}
  //shape 3
void quarterCircleIN() {
  for(int lineMaker = 20; lineMaker >= 0; lineMaker--) {
    int oppo = 20 - lineMaker;
    line(0,-10*lineMaker,oppo*10,0);}
    //makes a line with decreasing y and increasing x to creat warped matrix effect (y=1/x)
}
void quarterCircleOUT() {
  for(int lineMaker1 = 20; lineMaker1 >= 0; lineMaker1--) {
    int oppo1 = 20 - lineMaker1;
    line(-200,-10*lineMaker1, oppo1*-10, -200);}
    //does the same thing as above but in the corner not starting at the center
}
