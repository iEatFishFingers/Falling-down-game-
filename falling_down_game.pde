// load the player
player player1, player2; 
ball[] ball;
heart heart;
PImage sky,hit;
int level= 1;
int i=0;
int count,y;


void setup()
{
  size(600,800);
  heart = new heart();
  ball = new  ball[101]; // creates the array of balls
  count = 102;
  for(int i=0; i<count; i++){// puts the image of the ball on each element and sets the speed of each type of ball
    if (i<=25){
      ball[i]= new ball(1);
    //  print("stage 1 ball");
    }
   else if(i<=50){
     ball[i]= new ball(2);
    // print("stage 2 ball");
   }
   else if(i<=75){
     ball[i]= new ball(3);
    // print("stage 3 ball");
   }
   
   else if(i<=100){
     ball[i]= new ball(4);
    // print("stage 4 ball");
   }
  }

  player1 = new player(1);// init the player
  player2 = new player(2);
  sky = loadImage("sky_back.jpg"); // creates the background 
  hit = loadImage("crash.png"); // loads the hit animation
}

void draw(){
 
  movingBg(); //displays the background which loops
  player1.displayHP();
  if(player1.hp != 0){
    player1.display(); //displays the player
    startLevel(); // starts dropping the dogde balls 
    checkCrash(); // does a check if the player hits the dogde ball
    heartCheckCrash();
  }//end if
  else{
    textSize(100); //sets the text size
    text("YOU LOSE!",55,300);// sets the text contents
    textSize(50);
    text("Click Anywhere To Start Over",15,400);
    mousePressed(); // checks if the mouse has been clicked
  }//end else
}// end draw

void mousePressed() {
  if ((mouseButton == LEFT ) && (player1.hp <=0)) { // checks if the mouse has been clicked and if it has the  it will reset the whole game
    level = 1;
    count = 101;
    i = 0;
    player1.hp = 100;
    heart.reset();
    for(int i=0; i<count; i++){
      ball[i].reset();//reset the ball posistions
    }
    mouseButton =  RIGHT; //sets the mouse to right click so then it wont loop restart
  }
}

void movingBg(){ //loops the background to make it seem like the sky is falling
  image(sky, 0, y);
  image(sky, 0, y+height);
  y = y-5;
  if ( y <= - height){//if it reaches the end of the image loop back to the start point
    y = 0;
  }
  
  
}


boolean checkhp(){//checks the players hp
return ((player1.hp != 0));
}

void checkCrash(){
  if(crash()){ //checks if the player got hit by the dogde ball
  image(hit, player1.x, player1.y); // displays the hit image
  player1.hit("damage"); 
 }
}
void heartCheckCrash(){
  if(crashHeart()){ //checks if the player got hit by the heart
  image(hit, player1.x, player1.y); // displays the hit image
  player1.hit("heal"); 
 }
}

boolean crash()// calc for crash 
{
  return(abs(player1.x-ball[i].x)<55 && (abs(player1.y-ball[i].y)<10 )); // this line return absolute value
}

boolean crashHeart()// calc for crash 
{
  return(abs(player1.x-heart.x)<55 && (abs(player1.y-heart.y)<10 )); // this line return absolute value
}


void startLevel(){
  textSize(32); // sets the text size
text("Level: "+ (level), 10, 30); // the location and the text contents
  //print(" ball number " +i);
  player1.display();
  if(i<(count-1)){
    heart.chance();
    player1.display();
    ball[i].display();
    ball[i].move(height);
    if(ball[i].y<= 0){ //if the ball has gone past the player then it will load the next ball
      i=i+1;
    }
  }
  IncreaseLevel();
  }

void IncreaseLevel(){ // when a certain amount of balls have reached then it will change level
  if (i>10 && i<20){
      level = 2;
    }
   else if(i>21 && i<30){
     level = 3;
   }
   else if(i>31 && i< 40){
     level = 4;
   }
   
   else if(i>41){
    level = 5;
   }
 

}

void keyPressed(){ //moving mech for the player
  if (key == CODED) {
    if (keyCode == RIGHT) {
      player1.x =player1.x + 20;
 
    }}
    
    if (key == CODED) {
    if (keyCode == LEFT) {
     player1.x =player1.x - 20;
    }}
    


}
