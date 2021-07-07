
/**
Initial Formulas taken from: http://paulbourke.net/geometry/knots/

x = r * cos(phi) * cos(theta)
y = r * cos(phi) * sin(theta)
z = r * sin(phi)

r(beta) = 0.8 + 1.6 * sin(6 * beta)
theta(beta) = 2 * beta
phi(beta) = 0.6 * pi * sin(12 * beta)
**/

float angle = 0;
float beta = 0;
ArrayList<PVector> vectors = new ArrayList<PVector>();

void setup(){
  size(800,600,P3D);
  
  
}

void draw(){
 
  background(0);
  translate(width/2,height/2);
  rotateY(angle);
  rotateX(angle);
  angle += 0.005;
  
  
  
     
     float r = 80 * (0.8 + 1.6 * sin(6 * beta));
     float theta = 5 * beta;
     float phi = 0.6 * PI * sin(12 * beta);
     
     float x = r * cos(phi) * cos(theta);
     float y = r * cos(phi) * sin(theta);
     float z = r * sin(phi);
     
     
     vectors.add(new PVector(x,y,z));
     
     beta += 0.005;
     noFill();
     strokeWeight(8);
     
     beginShape();
     for(PVector v: vectors){
       float dist = v.mag();
       stroke(dist,dist,255);
       vertex(v.x,v.y,v.z);
     }
     endShape();
  
}
