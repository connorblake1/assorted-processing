3  /*Instructions:
      //Image  - https://www.google.com/search?q=snowy+mountains&rlz=1C5CHFA_enUS796US796&source=lnms&tbm=isch&sa=X&ved=0ahUKEwixk-LTsp3fAhUHTN8KHWYLDNIQ_AUIDigB&biw=1280&bih=641&dpr=2#imgrc=jXYLeqWAn1u91M:
      Press 1 for copy from image tool
        First you must click a point on the image that you want to copy from then you drag the mouse around the image.
        This is supposed to be similar to Photoshop.
      Press 2 to draw
        Click on a color or press 2 to start drawing by dragging the mouse.
      Press 3 to erase
        Like the draw tool, but it reverts it to the original picture
      For all functions:
        Pressing [ decreases brush size by 1.
        Pressing ] increases brush size by 1.
        Pressing 9 decreases brush size by 5.
        Pressing 0 increases brush size by 5.
        Clicking on the hollow box changes all functions to draw squares.
        Clicking on the hollow circle changes all functions to draw in a circle pattern.
        Painstaking effort was made to avoid boundary collisions and the subsequent crash of the program so feel free to draw up
        against the edges.
      
  */
  
ImageEditor pS; // gets edited
ImageEditor eS; // holds the original picture
int brushSize = 0;
int brushShape = 1;
color brushColor;
int drawMode = 2; // 1 is copy from picture, 2 is draw on the picture, 3 is erase
color CP = color(0,0,0);
int offSetX;
int offSetY;
int holdX = 100;
int holdY = 100;
int startX = 100;
int startY = 100;
  void setup() {
    pS = new ImageEditor("matterhorn.jpg");
    //https://www.google.com/search?q=snowy+mountains&rlz=1C5CHFA_enUS796US796&tbm=isch&source=lnt&tbs=isz:lt,islt:4mp&sa=X&ved=0ahUKEwj2mb3C2P_eAhWJ1IMKHfAXBw4QpwUIHg&biw=1280&bih=690&dpr=2#imgrc=jXYLeqWAn1u91M:
    eS = new ImageEditor(pS);
    rectMode(CENTER);
    pS.resizeWindowToImage();
  }
  void draw() {}
  
  void mouseDragged() {
    //if (mouseY + brushSize < height && mouseY-brushSize > 40 && mouseX + brushSize < width && mouseX - brushSize > 0) {
    // put this before every pixel grab
      pS.startEditing();
    if (drawMode == 1) {
      if (mouseY > 40) {
        if (brushShape == 1) {
          for(int subPW = -1*brushSize; subPW <= brushSize; subPW++){
            for (int subPH = -1*brushSize; subPH <= brushSize; subPH++) {
              if (mouseY + subPH <= height && mouseY+subPH >= 40 && mouseX + subPW < width && mouseX + subPW >= 0) {
                offSetX = mouseX - startX;
                offSetY = mouseY - startY;
                if (holdX + offSetX + subPW < width && holdX + offSetX + subPW >= 0 && holdY + offSetY + subPH >= 40 && holdY + offSetY + subPH <= height)  { 
                  CP = color(pS.getColorAt(holdX + offSetX + subPW, holdY + offSetY + subPH - 40));}
                if (mouseX + subPW >= 0 && mouseX + subPW < width && mouseY + subPH >= 40 && mouseY + subPH <= height) {
                  pS.setColorAt(CP,mouseX+subPW, mouseY+subPH - 40);}}}}}
        if (brushShape == 2) {
          for(int subPW = -1*brushSize; subPW <= brushSize; subPW++){
            for (int subPH = -1*brushSize; subPH <= brushSize; subPH++) {
              float d2 = sqrt(sq(subPW)+sq(subPH));
              if (d2 <= brushSize) {
                if (mouseY + subPH <= height && mouseY+subPH >= 40 && mouseX + subPW < width && mouseX + subPW >= 0) {
                  offSetX = mouseX - startX;
                  offSetY = mouseY - startY;
                  if (holdX + offSetX + subPW < width && holdX + offSetX + subPW >= 0 && holdY + offSetY + subPH >= 40 && holdY + offSetY + subPH <= height)  { 
                    CP = color(pS.getColorAt(holdX + offSetX + subPW, holdY + offSetY + subPH - 40));}
                  if (mouseX + subPW >= 0 && mouseX + subPW < width && mouseY + subPH >= 40 && mouseY + subPH <= height) {
                    pS.setColorAt(CP,mouseX+subPW, mouseY+subPH - 40);}}}}}}}}
     else if (drawMode == 2) {
       if (mouseY > 40) {
         if (brushShape == 1) {
           //box shape
           for (int subPW = -1*brushSize;subPW <= brushSize; subPW++ ) {
             for (int subPH = -1*brushSize;subPH <= brushSize; subPH++ ) {
               if (mouseY + subPH <= height && mouseY+subPH >= 40 && mouseX + subPW < width && mouseX + subPW >= 0) {
                 pS.setColorAt(brushColor,mouseX + subPW,mouseY+subPH-40);}}}}
         else if (brushShape == 2) {
           //circular shape
           for (int subPW = -1*brushSize;subPW <= brushSize; subPW++ ) {
             for (int subPH = -1*brushSize;subPH <= brushSize; subPH++ ) {
               float d1 = sqrt(sq(subPW)+sq(subPH));
               if (d1 <= brushSize) {
                 if (mouseY + subPH <= height && mouseY+subPH >= 40 && mouseX + subPW < width && mouseX + subPW >= 0) {
                   pS.setColorAt(brushColor,mouseX + subPW,mouseY+subPH - 40);}}}}}}}
     else if (drawMode == 3) {
       eS.startEditing();
       if (mouseY > 40) {
         if (brushShape == 1) {
           //box shape
           for (int subPW = -1*brushSize;subPW <= brushSize; subPW++ ) {
             for (int subPH = -1*brushSize;subPH <= brushSize; subPH++ ) {
               if (mouseY + subPH <= height && mouseY+subPH >= 40 && mouseX + subPW < width && mouseX + subPW >= 0) {
                 CP = eS.getColorAt(mouseX + subPW, mouseY + subPH-40);
                 pS.setColorAt(CP,mouseX + subPW,mouseY+subPH-40);}}}}
         else if (brushShape == 2) {
           //circular shape
           for (int subPW = -1*brushSize;subPW <= brushSize; subPW++ ) {
             for (int subPH = -1*brushSize;subPH <= brushSize; subPH++ ) {
               float d = sqrt(sq(subPW)+sq(subPH));
               if (d <= brushSize) {
                 if (mouseY + subPH <= height && mouseY+subPH >= 40 && mouseX + subPW < width && mouseX + subPW >= 0) {
                   CP = eS.getColorAt(mouseX + subPW, mouseY + subPH - 40);
                   pS.setColorAt(CP,mouseX + subPW,mouseY+subPH - 40);}}}}}}}
      pS.stopEditing();
      pS.drawAt(0,40);
      fill(0);
      rect(20,15,10,10); 
      rect(50,15,20,20);
      rect(90,15,30,30);
      //shape type
      noFill();
      strokeWeight(3);
      rect(165,15,30,30);
      ellipse(210,15,30,30);
      //colors
      noStroke();
      fill(255,0,0);
      rect(250,15,20,20);
      fill(0,255,0);
      rect(285,15,20,20);
      fill(0,0,255);
      rect(320,15,20,20);
      fill(255,255,0);
      rect(355,15,20,20);
      fill(255,0,255);
      rect(390,15,20,20);
      fill(0,255,255);
      rect(425,15,20,20);
      //b and w
      fill(255,255,255);
      rect(460,15,20,20);
      fill(0);
      rect(495,15,20,20);
  }
  void mouseClicked() {
    if (drawMode== 1 & mouseY > 40) {
      holdX = mouseX;
      holdY = mouseY;}}
  void mousePressed() {
    if (drawMode== 1 & mouseY > 40) {
      startX = mouseX;
      startY = mouseY;}
  }
    
    
  void mouseReleased() {
    if (mouseX >= 15 && mouseX <= 25 && mouseY <= 20 && mouseY >= 10) {
      brushSize = 1;}
    else if (mouseX >= 40 && mouseX <= 60 && mouseY <= 25 && mouseY >= 5) {
      brushSize = 4;}
    else if (mouseX >= 75 && mouseX <= 105 && mouseY <= 30 && mouseY >= 0 ) {
      brushSize = 7;} 
    //brush shape
    else if (mouseX >= 150 && mouseX <= 180 && mouseY <= 30 && mouseY >= 0 ) {
      brushShape = 1;}
    else if (mouseX >= 195 && mouseX <= 225 && mouseY <= 30 && mouseY >= 0 ) {
      brushShape = 2;}
    //brush color
    else if (mouseX >= 240 && mouseX <= 260 && mouseY <= 25 && mouseY >= 5 ) {
      brushColor = color(255,0,0);
      CP = brushColor;
      drawMode = 2;}
    else if (mouseX >= 275 && mouseX <= 295 && mouseY <= 25 && mouseY >= 5 ) {
      brushColor = color(0,255,0);
      CP = brushColor;
      drawMode = 2;}
    else if (mouseX >= 310 && mouseX <= 330 && mouseY <= 25 && mouseY >= 5 ) {
      brushColor = color(0,0,255);
      CP = brushColor;
      drawMode = 2;}
    else if (mouseX >= 345 && mouseX <= 365 && mouseY <= 25 && mouseY >= 5 ) {
      brushColor = color(255,255,0);
      CP = brushColor;
      drawMode = 2;}
    else if (mouseX >= 380 && mouseX <= 400 && mouseY <= 25 && mouseY >= 5 ) {
      brushColor = color(255,0,255);
      CP = brushColor;
      drawMode = 2;}
    else if (mouseX >= 415 && mouseX <= 435 && mouseY <= 25 && mouseY >= 5 ) {
      brushColor = color(0,255,255);
      CP = brushColor;
      drawMode = 2;}
    else if (mouseX >= 450 && mouseX <= 470 && mouseY <= 25 && mouseY >= 5 ) {
      brushColor = color(255,255,255);
      CP = brushColor;
      drawMode = 2;}
    else if (mouseX >= 485 && mouseX <= 505 && mouseY <= 25 && mouseY >= 5 ) {
      brushColor = color(0);
      CP = brushColor;
      drawMode = 2;}}
  void keyPressed() {
      if (key == '1') {
        drawMode = 1;
        println("Now in stamp mode");}
      else if (key == '2') {
        drawMode = 2;
        CP = brushColor;
        println("Now in color mode");}
      else if (key == '3') {
        drawMode = 3;
        println("Now in erase mode");}
      else if (key == ']') {
        brushSize++;}
      else if (key == '[') {
        brushSize--;}
      else if (key == '9') {
        brushSize -= 5;}
      else if (key == '0') {
        brushSize += 5;}
      else if (key == ' ') {
        save("result");}}
