int DEF_NO_ELEMENTS = 10;
float SCALE;
float WIDTH;
float HEIGHT;

//==================== GAME =========================//


class Game {
  Panel panel;
  ElementLL allElements;
  Element selected;

  Game() {
    panel = initBoard(90);
    allElements = initElements(DEF_NO_ELEMENTS);
  }

  Panel initBoard(float scale) {
    SCALE = scale;
    HEIGHT = height*SCALE/100;
    WIDTH = HEIGHT;
    Panel b = new Panel((100-SCALE)/100*WIDTH, (100-SCALE)/100*HEIGHT, WIDTH, HEIGHT);
    return b;
  }


  ElementLL initElements(int size) {
    selected = null;
    ElementLL e = new ElementLL();
    for (int i =0; i < size; i++) {
      float x = randomInt((int)WIDTH, width);
      float y = randomInt(10, height);
      e.addElement(new Element(x, y, height/10));
    }
    return e;
  }

  void draw() {
    panel.draw();
    allElements.draw();
  }

  //=====================================================
  // MOUSE BEHAVIOURS
  //=====================================================

  void mousePressed() {
    if (g.selected!=null && !g.selected.inRange(mouseX, mouseY)) {
      g.deselect();
    }
    Node curr = g.allElements.last;
    while (curr != null) {
      Element e = curr.item;
      if (e!= null && e.inRange(mouseX, mouseY)) {
        g.select(e);
        g.reorder(e);
        break;
      }
      curr = curr.next;
    }

    if (mousePressed && mouseButton == RIGHT) {
      rightMouseBehavior();
    }
  }


  void mouseClicked() {
    mousePressed();
  }

  void mouseReleased() {
    g.deselect();
  }

  void mouseDragged() {
    if (g.selected!= null) {
      g.selected.translate(mouseX, mouseY);
    }
  }

  void rightMouseBehavior() {
  }

  // ============= INTERFACE LOGIC ==================

  void reorder(Element e) {
    allElements.reorder(e);
  }

  void deselect() {
    selected = null;
  }

  void select(Element e) {
    selected = e;
  }
}

//==================== BOARD =========================//


class Panel {
  float _x0, _y0;
  float w, h;

  Panel(float x, float y, float w, float h) {
    this._x0 = x; 
    this._y0 = y;
    this.w = w; 
    this.h = h;
  }

  void draw() {
    updateLogic();
    fill(255);
    rect(_x0, _y0, w-_x0, h-_y0);
  }

  boolean inBoard(float x, float y) {
    return (x>=_x0 && x<=_x0+w &&y>=_y0 && y<=_y0+h);
  }

  void snap(float x, float y, Element e) {
    e.translate(x, y);
  }

  void updateLogic() {
  }
}

//==================== ELEMENT =========================//

class Element {
  float x, y;
  int size;
  PShape p;
  color clr;


  Element() {
  }

  Element(float x, float y, int size) {
    this.x = x; 
    this.y = y;
    this.size = size;
    clr = randomColor(c);
  }

  void draw() {
    fill(clr);
    rect(x, y, size, size);
  }

  boolean inRange(float x1, float y1) {
    return (x<= x1 && x1<=x+size && y1>=y && y1<=y+size);
  }

  void translate(float x1, float y1) {
    PVector p = new PVector(x, y);
    float dx = x1 - (p.x + size/2);
    float dy = y1 - (p.y + size/2);
    p.add(dx, dy);
    x = p.x; 
    y =p.y;
  }
}

//==================== LINKED LIST =========================//
