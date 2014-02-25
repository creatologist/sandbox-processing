int spriteCount = 20;
Sprite[] sprites;

void setup() {
  //ThreadWorker thread1 = new ThreadWorker( 1000, "cat" );
  //thread1.start();
  size( 1000, 800, P2D );
  /*for ( int i = 0; i < 1000; i++ ) {
     ThreadWorker thread = new ThreadWorker( int( random( 1000, 2000 ) ), "Thread" + i );
    thread.start(); 
  }*/
  sprites = new Sprite[ spriteCount ];
  for ( int i = 0; i < spriteCount; i++ ) {
    sprites[i] = new Sprite( "Sprite" + i );
  }
  noStroke();
}

void mouseMoved() {
   for ( int i = 0; i < spriteCount; i++ ) {
      sprites[i].update();
  }
}

void draw() {
  for ( int i = 0; i < spriteCount; i++ ) {
    
     sprites[i].draw(); 
  }
}
