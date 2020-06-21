
int TIMER_X = 320;
int TIMER_Y = 40;
int MARGIN = 25;


int timerStart = 0;
boolean isTimerStarted = false;
boolean isRaceFinished = false;

void setup()
{
  size(640,480);
  background(255);
  //draw maze
  drawBoard();
  drawStartFinish();
}

void draw()
{
   if (mousePressed) {
     
     if(isTimerStarted && !isRaceFinished)
     {
      if(get(mouseX, mouseY) == color(0,255,0))
       {
          stopTimer(); 
       }
       
       stroke(0, 0, 255);
       line(pmouseX, pmouseY, mouseX, mouseY);

     }
     else if(get(mouseX, mouseY) == color(255,0,0))
     {
       startTimer();
     }
   }
  
}

void drawStartFinish()
{
  
  textSize(24);
  fill(255,0,0);
  text("S", MARGIN, MARGIN);
  
  fill(0,255,0);
  text("F", width-MARGIN, height-MARGIN);
}

void drawBoard()
{
  stroke(0);
  int NUM_WALLS = 10;
  int WALL_DIST = width/NUM_WALLS;
  for(int x = 0; x < NUM_WALLS; x++)
  {
    line(x * WALL_DIST, 0 , x * WALL_DIST, height);
  }
  
  stroke(255);
  int EXIT_WIDTH = 50;
  for(int x = 0; x < NUM_WALLS; x++)
  {
    int y = int(random(0, height - EXIT_WIDTH));
    line(x * WALL_DIST, y , x * WALL_DIST, y + EXIT_WIDTH);
  }
  
}

void startTimer(){
  timerStart = millis();
  isTimerStarted = true;
}

void stopTimer() {
  isTimerStarted = false;
  isRaceFinished = true;
  fill(0);
  text(Integer.toString(millis() - timerStart), TIMER_X, TIMER_Y);
}
