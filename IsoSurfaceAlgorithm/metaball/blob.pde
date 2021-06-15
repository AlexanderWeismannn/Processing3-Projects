class blob{
  PVector pos;
  float r;
  PVector vel;
  
  blob(float x, float y){
    pos = new PVector(x,y);
    r = random(100,300);
    vel = PVector.random2D();
    vel.mult(random(2,5));
  }
  
  void velUpdate(){
   pos.add(vel); 
   
   if(pos.x >= width || pos.x <= 0){
     vel.x *= -1;
   }
   
   if(pos.y >= height || pos.y <= 0){
     vel.y *= -1;
   }
   
     
  }
  
  void show(){
    noFill();
    stroke(0);
    strokeWeight(3);
    ellipse(pos.x,pos.y,r*2,r*2);
  }
  
}
