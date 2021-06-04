

//2d array that essentially stores every square in the matrix
float[][] field;
//distance between vertices
//IF YOU GO BELOW 3 YOUR COMPUTER MIGHT CABOOOM! //
int res = 7;
int rows, columns;
float increment = 0.1;
float zoff = 0;
int totalTime = 2500;
int savedTime;
 color prevColor = color(0);

//Create an instance of the OpenSimplexNoise class
OpenSimplexNoise noise;

//color defining to save my mind
//color blue = color(0,0,255);


void setup(){
  fullScreen(P2D);
  noise = new OpenSimplexNoise();
  //changes based on screen resolution
  //need the +1 to make sure there are enough points to form squares
  rows = 1+height/res;
  columns = 1+width/res;
  field = new float[columns][rows];
  savedTime = millis();
   
}

//overload the line drawing class
void line(PVector v1, PVector v2){
  line(v1.x,v1.y,v2.x,v2.y);
}

void draw(){
  //background(blue);
  float xoff = 0;
  //fill up the array with a noise value
  for(int i = 0; i < columns; i++){
    xoff+=increment;
    float yoff = 0;
    for(int j = 0; j < rows; j++){
      //will return 0 or 1 since its the floor of the value and exclusive to 2
      field[i][j] = (float)(noise.eval(xoff,yoff,zoff));
      yoff+=increment;
    }
  }
  zoff += 0.03;
  
  //visualize this array w/ points
  for(int i = 0; i < columns; i++){
    for(int j = 0; j < rows; j++){
      //choose the color and display it accordingly
      fill(field[i][j] * 255);
      //strokeWeight(res * 0.4);
      noStroke();
      //point(i*res,j*res);
      rect(i*res,j*res,res,res);
    }
  }
  
  //figure out how to draw the isolines
  //has to be -1 for the cols amd rows since those points have no neigbors to examine
  for(int i = 0; i < columns-1; i++){
    for(int j = 0; j < rows-1; j++){
                                
      //length of each square's side
      float x = i * res;
      float y = j * res;
      
      //gets the midpoints of the lines between our vectors of each square
      //refer to the diagram posted for more info
      PVector a = new PVector(x + res/2, y);
      //midpoint of a midpoint
      PVector aNeg = new PVector(x + res/4,y);
      PVector aPos = new PVector(x + res/2 + res/4, 7);
      
      PVector b = new PVector(x + res, y + res/2);
      PVector bNeg = new PVector(x + res, y + res/4);
      PVector bPos = new PVector(x + res, y + res/2 + res/4);
      
      PVector c = new PVector(x + res/2, y + res);
      PVector cNeg = new PVector(x + res/4, y + res);
      PVector cPos = new PVector(x + res/2 + res/4, y + res);
      
      PVector d = new PVector(x, y + res/2);
      PVector dNeg = new PVector(x, y + res/4);
      PVector dPos = new PVector(x, y + res/2 + res/4);
      
      //gets the 0 or 1 value of each point in the square and returns it as an integer to be processed
      int squareState = getState(ceil(field[i][j]),
                                 ceil(field[i+1][j]),
                                 ceil(field[i+1][j+1]),
                                 ceil(field[i][j+1]));
                                 
      findState(squareState, a,b,c,d);                           

      
     
    }
  }
}

//binary to base 10 converter, theres probably some other way to do this with built in java stuff
int getState(int a, int b, int c, int d){
  return a*8 + b*4 + c*2 + d*1;
}

void findState(int state, PVector a,  PVector b,  PVector c,  PVector d){
  
  
  int passedTime = millis() - savedTime;
  
  if(passedTime > totalTime){
   color randomColor = color(random(0,255),random(0,255),random(0,255));
   stroke(randomColor);
   prevColor = randomColor;
   savedTime = millis();
  }else{
   stroke(prevColor); 
  }
  
  
  strokeWeight(1);
  
  
  switch (state) {
        case 0:
          //doesnt draw anything but keep it incase it should be used to do something
          break;
        case 1:
          line(c,d);
          break;
        case 2:
        line(b,c);
          break;
        case 3:
          line(b,d);
          break;
        case 4:
          line(a,b);
          break;
        case 5:
          line(a,d);
          line(b,c);
          break;
        case 6:
          line(a,c);
          break;
        case 7:
          line(a,d);
          break;
        case 8:
          line(a,d);
          break;
        case 9:
          line(a,c);
          break;
        case 10:
          line(a,b);
          line(c,d);
          break;
        case 11:
          line(a,b);
          break;
        case 12:
          line(b,d);
          break;
        case 13:
          line(b,c);
          break;
        case 14:
          line(c,d);
          break;
        case 15:
          //another case with nothing to draw
          break;
          
        default:
        System.out.println("Something fwent horribly wrong");
         break;
      }
  
}
