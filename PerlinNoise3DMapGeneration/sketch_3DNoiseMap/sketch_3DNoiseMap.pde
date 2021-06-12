int rows, columns;
int scale = 20;//pixels
int w = 1500;
int h = 1500;

float[][] landscape;
float flyingOffset = 0;
 
void setup(){
 size(800,600,P3D); 
 columns = w/scale;
 rows = h/scale;
 landscape = new float[columns][rows];
 
}


void draw(){
  noiseMovement();
  background(0);
  noFill();
  
  
  //draw everything relative to the center of the window
  translate(width/2,height/2);
  rotateX(PI/3);
  
  //move the drawing back to the center
  translate(-w/2,-h/2);
  
  for(int y = 0; y < rows-1; y++ ){
    //create the strip of triangles one row at a time
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < columns; x++){
      selectColor(landscape[x][y]);
      vertex(x*scale,y*scale,landscape[x][y]);
      vertex(x*scale,(y+1) * scale,landscape[x][y+1]);
    }
    endShape();
  }
  
}

void noiseMovement(){
  
  
  
 flyingOffset -= 0.1;
 float yoff = flyingOffset;
 for(int y = 0; y < rows; y++ ){
   float xoff = 0;
    for(int x = 0; x < columns; x++){
      landscape[x][y] = map(noise(xoff,yoff),0,1,-150,150);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
}


void selectColor(float arrayVal){
  
  if(arrayVal > 50){
    fill(175,167,250);
  }else if(arrayVal > 20){
    fill(255,229,204);
  }else if(arrayVal > 1){
    fill(195,126,23);
  }else{
    fill(33,20,145);
  }
  
}
