void setup() {
  size(400, 400);
  background(255);
}

float t = 0;

void draw() {
  t += 0.01;
  float x = t * 100;
  float y = noise(t) * 100;
  while(x > width) {
    x -= width;
  }
  stroke(0);
  println(x);
  println(y);
  point(x, y);
}
