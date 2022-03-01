class player{
  int x= 400; 
  int y= 50; // the location of the player
  int hp = 100;
  PImage player;
  int WhichPlayer;
  
 player(int WhichPlayer)
  {
    //init
  this.WhichPlayer = WhichPlayer;
  if (WhichPlayer == 1){
    player = loadImage("skydiver.png"); //loads the player image
  }
}


  
void display()
  {
    image(player,x,y); //displays player
  }
  
void hit(String type){ //punishes the users for getting hit by the dogde ball and reduces the its health
  if(type == "damage"){
    hp -= 20;
  }
  
  if(type == "heal"){
    hp+= 20;
  }
}

void displayHP(){
  noFill();
  float varHp = hp*1.5;
  stroke(0,0,0);
  rect(10,50,150,35);
  fill(255,0,0);
  if((varHp)>=240){ // sets the maximum amount of health allowed
    varHp = 240;
  }
  rect(10,50,int(varHp),35); //if the player gets hit then the hp bar will decrease

}











}

    













  
