int spriteCount = 500;
Sprite[] sprites1;
Sprite[] sprites2;
Sprite[] sprites3;
Sprite[] sprites4;
Sprite[] sprites5;
Sprite[] sprites6;
Sprite[] sprites7;
Sprite[] sprites8;
SpritesThread thread1;
SpritesThread thread2;
SpritesThread thread3;
SpritesThread thread4;
SpritesThread thread5;
SpritesThread thread6;
SpritesThread thread7;
SpritesThread thread8;
void setup() {
  //ThreadWorker thread1 = new ThreadWorker( 1000, "cat" );
  //thread1.start();
  size( 1000, 800, OPENGL );
  /*for ( int i = 0; i < 1000; i++ ) {
     ThreadWorker thread = new ThreadWorker( int( random( 1000, 2000 ) ), "Thread" + i );
    thread.start(); 
  }*/
  sprites1 = new Sprite[ spriteCount ];
  sprites2 = new Sprite[ spriteCount ];
  sprites3 = new Sprite[ spriteCount ];
  sprites4 = new Sprite[ spriteCount ];
  sprites5 = new Sprite[ spriteCount ];
  sprites6 = new Sprite[ spriteCount ];
  sprites7 = new Sprite[ spriteCount ];
  sprites8 = new Sprite[ spriteCount ];
  for ( int i = 0; i < spriteCount; i++ ) {
    sprites1[i] = new Sprite( "Sprite" + i );
    sprites2[i] = new Sprite( "Sprite" + i );
    sprites3[i] = new Sprite( "Sprite" + i );
    sprites4[i] = new Sprite( "Sprite" + i );
    sprites5[i] = new Sprite( "Sprite" + i );
    sprites6[i] = new Sprite( "Sprite" + i );
    sprites7[i] = new Sprite( "Sprite" + i );
    sprites8[i] = new Sprite( "Sprite" + i );
  }
  
  thread1 = new SpritesThread( sprites1 );
  thread1.start();
  thread2 = new SpritesThread( sprites2 );
  thread2.start();
  thread3 = new SpritesThread( sprites3 );
  thread3.start();
  thread4 = new SpritesThread( sprites4 );
  thread4.start();
  
  thread5 = new SpritesThread( sprites5 );
  thread5.start();
  thread6 = new SpritesThread( sprites6 );
  thread6.start();
  thread7 = new SpritesThread( sprites7 );
  thread7.start();
  thread8 = new SpritesThread( sprites8 );
  thread8.start();
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
   sprites3[i].draw();
  sprites4[i].draw(); 
  sprites5[i].draw();
    sprites6[i].draw();
   sprites7[i].draw();
  sprites8[i].draw(); 
  }
}
