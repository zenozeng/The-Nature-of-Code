class Walker {
  int x, y;

  Walker() {
    x = width / 2;
    y = height / 2;
  }

  void step() {
    int choice = int(random(4));
    if (choice == 0) {
      x++;
    } else if (choice == 1) {
      x--;
    } else if (choice == 2) {
      y++;
    } else {
      y--;
    }
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }

  void render() {
    stroke(random(255), random(255), random(255));
    point(x, y);
  }
}

Walker wlaker;

void setup() {
  size(400, 400);
  walker = new Walker();
  background(0, 0, 0);
}

void draw() {
  walker.step();
  walker.render();
}
