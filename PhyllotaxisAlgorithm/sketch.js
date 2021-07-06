var n = 0;
var c = 2;

function setup() {
  createCanvas(800, 800);
  angleMode(DEGREES);
  colorMode(HSB);
  background(0);
}

function draw() {
  
  var a = n * 137.5;
  var r = c * sqrt(n);
  
  var x = r * cos(a) + width/2;
  var y = r * sin(a) + height/2;
  
  fill(a%256,255,255);
  ellipse(x,y,4,4);
  noStroke();
  
  
  n++;
}