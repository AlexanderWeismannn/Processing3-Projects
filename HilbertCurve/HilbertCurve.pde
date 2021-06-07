/*
Pseudo Hilbert Curve
*/

//which order of magnitutde we are drawing the hilbert curve
int order = 6;
//number of curves
int N = int(pow(2,order));
//number of total points
int totalPoints = N*N;

//create an array the size of all points
PVector[] path = new PVector[totalPoints];


void setup(){
  
  //for my setup the screen size needs to be square 
  size(1024,1024);
  colorMode(HSB,360,255,255);
  background(0);
  
  for(int i = 0; i < totalPoints; i++){
    path[i] = hilbert(i);
    //have the lines adjust to the size of the processing window
    float len = width/N;
    path[i].mult(len);
    //offset from the 0,0 point in the top left
    path[i].add(len/2,len/2);
  }
}

//return a specific point on the pseudo hilbert curve corresponding to i
PVector hilbert(int i){
  PVector[]points = {
   new PVector(0,0),
   new PVector(0,1),
   new PVector(1,1),
   new PVector(1,0)   
  };
  
  
  //bitmasking to extract the (0011) last two bits which correspond to
  //each quadrant that the hilbert curve will reside in (00,01,10,11) 
  
  
  int index = i & 3;
  PVector v = points[index];
  
  
  for(int j = 1; j < order; j++){
    //shift the bits over by 2
    i = i >>> 2;
    index = i & 3;
    float len = pow(2,j);
    
    //check which quadrant it belongs in
    if(index == 0){
      //flip
      float temp = v.x;
      v.x = v.y;
      v.y = temp;
    }else if(index == 1){
      //move it down
      v.y += len;
    }else if (index == 2){
      //down and to the right
      v.x+=len;
      v.y+=len;
    }else if(index == 3){
      //to the right
      float temp = len - 1 - v.x;
      v.x = len - 1 - v.y;
      v.y = temp;
      v.x+=len;
    }
  
  }
  return v; 
}

int counter = 0;
void draw(){
  
  //set and create first order Hilbert Curve
  stroke(255);
  strokeWeight(2);
  noFill();
  beginShape();
  for(int i = 1; i < counter;i++){
    float h = map(i,0,path.length,0,360);
    stroke(h,255,255);
    line(path[i].x,path[i].y,path[i-1].x,path[i-1].y);
  }
  //endShape();
  
  counter+=1;
  if(counter >= path.length){
    counter = 0;
  }
  
  
  //draw points for better visualization
  //strokeWeight(4);
  //for(int i = 0; i < path.length;i++){
  //  point(path[i].x,path[i].y);
  //  text(i,path[i].x + 5,path[i].y -5);
    
  //}
  
  
  
  
  
  
  
}
