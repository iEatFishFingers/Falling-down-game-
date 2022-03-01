class ball{
  int x = (int)random(200, 500);  
  int y= 750;
  int level;
  float chance;
  PImage ball,heart;
  int speed;

ball(int level){
    

switch(level) {
  case 1: 
    speed = 10;
    break;
  case 2: 
    speed = 20;
    break;
  case 3: 
    speed = 25;
    break;
  case 4:
    speed = 30;
    break;
}
  this.level = level;
  ball = loadImage("ball.png");
  heart = loadImage("heart.png");
}


void display(){
  image(ball,x,y);
}








void move(int max){//passes in the max range 
   if(max > y){// stop the dodgeballs till the end of the screen
    y -= ((int)speed);//moves the dodgeballs
  }
}

boolean check(){
  if(y>10){
    return false;
  }
  else
  return true;
}


void reset(){ //resets the current ball positions
  x = (int)random(200, 500);  
  y= 750;
}



















}//end
