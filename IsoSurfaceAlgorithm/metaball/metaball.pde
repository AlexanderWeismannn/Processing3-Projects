
blob[] blobs = new blob[10];

void setup(){
  size(640,360);
  colorMode(HSB);
  
  for(int i = 0; i < blobs.length; i++){
    blobs[i] = new blob(random(width), random(height));
  }
}

void draw(){
  background(51);
  loadPixels();
  
  //loops through each individual pixel
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      int index = x + y * width;
      float sum = 0;
      
      //get the dist from the meta ball not the middle of the screen
      for(blob b: blobs){
         float distance = dist(x,y,b.pos.x,b.pos.y);
         sum += 18 * b.r/distance; 
      }
     
      pixels[index] = color(sum,255,255);
      
    }
  }
  updatePixels();
  for(blob b: blobs){
     //b.show();
     b.velUpdate();
  }
 
}
