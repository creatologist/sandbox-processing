import controlP5.*;
ControlP5 cp5;

class Thing {
  PVector pos;
  float radius;
  boolean rollover;
  int hitDetect;
  
  Thing() {
    pos = new PVector( random( 20, 800 ), random( 20, 500 ) );
    radius = 10;
    rollover = false;
    hitDetect = HIT_DETECT.RADIUS;
  }
  
  void update() {
     if ( abs( mouseX - pos.x ) >= radius ) {
       rollover = false;
       return;
     }
     if ( abs( mouseY - pos.y ) >= radius ) {
       rollover = false;
       return;
     }
     rollover = true; 
  }
  
  void display() {
    if ( rollover ) fill( 255, 0, 0 );
    else fill( 0, 255, 0 );
    ellipse( pos.x, pos.y, radius, radius ); 
  }
    
}

int thingCount = 20000;
Thing[] things = new Thing[20000];
InteractionThread thread;

void setup() {
  size( 800, 500, OPENGL );
  cp5 = new ControlP5(this);
 cp5.addFrameRate().setInterval(10).setPosition( 0, 10 );
 thread = new InteractionThread();
 for ( int i = 0; i < thingCount; i++ ) {
    things[i] = new Thing(); 
 }
 thread.start( things );
}

void update() {
 for ( int i = 0; i < thingCount; i++ ) {
    things[i].update();
 }
}

void draw() {
  background( 0 );
   //update();
   
   for ( int i = 0; i < thingCount; i++ ) {
    //things[i].update();
    things[i].display();
 }
}
