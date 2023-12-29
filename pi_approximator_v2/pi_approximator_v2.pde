double counter = 1;
double collsion = 1;
int box_w = 800;
int box_h = 800;

//bottom 100px pi appocimation
void setup(){
  frameRate(500);
  size(800,900);
  background(255);
  background(0);
  noStroke();
  circle(box_w/2,box_h/2,box_w);
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
  if(counter % 10 == 0){
    displayPi(pi);
    
  }
  
}
void displayPi(double pi){
  fill(128,128,128);
  rect(0,box_h+10,width,90);
  fill(0);
  textSize(80);
  String pi_str = nf((float)pi);
  text("Pi: " + pi_str,0,height-10);
  
}
short[] spawnBalls(){
   short rngX = (short) random(0,box_w);
   short rngY = (short) random(0,box_h);
   fill(255,0,0);
   circle(rngX, rngY, 5);
   
   short[] cords = {rngX, rngY};
   return cords;
   
}
boolean countCollisions(short[] ballCords){
    float distance = dist(ballCords[0],ballCords[1], box_w/2, box_h/2);
    if(distance < box_w/2) {
      //println("hit: " + distance);
      return true;
    }
    else{
      //println("no hit: " + distance);
      return false;
    }
}
