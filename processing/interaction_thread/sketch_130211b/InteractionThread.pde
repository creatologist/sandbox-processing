static class HIT_DETECT {
    static final int NONE = 1;
    static final int RADIUS = 2;
    static final int AREA = 3;
}

class InteractionThread extends Thread {
  Thing[] things;
  int totalThings = 0;
  int delay = 10;
  
  InteractionThread(){}
  
  boolean running;
  boolean ready = false;
  
  void start( Thing[] _things) {
     running = true;
     things = _things;
     totalThings = things.length;
     ready = true;
     super.start();
  }
  
  Thing _thing;
  
  void run() {
    System.out.println( "MouseInteractionThread start" ); 
     while ( running ) {
       //println( "WTF" );
       //System.out.println( "SWT" );
       if ( ready ) {
       //println( things.length );
       for ( int i = 0, len = totalThings; i < len; i++ ) {
         _thing = things[i];
         //println( i );
         //console.log( i );
         //println( i ); 
           if ( _thing.hitDetect == HIT_DETECT.RADIUS ) {
              if ( abs( mouseX - _thing.pos.x ) > _thing.radius ) {
                 _thing.rollover = false;
                 continue;
               }
               if ( abs( mouseY - _thing.pos.y ) > _thing.radius ) {
                 _thing.rollover = false;
                 continue;
               }
               _thing.rollover = true; 
           }
       }
       }
       //println( "HI -- " + random( 0, 10 ) );
       
       try {
          sleep((long)(delay));
        } catch (Exception e) {
        }
       
       }
    System.out.println( "MouseInteractionThread done" ); 
  }
  
  
  // Our method that quits the thread
  void quit() {
    System.out.println("Quitting."); 
    running = false;  // Setting running to false ends the loop in run()
    // IUn case the thread is waiting. . .
    interrupt();
  }
}
