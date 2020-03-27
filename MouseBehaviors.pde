color RED = #DE0000;
color BLUE = #2789FF;
color YELLOW = #F7E300;
color GREEN = #26D300;
color WHITE = 250;
color[] c = {RED, YELLOW, BLUE, GREEN};


color randomInt(int n) {
  return (int) (Math.random()*n);
}

color randomInt(int min, int max) {
  return min + randomInt(max-min);
}

color randomColor(color[] c) {
  return color(c[randomInt(c.length)]);
}


//=================================================

void mousePressed() {
  g.mousePressed();
}

void mouseClicked() {
  mousePressed();
}

void mouseReleased() {
  g.mouseReleased();
}

void mouseDragged() {
  g.mouseDragged();
}
