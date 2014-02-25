
//import processing.core.*;

PApplet app = this;
void setup() {
  size(800,500);
  background(0);
  // make the bots
  
  //sprite = new Sprite();
  //sprite.addEventListener( this );
  
  for (int i=0; i<5000; i++) {
    new Bot();
  }
}
 
// make sure to define the draw method, even if it's empty
void draw() {
  //println( "WTF" );
  //background( 100, 0, 0, 255 );
  fill( 0, 0, 0, 10 );
  rect( 0, 0, 800, 500 );
  //pointSize( 30 );
}
 
int BOT_NUM = 0;
 

