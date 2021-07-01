float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 8/3;

float rot = 0;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
  size(800,600,P3D); 
  colorMode(HSB);
}

void draw(){
  background(0);
    
  float dt = 0.01;
  float dx = (a * (y - x)) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = (x * y - c * z) * dt;
  x += dx;
  y += dy;
  z += dz;
  
  //add each new vector to the arraylist
  points.add(new PVector(x,y,z));
  
  translate(width/2,height/2);
  scale(3);
  stroke(255);
  noFill();
  rot += 0.005;
  rotateX(rot);
  rotateY(rot);
  rotateZ(rot);
 
  
  float hue = 0;
  beginShape();
  for(PVector v: points){
    stroke(hue,255,255);
    vertex(v.x,v.y,v.z);
    hue += 0.5;
    if(hue >= 255){
      hue = 0;
    }
  }
  endShape();
  
  
  
}
