let x = 0;
let y = 0;
let spacing = 10;

function setup() {
  createCanvas(400,400);
  background(0);
  colorMode(HSB);
}

function draw() {
  let color = map(x,0,width,1,255);
  stroke(color,100,255);
  strokeWeight(3);
  //50/50 on forward or backslash
  if(random(1) < 0.5){
     line(x,y,x+spacing,y+spacing);//forward slash
  }else{
     line(x,y+spacing,x+spacing,y);//backward slash
  }
  
  x+= spacing
  if(x >= width){
    x = 0;
    y+=spacing;
  }
  
  if(y >= height){
    background(0);
    x = 0;
    y = 0;
  }
  
  
}