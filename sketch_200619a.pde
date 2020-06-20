int prevX = 0;
int prevY = 0;

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
    stroke(0, 0, 255);
    if( prevX != 0 && prevY != 0)
      line(prevX, prevY, mouseX, mouseY);
    prevX = mouseX;
    prevY = mouseY;
   }
  
}

void drawStartFinish()
{
  int MARGIN = 25;
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
