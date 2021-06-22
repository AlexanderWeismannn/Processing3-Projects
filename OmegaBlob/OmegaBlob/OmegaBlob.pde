

float yoff = 0.0;

void setup() {
  size(400, 400);
  colorMode(HSB);
}

void draw() {
  background(0);

  translate(width / 2, height / 2);

  float radius = 150;
  
 
  
  
  beginShape();
  float x2off = 0;
  for (float a = 0; a < TWO_PI; a += 0.009) {
    float offset = map(noise(x2off + yoff, yoff), 0, 1, -25, 25);
    float r = radius + offset;
    float x = r * cos(a);
    float y = r * sin(a);
    vertex(x, y);
    x2off += 0.1;
    color randomizer = int(map(offset,-25,25,20,255));
    fill(0,randomizer,200);
    
  }
  endShape();

  beginShape();
  float xoff = 0;
  for (float a = 0; a < TWO_PI; a += 0.005) {
    float offset = map(noise(xoff + yoff, yoff), 0, 1, -50, 10);
    float r = radius + offset;
    float x = r * cos(a);
    float y = r * sin(a);
    vertex(x, y);
    xoff += 0.1;
    color randomizer = int(map(offset,-25,25,20,255));
    fill(15,randomizer,200);
    
  }
  endShape();
  
  beginShape();
  float x3off = 0;
  for (float a = 0; a < TWO_PI; a += 0.004) {
    float offset = map(noise(x3off + yoff, yoff), 0, 1, -75, 0);
    float r = radius + offset;
    float x = r * cos(a);
    float y = r * sin(a);
    vertex(x, y);
    x3off += 0.1;
    color randomizer = int(map(offset,-25,25,20,255));
    fill(0,randomizer,200);
    
  }
  endShape();
  
  beginShape();
  float x4off = 0;
  for (float a = 0; a < TWO_PI; a += 0.003) {
    float offset = map(noise(x4off + yoff, yoff), 0, 1, -100, -20);
    float r = radius + offset;
    float x = r * cos(a);
    float y = r * sin(a);
    vertex(x, y);
    x4off += 0.1;
    color randomizer = int(map(offset,-25,25,20,255));
    fill(0,randomizer,200);
    
  }
  endShape();
  
 

  yoff += 0.04;
}
