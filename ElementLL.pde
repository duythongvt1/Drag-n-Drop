class ElementLL {
  Node last;

  ElementLL() {
    last = null;
  }

  void draw() {
    Node curr = last;
    if (curr != null) {
      curr.item.draw();
      curr = curr.next;
    }
    while (curr != last && curr != null) {
      curr.item.draw();
      curr = curr.next;
    }
  }

  void addElement(Element e) {
    if (last == null) {
      last = new Node(e, null);
      last.next = last;
    } else {
      last.next = new Node(e, last.next);
      last = last.next;
    }
  }


  Node deleteElement(Element e) {
    Node curr = last;
    if (last != null) {
      if (curr == curr.next) last = null;
      else {
        do {
          if (curr.next.item==e) {
            if (curr.next == last) last = curr.next.next;
            curr.next = curr.next.next;
          }
          curr = curr.next;
        } while (curr!=last);
      }
    }

    return curr;
  }



  void reorder(Element e) {
    deleteElement(e);
    addElement(e);
  }

  Node findElement(Element e) {
    Node curr = last;
    Node result = null;
    if (last != null) {
      do {
        if (curr.item==e) result = curr;
        curr = curr.next;
      } while (curr!=last && result==null);
    }
    return result;
  }
}

class Node {
  Element item;
  Node next;

  Node(Element item, Node next) {
    this.item = item;
    this.next = next;
  }
}
