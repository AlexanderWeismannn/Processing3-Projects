class RainDrop{
  
  float x = random(0,width);
  float y = random(-600,-100);
  float closeness = random(0,20);//spoof the paralax effect where objects closer fall faster & further fall slower
  float dropLength = map(closeness,0,20,5,20);//longer if its close, shorter if its further away
  float ySpeed = map(dropLength,5,20,1,9);
  
  
  void fall(){
    y += ySpeed;
    float grav = map(closeness,0,20,0,0.2);
    ySpeed += grav;
    //reset the rain drop
    if(y > height){
      y = random(-600,-100);
      ySpeed = map(dropLength,5,20,1,9);
      float randColor = map(ySpeed,1,9,0,255);
      stroke(randColor);
    }
    
  }
  
  void show(){
    float strokeThickness = map(closeness,0,20,1,2);
    strokeWeight(strokeThickness);
 
    line(x,y,x,y+dropLength);
    
  }
  
  
  
  
  
}
