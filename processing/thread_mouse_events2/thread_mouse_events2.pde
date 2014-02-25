int spriteCount = 10000;
Sprite[] sprites1;
SpritesThread thread1;
void setup() {
  //ThreadWorker thread1 = new ThreadWorker( 1000, "cat" );
  //thread1.start();
  size( 1000, 800, P2D );
  /*for ( int i = 0; i < 1000; i++ ) {
     ThreadWorker thread = new ThreadWorker( int( random( 1000, 2000 ) ), "Thread" + i );
    thread.start(); 
  }*/
  sprites1 = new Sprite[ spriteCount ];
  for ( int i = 0; i < spriteCount; i++ ) {
    sprites1[i] = new Sprite( "Sprite" + i );
  }
  
  thread1 = new SpritesThread( sprites1 );
  thread1.start();
  noStroke();
}

void mouseMoved() {
   /*for ( int i = 0; i < spriteCount; i++ ) {
      sprites[i].update();
  }*/
}

void draw() {
  for ( int i = 0; i < spriteCount; i++ ) {
     
     sprites1[i].draw();
  }
}
