// wrote this to generate a banner for my website to avoid
// infringing copyright


color[] colours;

//final int WIDTH = 2560;
//final int HEIGHT = 1440;
final int WIDTH = 1920;
final int HEIGHT = 360;

void setup() {
    //size(1024, 768);
    
    palette();
    //darkPalette();
    
    draw();
    exit();
}

void draw() {
  drawPixels(1);
  drawScale(2);
  drawRectangles();
  drawQuads();
}

void palette() {
      
    // must be odd or shit looks weird idk maths reyt?
    colours = new color[5];
    //colours[0] = color(255, 255, 255); // white
    colours[0] = color(0, 0, 0); // black
    colours[1] = color(0, 0, 80); // navy
    colours[2] = color(80, 80, 80); // grey
    colours[3] = color(255, 0, 0); // red
    colours[4] = color(57, 201, 187); // turqoise
    //colours[5] = color(255, 255, 255); // white
}

void darkPalette() {
    colours = new color[3];
    colours[0] = color(0, 0, 0); // black
    colours[1] = color(0, 0, 80); // navy
    colours[2] = color(80, 80, 80); // grey
}

void drawQuads() {

  PGraphics canvas = createGraphics(WIDTH, HEIGHT);
  
  int skew = 2;
  int columnWidth =  WIDTH / colours.length / skew;
  
  canvas.beginDraw();
  canvas.noStroke();
    
  for(int x = 0; x <= colours.length * skew; x++) {
      canvas.fill(colours[x % colours.length]);
      canvas.quad(
        (x * columnWidth), 
        0,   
        (x * columnWidth) + columnWidth + 1, 
        0,
        (x * columnWidth), 
        HEIGHT,
        ((x * columnWidth) - columnWidth) - 1, 
        HEIGHT); // top left, top right, bottom right, bottom left (clockwise!)
  }
  
  canvas.endDraw();
  canvas.save("banner_quads.png");
}

void drawRectangles() {

    int columnWidth = WIDTH/colours.length;
  
    PGraphics canvas = createGraphics(WIDTH, HEIGHT);
    
    canvas.beginDraw();
    canvas.noStroke();

    for(int c = 0; c < colours.length;) {
        canvas.fill(colours[c]);
        canvas.rect(c*(columnWidth), 0, (++c*(columnWidth)), HEIGHT);
    }
    
    canvas.endDraw();
    canvas.save("banner_rectangles.png");
}

void drawPixels(int offset) {

  PGraphics canvas = createGraphics(WIDTH, HEIGHT);
  
  canvas.beginDraw();
  canvas.noStroke();

  for(int x = 0; x < WIDTH; x+=offset) {
    for(int y = 0; y < HEIGHT; y+=offset) {
      canvas.set(x, y, colours[simcityFxy(x,y) % colours.length]); 
    }
  }
  
  canvas.endDraw();
  canvas.save("banner_pixels.png");
}

void drawScale(int scale) {

  PGraphics canvas = createGraphics(WIDTH, HEIGHT);
  
  canvas.beginDraw();
  canvas.noStroke();

  for(int x = 0; x < WIDTH; x+=scale) {
    System.out.println(x + " of " + WIDTH);
    for(int y = 0; y < HEIGHT; y+=scale) {

      canvas.fill(colours[simcityFxy(x,y) % colours.length]);
      canvas.rect(x, y, x + scale, y + scale);
    }
  }
  
  canvas.endDraw();
  canvas.save(String.format("banner_scale%dx.png", scale));
}

int fxy(int x, int y) {
  return (x*y*x^2);
}

int jumpManFxy(int x, int y) {
  return (x * x+1+y);
}

int simcityFxy(int x, int y) {
  return (x^2*y^3);
}

int gridFxy(int x, int y, int mod) {
  return ((x & mod)^2)*((y & mod)^3);
}

int simcityGlitchFxy(int x, int y) {
  return ceil(sqrt(x^2*y^3));
}

int glitchSimcityGlitchFxy(int x, int y) {
  return ceil(sqrt(x^2*y^3)) ^ x*2;
}

int carpetFxy(int x, int y) {

  return(x^y);
}

// ugly
int uglyFxy(int x, int y) {

  return (x^2*y^3*x);
}

int polyFxy(int x, int y) {
  return floor(sqrt(x*y));
}
