// create a class, make sure it's declared public
public class Bot
{
  float x, y, sx, sy;
  color c;
  int UID;
  Bot() {
    // some random initial properties
    UID = BOT_NUM++;
    x = random(1, width);
    y = random(1, height);
    sx = random(1, 3);
    sy = random(1, 3);
    c = color(random (0, 255),random (0, 255),random (0, 255));
 
    // register with the draw and mouse event using the reference to PApplet
    // this could also be passed in the constructor etc
    app.registerDraw(this);
    //app.registerMouseEvent(this);
    app.registerMethod("mouseEvent", this);
    //app.registerMethod("mouseEnter", this);
    //app.addMouseListener(this);
  }
 
  // called on all bots at the end of each draw()
  void draw() {
    x += sx;
    y += sy;
    if (x > width || x < 0) {
      sx *= -1;
      x += sx*2;
    }
    if (y > height || y < 0) {
      sy *= -1;
      y += sy*2;
    }
    stroke(c);
    point(x,y);
  }
  
  void mouseEnter( MouseEvent event ) {
    
  }
 
  // called on all bots when a mouse event occurs
  void mouseEvent(MouseEvent event) {
    // get the x and y pos of the event
    int x = event.getX();
    int y = event.getY();
 
    switch (event.getAction()) {
    case MouseEvent.PRESS:
      // change direction when the mouse is pressed
      if ( sqrt( sq( this.x - x ) + sq( this.y - y ) ) <= 10 ) println( "Hello from bot: " + UID ); 
      sx = (sx<0)?random(1, 3)*-1:random(1, 3);
      sy = (sy<0)?random(1, 3)*-1:random(1, 3);
      break;
    case MouseEvent.RELEASE:
      // do something...
      break;
    case MouseEvent.ENTER:
      //if ( sqrt( sq( this.x - x ) + sq( this.y - y ) ) <= 10 ) println( "Hello from bot: " + UID ); 
      break;
    case MouseEvent.CLICK:
      // do something...
      break;
    case MouseEvent.DRAG:
      // do something...
      break;
    case MouseEvent.MOVE:
      // do something...
      break;
    }
  }
}
