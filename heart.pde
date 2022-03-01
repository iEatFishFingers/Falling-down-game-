class heart{
int x= int(random(600));
int y = 750;
int speed = 10;
int chance,temp;
PImage heart;


heart(){
  heart = loadImage("heart.png");
}


void chance(){ 
    check();
    display();
    move();
}

void display(){
  image(heart,x,y);
}

void move(){
  if(height > y){// stop the dodgeballs till the end of the screen
    y -= ((int)speed);//moves the dodgeballs
  }
}

boolean check(){ // checks if it has reached the top so then it can loop back 
  if(y>10){
    return false;
  }
  else
  {
    x= int(random(600)); //gen a random x location 
    y=750;
    
    return true;
  }
}

void reset(){
x= int(random(600));
y = 750;
}





}
