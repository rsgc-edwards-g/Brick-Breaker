class Mover {
  
  // Declare properties of the class here
  // They are in-scope (accessible) to all methods below
  RVector location;
  RVector velocity;
  RVector acceleration;
  
  // Constructor – use this to initialize a Mover instance
  Mover() {
    
    // Movers appear in centre of window and have zero velocity at first
    location = new RVector( random(width), random(height) );
    velocity = new RVector(0, 0);  // object at rest when instantiated
  }
  
  // Behaviour
  // Add additional methods to implement Mover object behaviour below.
  
  // update position
  void update() {

    // Determine the direction vector that points to the mouse from our current location
    RVector mouse = new RVector(mouseX, mouseY);
    RVector direction = RVector.sub(mouse, location);
    
    // Normalize and scale the direction vecgtor
    direction.normalize();
    direction.mult(0.1);
    
    // Accelerate based on direction vector
    acceleration = direction;
    
    // update position
    velocity.add(acceleration);
    velocity.limit(3);
    location.add(velocity);
    
  }
  
  // show the object
  void display() {
    
    stroke(0);    // black border
    fill(175);    // light gray fill
    
    // draw the mover
    ellipse(location.x, location.y, 25, 25);
    
  }
  
  // wrap around edges
  void checkEdges() {
    
    if (location.x > width) {     // right edge
      location.x = 0;
    } else if (location.x < 0) {  // left edge
      location.x = width;
    }
    
    if (location.y > height) {   // bottom edge
      location.y = 0;
    } else if (location.y < 0) { // top edge
      location.y = height;
    }
    
  }
  
}