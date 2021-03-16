class Point
{
  float x = 0;
  float y = 0;

  Point() {
  }

  Point(float X, float Y)
  {
    x = X;
    y = Y;
  }
}

/*
 * Brief  This class is used to save a size
 *****************************************************************************/
class Size
{
  int width = 0;
  int height = 0;

  Size() {
  }

  Size(int Width, int Height)
  {
    width = Width;
    height = Height;
  }
}

/*
 * Brief  This class is used to save a 2D speed
 *****************************************************************************/
class Speed
{
  float x = 0;
  float y = 0;
  float speed;
  
  void getSpeed()
  {
    speed = sqrt(sq(x) + sq(y));
  }
  
  void getXYSpeed(float degree)
  {
    x = speed * cos(degree);
    y = speed * sin(degree);
  }

  Speed() {
  }

  Speed(float X, float Y)
  {
    x = X;
    y = Y;
  }
}

/*
 * Brief  This enum is used to save a gameState
 *****************************************************************************/
class GameState
{
  final static int WELCOME = 0;
  final static int PLAYING = 1;
  final static int PLAYER1WIN = 2;
  final static int PLAYER2WIN = 3;
}
