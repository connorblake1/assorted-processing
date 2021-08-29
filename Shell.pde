class Shell {
  float yV;
  float xV;
  float xC;
  float yC;
  Shell(int o) {
    yC = 390;
    if (o == 1) {
      xC = x1;
      xV = .5*(cos(h1)*p1);
      yV = .5*(sin(h1)*p1);}
    else if (o == -1) {
      xC = x2;
      xV = -.5*cos(h2)*p2;
      yV = -.5*sin(h2)*p2;}
    else if (o == 0) {
      xC = -100;}
  }
  void move() {
    if (yC <= 425) {
      yV +=.15;
      xC += xV;
      yC += yV;
      fill(0);
      ellipse(xC,yC,5,5);}
    if (turn == -1 && xC <= x2+20 && xC >= x2-20 && yC <= 405 && yC >= 395) {
      hp2-= 20;}
    else if (turn == 1 && xC <= x1+20 && xC >= x1-20 && yC <= 405 && yC >= 395) {
      hp1-= 20;}
  }
}
