PImage plane;
PImage bg, bg2;
PImage pipeT, pipeB;
int bgx;
int y, Vy;
int[] px, py;  //We will change to arrays later
boolean gameState;
 
void setup(){
  size(600,600);
  bg = loadImage("bg.png");
  bg2 = loadImage("bgREV.png");
  y = 0;
  Vy = 0;
  plane = loadImage("plane.png");
  px = new int[3];
  py = new int[3];
  for(int i = 0; i < 3; i++){
    px[i] = width + width/3*i;
    py[i] = int(random(200, height-200));
  }
  pipeT = loadImage("pipe2.png");
  pipeB = loadImage("pipe.png");
  gameState = true;
}
void draw(){
  if(gameState){
    drawBG();
    drawPlane();
    drawPipes();
    checkCrash();
  }
}
 
void checkCrash(){
  for(int i = 0; i < px.length; i++){
    //TOP
    if(px[i] < 55 + plane.width && px[i] > 35 && y - py[i] > 110){
      gameState = false;
    }
    //Bottom
    if(px[i] < 55 + plane.width && px[i] > 35 && py[i] - y > 110){
      gameState = false;
    }
  }
}
void mousePressed(){
  Vy = -13;
}
 
void drawPipes(){
  for(int i = 0; i < px.length; i++){
    px[i] = px[i] - 3;
    image(pipeT, px[i]-25, py[i]-pipeT.height-100);
    image(pipeB, px[i]-25, py[i]+100);
    if(px[i] < -50){
      px[i] = width + 50;
      py[i] = int(random(100,height-100));
    }
  }
}
 
void drawPlane(){
  image(plane, 50, y);
  y += Vy;
  Vy++;
  if(y > height-plane.height){
    y = height-plane.height;
  }
}
void drawBG(){
  image(bg,bgx,0);
  image(bg2, bgx + bg.width, 0);
  image(bg, bgx+2*bg.width, 0);
  bgx-= 1;  
  if(bgx < -2*bg.width){
    bgx = 0;
  }
}
