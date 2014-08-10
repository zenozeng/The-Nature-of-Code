// Based on https://github.com/shiffman/The-Nature-of-Code-Examples/blob/master/introduction/Exercise_I_10_NoiseLandscape/Exercise_I_10_NoiseLandscape.pde (LGPL)

Landscape land;
void setup() {
  // 坐标轴模型可以看这儿：https://www.processing.org/tutorials/p3d/
  size(400, 400, P3D); 
  land = new Landscape(400, 400, 20, 20);
}

float theta = 0.0;

void draw() {
  background(255, 255, 255); // 不放在 setup 里是为了冲掉渲染出来的黑边
  pushMatrix();
  translate(width/2, height/2, -160);
  rotateX(PI/3); // 把布水平摊
  rotateZ(theta);
  land.render();
  popMatrix();
  land.calculate();
  theta += 0.002; // 绕 z 轴旋转的控制
}
