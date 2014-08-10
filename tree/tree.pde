void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  background(255);
  strokeWeight(2);
  drawTree(width / 2, height, height / 4, PI / 2);
}

int count = 0;

float min_length = width / 50;

void drawTree(float x, float y, float length, float angle) {
  float x2 = x - length * cos(angle);
  float y2 = y - length * sin(angle);

  if(length > min_length * 2) {
    stroke(222, 185, 135); // 树干
  } else {
    stroke(167, 202, 165); // 树叶
  }

  line(x, y, x2, y2);
  length /= 1.414; // 黄金分割

  count++;
  if(length > min_length) {
    // right
    drawTree(x2, y2, length, angle + PI / 4);
    // left
    drawTree(x2, y2, length, angle - PI / 4);
  }
}
