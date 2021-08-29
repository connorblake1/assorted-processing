class Asteroid {
  float xC;
  float yC;
  float xV;
  float yV;
  int size;
  
  Asteroid(int mySize, float x, float y) {
    size = mySize;
    xC = x;
    yC = y;
    xV = random(3);
    yV = random(3);}
      
    void update() {
      xC += xV;
      yC += yV;
      if (xC <= 0) {
        xC = width;}
      else if (xC >= width) {
        xC = 0;}
      else if (yC >= height) {
        yC = 0;}
      else if (yC <= 0) {
        yC = height;}}
        
    void graph() {
      fill(128);
      ellipse(xC,yC,size*20,size*20);}
}
