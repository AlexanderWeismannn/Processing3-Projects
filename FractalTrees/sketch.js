var rotationAngle = 0;
var slider;

function setup() {
  createCanvas(900, 900);
  slider = createSlider(0,TWO_PI, PI/4,0.01);
}

function draw() {
  background(50);
  rotationAngle = slider.value();
  
  translate(450,height);
  branch(100);
}

function branch(len){
  stroke(random(0,255),random(0,255),random(0,255));
  line(0, 0, 0,-len);
  translate(0,-len);
  if(len > 4){
    
    
    //branch right far
    push();
    rotate(rotationAngle * 0.5);
    branch(len*2/3);
    pop();
    
   
    //branch left far
    push();
    rotate(-rotationAngle * 0.5);
    branch(len*2/3);
    pop();
   
  }
  
  
  
}