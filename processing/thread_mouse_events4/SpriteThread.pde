class SpriteThread extends Thread {
 Boolean running;
 int wait;
 String id;
 int count;
 Boolean processing;
 PVector pos;
 int width;
 int height;
 Boolean rollover;

  SpriteThread( String s ) {
     running = true;
     id = s;
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

  void run() {
    while ( running ) {
       
        if ( processing ) {
         if ( mouseX >= pos.x && mouseY >= pos.y ) {
           if ( pos.x + width >= mouseX && pos.y + height >= mouseY ) {
              rollover = true; 
           } else rollover = false;
        } else rollover = false;
        processing = false;
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
  
  public void draw() {
    
  }
}
