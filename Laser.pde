class Laser {
  float lX;
  float lY;
  float lA;
  Laser(float angle, float x, float y) {
    lA = angle;
    lX = x;
    lY = y;}
  
  void move() {
    lX -= cos(lA)*25;
    lY -= sin(lA)*25;}

  void graph() {
    stroke(255);
    strokeWeight(10);
    point(lX,lY);
    noStroke();}

}
