
RainDrop[] drops = new RainDrop[2000];

void setup(){
  size(1900,1000);
  //create array of drops
  for(int i = 0; i < drops.length; i++){
    drops[i] = new RainDrop();
  }
}

void draw(){
  background(30);
  //loop through and have them all fall and show
  for(int i = 0; i < drops.length; i++){
    drops[i].fall();
    drops[i].show();
  }
  
}
