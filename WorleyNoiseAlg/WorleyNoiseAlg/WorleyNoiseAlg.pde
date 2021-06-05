/*
Worley Noise Algorithm:

Inspired by TheCodingTrain

Initially a 2d Worley Noise generator, turned into 3d
by faking a z axis and cycling through it

*/

PVector[] pointArray = new PVector[20];

void setup(){
  size(450,450);
  //fullScreen(P2D);
  
  //randomly assign positions for the Vectors
  for(int i = 0; i < pointArray.length; i++){
    pointArray[i] = new PVector(random(width-1),random(height-1), random(width-1));
  }
  
  
}


void draw(){
  loadPixels();
  //loop through every pixel in our screen
  for(int x = 0; x < width; x++){
     for(int y = 0; y < height; y++){
       //gives the index of the pixel we want to color
     
         float[] distances = new float[pointArray.length];
         for(int i = 0; i < pointArray.length; i++){
           //calculates the distance from our x,y pixel and the point
           PVector v = pointArray[i];
           float z = (frameCount*2)%width;
          float d = dist(x,y,z,v.x, v.y,v.z); 
          distances[i] = d;
         }
         
         //change to get different noise shape results
         int n = 0;
         float[] sorted = sort(distances);
         float r = map(sorted[n],0,width,0,255);
         float g = map(sorted[n],0,width/4,40,0);
         float b = map(sorted[n],0,width/2,10,200);
         int index = x + y * width;
         pixels[index] = color(r,g,b);
     }
  }
  updatePixels();
  
 
  //for(PVector v : pointArray){
  //   stroke(0,255,0);
  //   strokeWeight(8);
  //   point(v.x,v.y);
    
  //}
  
  
}
