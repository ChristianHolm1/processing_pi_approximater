double counter = 1;
double collsion = 1;
short shortBallRadius = 20;
void setup(){
  frameRate(500);
  size(800,800);
  background(255);
  background(0);
  noStroke();
  circle(width/2,height/2,width);
}

void draw(){
  counter++;
  short[] ballCords = spawnBalls();
  if(countCollisions(ballCords)) {
    collsion++;
  }
  //println("Total Balls: " +counter);
  //println("Collisions: " + collsion);
  double pi = (collsion/counter)*4;
  println("Pi is approximately : " + pi);
  
}

short[] spawnBalls(){
   short rngX = (short) random(width);
   short rngY = (short) random(height);
   float[] rngColors = {random(255),random(255),random(255)};
   fill(rngColors[0],rngColors[1],rngColors[2]);
   circle(rngX, rngY, shortBallRadius);
   
   short[] cords = {rngX, rngY};
   return cords;
   
}
boolean countCollisions(short[] ballCords){
    float distance = dist(ballCords[0],ballCords[1], width/2, height/2);
    if(distance < width/2) {
      //println("hit: " + distance);
      return true;
    }
    else{
      //println("no hit: " + distance);
      return false;
    }
}
