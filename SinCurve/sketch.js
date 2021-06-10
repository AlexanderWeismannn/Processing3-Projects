//Inspired by the coding train and bees and bombs 
let angle = 0;
let w = 24;
let yAngle;
let maxD;


function setup(){
  createCanvas(400,400,WEBGL);
  yAngle = atan(1/sqrt(2));
  maxD = dist(0,0,200,200);
}

function draw(){

    
  background(250,128,114);
  ortho(-200,400,-500,500,-100,400);
  
  rotateX(-QUARTER_PI);
  rotateY(yAngle);

  for(let z = 0; z < height; z += w){
    for(let x = 0; x < width; x += w){ 
    push();
    //create the osolation using the sin wave
    let d = dist(x,z,width/2,height/2);
    let offset = map(d,0,maxD, -PI, PI);   
    let a = angle + offset;
    let h = floor(map(sin(a), -1,1,10,300));
    translate(x-width/2,0,z);
    fill(240,148,77);
    
    box(w-2,h,w);
    
    
    pop();
    }
  }
  
  
  
  angle -= 0.05;
    

}