// Based on https://github.com/shiffman/The-Nature-of-Code-Examples/blob/master/introduction/Exercise_I_10_NoiseLandscape/Landscape.pde (LGPL)

class Landscape {
  int w, h; // width and height of thingie
  int rows, cols; // number of rows and columns
  float zoff = 0.0; // perlin noise argument
  float[][] z; // using an array to store all the height values

  Landscape(int w_, int h_, int rows_, int cols_) {
    w = w_;
    h = h_;
    cols = rows_;
    rows = cols_;
    z = new float[cols][rows];
  }

  void calculate() {
    zoff += 0.05; // 注意这个变量的作用域哦
    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        z[i][j] = map(noise(i / cols, j / rows, zoff), 0, 1, -120, 120);
      }
    }
  }

  void render() {

    // 注意这里要减1，因为最后一行没有下一行
    for (int x = 0; x < cols - 1; x++) { 
      for (int y = 0; y < rows - 1; y++) {

        stroke(100);
        fill(255);

        pushMatrix();
        beginShape(QUADS); // https://processing.org/reference/quad_.html

        // 四个定位点
        vertex(0, 0, z[x][y]);
        vertex(w/cols, 0, z[x+1][y]);
        vertex(w/cols, h/rows, z[x+1][y+1]);
        vertex(0, h/rows, z[x][y+1]);

        // 移动到目标位置
        translate(x*(w/cols) - w/2, y*(h/rows) - h/2, 0);

        endShape();
        popMatrix();
      }
    }
  }
}
