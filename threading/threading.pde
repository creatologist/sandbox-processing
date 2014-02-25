void setup() {
  //ThreadWorker thread1 = new ThreadWorker( 1000, "cat" );
  //thread1.start();
  
  for ( int i = 0; i < 1000; i++ ) {
     ThreadWorker thread = new ThreadWorker( int( random( 1000, 2000 ) ), "Thread" + i );
    thread.start(); 
  }
}

void draw() {
  
}
