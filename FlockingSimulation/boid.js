class Boid {
  
  constructor(){
    this.pos = createVector(random(width),random(height));
    this.vel = p5.Vector.random2D();
    this.vel.setMag(random(2,4));
    this.acc = createVector();
    this.maxF = 1;
    this.maxSpeed = 4;
    
  }
  
  edges(){
    //x out of bounds
    if(this.pos.x > width){
      this.pos.x = 0;
    }else if(this.pos.x < 0){
      this.pos.x = width;       
    }
    
    //y out of bounds
    if(this.pos.y > height){
      this.pos.y = 0;
    }else if(this.pos.y < 0){
      this.pos.y = height;       
    }
  }
  
  
  
  align(boids){
    
    let perceptRad = 50;
    let steering = createVector();
    let total = 0;
    //check for other boids withing the Perception Radius
    for(let other of boids){
      let d = dist(this.pos.x,this.pos.y,other.pos.x,other.pos.y);
      if(other != this && d < perceptRad){
        steering.add(other.vel);
        total++;
      } 
    }
    
    //if there exists other boids within the radius get the avg vel
    if(total > 0){
      steering.div(total);
      steering.setMag(this.maxSpeed);
      steering.sub(this.vel);
      steering.limit(this.maxF);
    }
    return steering;
  }
  
  cohesion(boids){
    
    let perceptRad = 100;
    let steering = createVector();
    let total = 0;
    //check for other boids withing the Perception Radius
    for(let other of boids){
      let d = dist(this.pos.x,this.pos.y,other.pos.x,other.pos.y);
      if(other != this && d < perceptRad){
        steering.add(other.pos);
        total++;
      }
      
    }
    //if there exists other boids within the radius get the avg vel
    if(total > 0){
      steering.div(total);
      steering.sub(this.pos)
      steering.setMag(this.maxSpeed);
      steering.sub(this.vel);
      steering.limit(this.maxF);
    }
    return steering;
  }
  
  separation(boids){
    
    let perceptRad = 20;
    let steering = createVector();
    let total = 0;
    //check for other boids withing the Perception Radius
    for(let other of boids){
      let d = dist(this.pos.x,this.pos.y,other.pos.x,other.pos.y);
      if(other != this && d < perceptRad){
        let diff = p5.Vector.sub(this.pos,other.pos);
        diff.div(d);
        steering.add(diff);
        total++;
      }
      
    }
    //if there exists other boids within the radius get the avg vel
    if(total > 0){
      steering.div(total);
      steering.setMag(this.maxSpeed);
      steering.sub(this.vel);
      steering.limit(this.maxF);
    }
    return steering;
  }
  
  
  flock(boids){
    let alignment = this.align(boids);
    let cohesion = this.cohesion(boids);
    let separation = this.separation(boids);
    
    alignment.mult(separationSlider.value());
    cohesion.mult(separationSlider.value());
    separation.mult(separationSlider.value());
    
    this.acc.add(alignment);
    this.acc.add(cohesion);
    this.acc.add(separation);
  }
  
  update(){
    this.pos.add(this.vel);
    this.vel.add(this.acc)
    this.vel.limit(this.maxSpeed);
    this.acc.mult(0);
  }
  
  show(){
    strokeWeight(8);
    stroke(255);
    point(this.pos.x,this.pos.y);
  }
  
  
}


