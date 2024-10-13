function make2DArray(cols,rows){
  let arr = new Array(cols);
  for(let i = 0; i < arr.length; i++){
    arr[i] = new Array(rows);
    for(let j = 0; j < arr[i].length; j++){
      arr[i][j] = 0;
    }
  }
  return arr
}



function mouseDragged(){
  let mouseCol = floor(mouseX / w);
  let mouseRow = floor(mouseY / w);

  let dropMatrix = 4;

  let ext = floor(dropMatrix/2);
  for(let i = -ext; i <= ext; i++){
    for(let j = -ext; j <= ext; j++){
      if(random(1) < 0.5){
        let col = mouseCol + i;
        let row = mouseRow + j;
        if(col >= 0 && col <= cols-1 && row >= 0 && row <= rows-1){
          grid[col][row] = hueValue;
        }
      }
    }
  }

  if(mouseButton == LEFT){ 
    if(hueValue === 0){
      hueValue = 200;
    } 
    if(random(1) < 0.1){
      hueValue -= 0.5
    }else{
      hueValue += 0.1
    }
    if(hueValue >= 360){
      hueValue = 200
    }
  }else if (mouseButton == CENTER){
    hueValue = 0
  }
 


}

let grid;
let w = 8;
let cols, rows;
let hueValue = 200;



function setup() {
  createCanvas(600, 800);
  colorMode(HSB,360,255,255);

  cols = width/w;
  rows = height/w;
  grid = make2DArray(cols,rows);

  //set every grid value to be 0 by default
  for(let i = 0; i < cols; i++){
    for(let j = 0; j < rows; j++){
      grid[i][j] = 0;
    }
  }
}

function draw() {
  background(0);
  
  for(let i = 0; i < cols; i++){
    for(let j = 0; j < rows; j++){
      noStroke();
      if(grid[i][j] > 0){
        fill(grid[i][j],grid[i][j]+10,grid[i][j]+10);
        x = i * w;
        y = j * w;
        square(x,y,w)
      }
    }
  }

  //next frame
  let nextGrid = make2DArray(cols,rows);
  for(let i = 0; i < cols; i++){
    for(let j = 0; j < rows; j++){
      let state = grid[i][j];
      if(state > 1){
        let below = grid[i][j+1]

        //create random falling state
        let dir = random([-1,1]);

        // boundry checking for left and right side
        let belowR,belowL;
        if(i+dir >= 0 && i + dir <= cols - 1){
          belowR = grid[i+dir][j+1]
        }
        if(i - dir >= 0 && i - dir <= cols - 1){
          belowL = grid[i-dir][j+1]  
        }

        
        if(below === 0){
          nextGrid[i][j+1] = grid[i][j];
        }else if(belowR === 0){
          nextGrid[i+dir][j+1] = grid[i][j];          
        }else if(belowL === 0){
          nextGrid[i-dir][j+1] = grid[i][j]
        }else{
          nextGrid[i][j] = grid[i][j]
        }
      }

    }
  }
  grid = nextGrid;
}