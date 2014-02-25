class Sprite {
   
    SpriteThread thread;
   String name;
   
   Boolean rollover;
   PVector pos;
   int width;
   int height;
   
   Sprite( String _name) {
     name = _name;
     rollover = false;
     width = 70;
     height = 40;
     pos = new PVector( int( random( 0, 1000 ) ), int( random( 0, 800 ) ), 0 );
     //println( _name );
     //thread = new SpriteThread( _name );
     //thread.start();
   }
   
   void update() {
     
      thread.process( pos, width, height );
      // println( thread.getEvent() );
      //if ( name == "Sprite92" ) println( "92" );
      if ( thread.getEvent() == 1 ) rollover = true;
     else rollover = false;
   }
   
   /*void update() {
      if ( mouseX >= pos.x && mouseY >= pos.y ) {
         if ( pos.x + width >= mouseX && pos.y + height >= mouseY ) {
            rollover = true; 
         } else rollover = false;
      } else rollover = false;
   }*/
   
   void draw() {
     //update();
     if ( rollover ) fill( 0, 255, 100 );
    else fill( 255, 0, 0 );
   
    rect( pos.x, pos.y, width, height ); 
   }
  
}
