int spriteCount = 1000;
Sprite[] sprites1;
Sprite[] sprites2;
Sprite[] sprites3;
Sprite[] sprites4;
SpritesThread thread1;
SpritesThread thread2;
SpritesThread thread3;
SpritesThread thread4;
void setup() {
  //ThreadWorker thread1 = new ThreadWorker( 1000, "cat" );
  //thread1.start();
  size( 1000, 800, P2D );
  /*for ( int i = 0; i < 1000; i++ ) {
     ThreadWorker thread = new ThreadWorker( int( random( 1000, 2000 ) ), "Thread" + i );
    thread.start(); 
  }*/
  sprites1 = new Sprite[ spriteCount ];
  sprites2 = new Sprite[ spriteCount ];
  sprites3 = new Sprite[ spriteCount ];
  sprites4 = new Sprite[ spriteCount ];
  for ( int i = 0; i < spriteCount; i++ ) {
    sprites1[i] = new Sprite( "Sprite" + i );
    sprites2[i] = new Sprite( "Sprite" + i );
    sprites3[i] = new Sprite( "Sprite" + i );
    sprites4[i] = new Sprite( "Sprite" + i );
  }
  
  thread1 = new SpritesThread( sprites1 );
  thread1.start();
  thread2 = new SpritesThread( sprites2 );
  thread2.start();
  thread3 = new SpritesThread( sprites3 );
  thread3.start();
  thread4 = new SpritesThread( sprites4 );
  thread4.start();
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
    sprites2[i].draw();
  }
  
  thread3.draw();
  thread4.draw();
}
