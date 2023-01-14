

int x = 400;
int y = 800;
int pLength = 10;
int pHeight = 100;
int paddleX1 = 0;
int paddleY1 = 175;
int paddleX2 = y-pLength;
int paddleY2 = 175;
float speed = 6;
int vel_array[] = {-1, 1};
float ball_XSpeed = 3 * vel_array[int(random(0,2))];
int ball_YSpeed = 3 * vel_array[int(random(0,2))];
int ballRadius = 15;
int ballXpos = int(random(300,500)); 
int ballYpos = int(random(0,height));
int game_over = 1;

void setup(){
  size(800,400);  
  background(0);
  text("PLAYER1", 5, height/2);
  text("PLAYER2", 670, height/2);
  text("PONG", 350, height/4);
  text("Press SHIFT", 320, height/2);
  text(" to begin ", 350, height*3/4);
}

void draw(){
  if((game_over == 1) && keyPressed && (key == CODED)){
    if(keyCode == SHIFT){
      game_over = 0;
      speed = 3;
      ball_XSpeed = 3 * vel_array[int(random(0,2))];
     ball_YSpeed = 3 * vel_array[int(random(0,2))];
      ballXpos = int(random(300,500)); 
      ballYpos = int(random(0,height));
    }
  }
    
  if (game_over == 0){
    background(0);
    stroke(#FFFFFF);
    line(y/2, 0, y/2, height);
    fill(255);
    rect(paddleX1, paddleY1, pLength, pHeight);
    rect(paddleX2, paddleY2, pLength, pHeight);
    ellipse(ballXpos, ballYpos, ballRadius, ballRadius);
    
    if(ball_XSpeed > 0){
      if (keyPressed && (key == CODED)) { 
        if (keyCode == UP) {
          if (paddleY2 > 0){ 
            paddleY2-=3;
         }
        }
        else if (keyCode == DOWN) {
          if (paddleY2 < height-pHeight){
            paddleY2+=3;
          }
        }
      }
    }
    else{
      if (keyPressed) { 
        if ((key == 'w') || (key == 'W')) {
          if (paddleY1 > 0){ 
            paddleY1-=3;
         }
        }
        else if ((key == 's') || (key == 'S')) {
          if (paddleY1 < height-pHeight){
            paddleY1+=3;
          }
        }
      }
    }
  
    ballXpos += ball_XSpeed;
    ballYpos +=ball_YSpeed;
    
    if(ballYpos < 3){
     ball_YSpeed = 3;      
    }
    else if(ballYpos > (height-3)){
     ball_YSpeed = -3;
    }
  
    if(ballXpos < pLength){
      if((ballYpos > paddleY1) && (ballYpos < (paddleY1 + pHeight))){
        ball_XSpeed = speed;
        speed += 0.5;
      }
      else{
        game_over = 1;
        background(255);
        textSize(48);
        fill(0);
        text("GAME OVER ", 300, height/4);
        text("PLAYER2 WINS", 300, height/2);
      }
    }
    else if(ballXpos > (y-pLength)){
      if((ballYpos > paddleY2) && (ballYpos < (paddleY2 + pHeight))){
        ball_XSpeed = -speed;
        speed += 0.5;
      }
      else{
        game_over = 1;
        background(255);
        textSize(48);
        fill(0);
        text("GAME OVER ", 300, height/4);
        text("PLAYER1 WINS", 300, height/2);
      }
    }
  }
}
