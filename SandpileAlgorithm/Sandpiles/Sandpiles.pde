int[][] sandpile;



void setup(){
  size(800,800);
  sandpile = new int[width][height];
  //where the sand is dropped
  sandpile[width/2][height/2] = 1000000;
}

void topple(){
  int[][] nextPiles = new int[width][height];
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      int num = sandpile[x][y];
      //copy over the piles that dont need to be toppled
      if(num < 4){
        nextPiles[x][y] = sandpile[x][y];
      }
    }
  }
  
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      int num = sandpile[x][y];
      if(num >= 4){
        //remove sand from the piles that have too much and redistibute to its neighbors
        nextPiles[x][y] += (num-4);
        if(x+1 < width){
          nextPiles[x+1][y]++;
        }
        if(x-1 >= 0){
          nextPiles[x-1][y]++;
        }
        if(y+1 < height){
          nextPiles[x][y+1]++;
        }
        if(y-1 >= 0){
           nextPiles[x][y-1]++;
        }
      }  
    }
  }
  sandpile = nextPiles;
}

void draw(){
  //frameRate(24);
  render();
  //call the topple function multiple times per frame
  for(int i = 0; i < 100; i++){
    topple();
  }
  
  
}

void render(){
  loadPixels();
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      //loop though the entire array
      color col;
      int num = sandpile[x][y];
      //color scheme
        switch(num) {
          case 0:
            col = color(2,81,209);
            break;
          case 1:
            col = color(140,180,245);
            break;
          case 2:
            col = color(245,225,44);
            break;
          case 3:
            col = color(94,23,18);
            break;
          default:
            // do nothing
            col = color(255);
        }
      pixels[x+y*width] = col;
    }
  }
  
  updatePixels();
  
}
