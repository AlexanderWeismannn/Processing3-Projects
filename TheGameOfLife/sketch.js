
//create 2d array structure
function make2DArray(cols,rows){
  let arr = new Array(cols);
  for(let i = 0; i < arr.length; i++){
    arr[i] = new Array(rows);
  }
  return arr; 
}

let grid;
let cols;
let rows;
let resolution = 5;

function setup() {
  createCanvas(600,400);
  cols = width/resolution;
  rows = height/resolution;
  grid = make2DArray(cols,rows);
  //iterate through and place either 0 or 1 in it
  for(let i = 0; i < cols; i++){
    for(let j = 0; j < rows; j++){
      grid[i][j] = floor(random(2))
    }
  }
}

function draw(){
  background(0);
  
  //create the displayed grid
  for(let i = 0; i < cols; i++){
    for(let j = 0; j < rows; j++){
      
      let x = i * resolution;
      let y = j * resolution;
      if(grid[i][j] == 1){
        fill(255);
        stroke(0);
        rect(x,y,resolution-1,resolution-1);
      }
    }
  } 
  
  //compute next generation based on grid
  let next = make2DArray(cols,rows);
  
  //compute next generation based on grid
  for(let i = 0; i < cols; i++){
    for(let j = 0; j < rows; j++){
      
          //count the alive neighbors
          let state = grid[i][j];
          let sum = 0;
          let neighbors = countNeighbors(grid,i,j);

          if(state == 0 && neighbors == 3){
            next[i][j] = 1;
            
          }else if(state == 1 && (neighbors < 2 || neighbors > 3)){
            next[i][j] = 0;  
           
          }else{
            next[i][j] = state;
            
          }     
             
      }
      
    }
  grid = next;
}

//counts the 8 surroundings nodes of the grid position
function countNeighbors(grid,x,y){
  let sum = 0;
  for(i = -1; i < 2; i++){
    for(j = -1; j < 2; j++){
      //BLESS CODING TRAIN FOR BIG BRAIN TAURUS RAP AROUND 
      let col = (x + i + cols) % cols;
      let row = (y + j + rows) % rows;
        sum += grid[col][row];
    }
  }
  sum -= grid[x][y];
  return sum;
}

