class Box {
 PVector pos;
 float r;
 
 Box(float x,float y,float z){
   pos = new PVector(x,y,z);
   r = r;
 }
 
 void show(){
  pushMatrix();
  translate(pos.x,pos.y,pos.z);
  box(r);
  popMatrix();
 }
  
}
