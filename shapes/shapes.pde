final int WIDTH = 1024;
final int HEIGHT = 768;

PImage canvas;
color[] colours;

void setup() {
  size(1024, 768);
  canvas = createGraphics(WIDTH, HEIGHT);
  
  darkPalette();
  
  //canvas.beginDraw();
  //canvas.fill(colours[1]);
  fill(colours[1]);
  triangle(0,0,4,4,4,0);
  //canvas.endDraw();
}

void darkPalette() {
    colours = new color[3];
    colours[0] = color(0, 0, 0); // black
    colours[1] = color(0, 0, 80); // navy
    colours[2] = color(80, 80, 80); // grey
}
