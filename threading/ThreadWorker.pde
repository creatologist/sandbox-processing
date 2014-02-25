class ThreadWorker extends Thread {
 Boolean running;
 int wait;
 String id;
 int count;


  ThreadWorker( int w, String s ) {
     wait = w;
     running = false;
     id = s;
     count = 0;
  }
 
  void start() {
  running = true;
  
   super.start();
 }

  void run() {
    while (running && count < 10) {
      println(id + ": " + count);
      count++;
      // Ok, let's wait for however long we should wait
      try {
        sleep((long)(wait));
      } catch (Exception e) {
      }
    }
    System.out.println(id + " thread is done!");  // The thread is done when we get to the end of run()
  } 
  
  // Our method that quits the thread
  void quit() {
    System.out.println("Quitting."); 
    running = false;  // Setting running to false ends the loop in run()
    // IUn case the thread is waiting. . .
    interrupt();
  }
  
  int getCount() {
    return count;
  }
}
