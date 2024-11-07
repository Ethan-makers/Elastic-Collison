PVector posRed, posCue, v, w;
float r, diam;

void setup() {
  size(700, 700);
 
  r = 30;
  diam = 2*r;

  //Initial positions of the cue ball and red ball
  posCue = new PVector(50, 360);
  posRed = new PVector(400, 330);
 
  //Initial velocities of the cue ball and red ball
  v = new PVector(7, 0); //moving to the right
  w = new PVector(0, 0); //motionless
}

void draw() {
  background(0,155,0);
  fill(255);
  circle(posCue.x, posCue.y, diam);
  fill(255,0,0);
  circle(posRed.x, posRed.y, diam);
 
  posCue.add(v);
  posRed.add(w);
 
  //The vector spanning between the balls
  PVector S = new PVector(posRed.x-posCue.x, posRed.y-posCue.y);
 
  if( S.mag() <= diam ) { //If the distance between the balls < sum of their radii, then do these 4 steps
    //Step 1: Compute the unit vector sHat
    PVector SHat = PVector.div(S,S.mag());
    
   
    //Step 2: Compute k = dot product of v & sHat - dot product of w & sHat
    Float k = (v.dot(SHat))-(w.dot(SHat));
   
    //Step 3: Compute the vectors deltaV and deltaW
    PVector DeltaV = PVector.mult(SHat,-k);
    PVector DeltaW = PVector.mult(SHat,k);
   
    //Step 4: Add deltaV to v, and deltaW to w
    v = v.add(DeltaV);
    w = w.add(DeltaW);
   
  }
}
