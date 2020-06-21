
int TIMER_X = 0;
int TIMER_Y = 0;
int MARGIN = 25;
int EXIT_WIDTH = 50;

int timerStart = 0;
boolean isTimerStarted = false;
boolean isRaceFinished = false;

PGraphics pgTimer;

void setup()
{
  size(640,480);
  background(255);
  pgTimer = createGraphics(100,25);
  //draw maze
  drawBoard();
  drawStartFinish();
}

void draw()
{
   if (mousePressed) {
     
     if(isTimerStarted && !isRaceFinished)
     {
       drawTimer();
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

boolean coinToss()
{
  return int(random(2)) == 0;
}

void drawBoard()
{
  stroke(0);
  strokeWeight(3);
  int NUM_WALLS = 10;
  int WALL_DIST = width/(NUM_WALLS+1);
  for(int x = 0; x < NUM_WALLS; x++)
  {
    boolean r = coinToss();
    
    line((x+1) * WALL_DIST, r ? EXIT_WIDTH: 0, (x+1) * WALL_DIST, height - (r ? 0: EXIT_WIDTH));
    
    if(x % 2 == 0)
    {
      line((x+1) * WALL_DIST, height/2, (x+2) * WALL_DIST, height/2);
    }
  }
  
  stroke(255);
  
  for(int x = 0; x < NUM_WALLS; x++)
  {
    int y = int(random(0, height - EXIT_WIDTH));
    line((x+1) * WALL_DIST, y , (x+1) * WALL_DIST, y + EXIT_WIDTH);
  }
  
}

void drawTimer(){
  pgTimer.beginDraw();
  pgTimer.background(0);
  pgTimer.fill(255);
  pgTimer.textSize(16);
  pgTimer.text(Integer.toString(millis() - timerStart), 20, 20);
  pgTimer.endDraw();
  image(pgTimer, TIMER_X, TIMER_Y);
}

void startTimer(){
  timerStart = millis();
  isTimerStarted = true;
}

void stopTimer() {
  isTimerStarted = false;
  isRaceFinished = true;
  
}
