float a = 0;
Box b;

void setup() {
  size(400,400,P3D);
  b = new Box(0,0,0,200);
  
}

void draw() {
  background(51);
  stroke(255);
  noFill();
  
  translate(width/2,height/2);
  rotateX(a);
  box(200);
  a+= 0.01;
}
