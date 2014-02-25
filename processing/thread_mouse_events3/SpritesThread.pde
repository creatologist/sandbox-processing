class SpritesThread extends Thread {
 Boolean running;
 int wait;
 String id;
 int count;
 Boolean processing;
 PVector pos;
 int width;
 int height;
 Boolean rollover;
 Sprite[] sprites;
 int totalSprites;

  SpritesThread( Sprite[] s ) {
    sprites = s;
    totalSprites = sprites.length;
     running = true;
     //id = s;
     count = 0;
     processing = false;
     rollover = false;
     
     //println( id );
     //start();
  }
 
  void start() {
  running = true;
   super.start();
  }
  
  void process( PVector _pos, int _width, int _height ) {
    pos = _pos;
    width = _width;
    height = _height;
    //if ( id == "Sprite0" ) println( mouseX );
    //System.out.println("HI");
   //println( id );
   //println( mouseX );  
    //if ( id == "Sprite0" ) println( "HI" );
    processing = true;
    
  }
  
  void isOver( Sprite s ) {
      if ( mouseX >= s.pos.x && mouseY >= s.pos.y ) {
           if ( s.pos.x + s.width >= mouseX && s.pos.y + s.height >= mouseY ) {
              s.rollover = true; 
           } else s.rollover = false;
        } else s.rollover = false; 
  }
  
  void animate( Sprite s ) {
      s.pos.set( ++s.pos.x, ++s.pos.y, 0 );
      if ( s.pos.x > 1000 ) s.pos.x = 0;
      if ( s.pos.y > 800 ) s.pos.y = 0;
  }

  void run() {
    while ( running ) {
        for ( int i = 0; i < totalSprites; i++ ) {
           isOver( sprites[i] );
           animate( sprites[i] );
        }
        try {
        sleep(32);
      } catch (Exception e) {
      }
    }
    /*
    while ( ready ) {
      println(id + ": " + count);
      count++;
      // Ok, let's wait for however long we should wait
      try {
        sleep((long)(wait));
      } catch (Exception e) {
      }
    }
    System.out.println(id + " thread is done!");  // The thread is done when we get to the end of run()*/
  }
  
  // Our method that quits the thread
  void quit() {
    System.out.println("Quitting."); 
    running = false;  // Setting running to false ends the loop in run()
    // IUn case the thread is waiting. . .
    interrupt();
  }
  
  public int getEvent() {
     if ( rollover ) return 1;
     else return 0;
  }
}
