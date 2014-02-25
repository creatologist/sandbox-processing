/**
 * offscreenComplex.pde
 *
 * Demonstrates how off-screen buffers can be used to maintain a
 * high frame-rate even while drawing complex imagery that normally
 * causes the frame rate to plummet significantly.
 *
 * @author Matt Patey
 */
PGraphics bufferMain;
PImage img;
PImage img2;
PFont font;
boolean mode;
int targetFrameRate;
SimpleThread thread;
SimpleThread thread2;
 
void setup() {
  size(500, 500);
  targetFrameRate = 30;
  frameRate(targetFrameRate);
 
  // Create an off-screen buffer.
  bufferMain = createGraphics(500, 500, JAVA2D);
 
  // Draw something complex in the off-screen buffer.
  //renderComplexImage(bufferMain);
 
  //font = loadFont("CourierNew36.vlw");
  thread = new SimpleThread();
  thread.start();
  
  // Copy some pixels from the off-screen buffer to display
  // them on the screen.
  img = new PImage( 200, 200 );
  thread2 = new SimpleThread();
  thread2.start();
  img2 = new PImage( 200, 200 );
  updateBuffer();
}
 
/**
 * Populates the off-screen buffer with a complex image then copies
 * the buffer contents to an image that we will display on screen.
 */
void updateBuffer() {
  //renderComplexImage(buffer);
  //img = buffer.get(0, 0, buffer.width, buffer.height);
  if ( frameCount % 30 == 0 ) println( "updating buffer -- " + random( 0, 10 ) ); 
  //thread.getImage( img );
  img = thread.getImage();
  if ( !imgReady2 ) imgReady = thread.imageReady;
  
  img2 = thread2.getImage();
  if ( !imgReady2 ) imgReady2 = thread2.imageReady;
}
 
void keyPressed() {
  mode = !mode;
}

boolean imgReady;
boolean imgReady2;
 
void mousePressed() {
  updateBuffer();
}
 
void draw() {
  
 
  if(!mode) {
    background(0);
    updateBuffer();
    if ( imgReady ) image(img, 0, 0);
    if ( imgReady2 ) image(img2, 0, 0);
  } 
  else {
    background(255);
    renderComplexImage(bufferMain);
    image(img, 0, 0);
  }
 
  // We can still animate things on the main canvas.
  noStroke();
  fill(255, 0, 0, 128);
  ellipse(random(width), random(height), 20, 20);
 
  drawInfo();
}

class SimpleThread extends Thread {
   boolean running;
   boolean process;
   int count;
   PGraphics buffer;
   SimpleThread() {
      running = false; 
      buffer = createGraphics(500, 500, JAVA2D);
      working = false;
   }
   
   void start() {
     running = true;
     super.start();
   } 
   
   boolean working;
   
   void run() {
      while( running ) {
        
         if ( process ) {
           ++count;
           random( count );
           //working = true;
           buffer.beginDraw();
           //buffer.background( 255 );
            buffer.smooth();
            buffer.fill( 0, 255, 100, 0);
           buffer.fill( 0, 255, 100, 255);
            for(int i = 0; i < 2500; i++) {/*
              buffer.stroke(random(30) + 80, random(30) + 40, 0, random(60) + 24);
                  float x = width / 2 + (random(60) - 30);
                  float y = 0;
                  float x2 = x + (random(160) - 80);
                  float y2 = random(height / 2) + height / 2;
           
                  buffer.bezier(x, y, 
                                x + (random(x/2) - x/2), y + (random(y/2) - y/2),
                                x2 + (random(x2/2) - x2/2), y2 + (random(y2/2) - y2/2), 
                                x2, y2);*/
                float radius = random( 1, 30 );
               buffer.ellipse( random( 0, 500 ), random( 0, 500 ), radius, radius );
            }
            
            
            buffer.ellipse( mouseX, mouseY, 10, 10 );
            
            buffer.ellipse( 200, 200, 30, 30 );
           
            buffer.endDraw();
            img = buffer.get(0, 0, buffer.width, buffer.height);
            imageReady = true;
          //println( "processed -- " + random( 1, 10 ) );
           //working = false;
           process = false;
           
         }
         
         try {
        sleep(16);
      } catch (Exception e) {
      }         
      } 
   }
   
   /*PImage getImage() {
     process = true;
     return buffer.get(0, 0, buffer.width, buffer.height);
   }*/
   
   PImage img;
   
   boolean imageReady = false;
   
   PImage getImage() {
     if ( !process ) process = true;
     //if ( process ) return;
   
     return img;
       
   }
 
  
}
 
/**
 * Draws a complex drawing into an off-screen buffer.
 */
void renderComplexImage(PGraphics buffer) {
  buffer.beginDraw();
            buffer.background(255);
            buffer.smooth();
            buffer.fill( 0, 255, 100, 0);
           buffer.fill( 0, 255, 100, 255);
            for(int i = 0; i < 5000; i++) {/*
              buffer.stroke(random(30) + 80, random(30) + 40, 0, random(60) + 24);
                  float x = width / 2 + (random(60) - 30);
                  float y = 0;
                  float x2 = x + (random(160) - 80);
                  float y2 = random(height / 2) + height / 2;
           
                  buffer.bezier(x, y, 
                                x + (random(x/2) - x/2), y + (random(y/2) - y/2),
                                x2 + (random(x2/2) - x2/2), y2 + (random(y2/2) - y2/2), 
                                x2, y2);*/
                float radius = random( 1, 30 );
               buffer.ellipse( random( 0, 500 ), random( 0, 500 ), radius, radius );
            }
            
            
            buffer.ellipse( mouseX, mouseY, 10, 10 );
            
            buffer.ellipse( 200, 200, 30, 30 );
           
            buffer.endDraw();
  img = buffer.get(0, 0, buffer.width, buffer.height);
}
 
/**
 * Draws information about the frame rate and mode.
 */
void drawInfo() {
  fill(0);
  //textFont(font);
  textSize(18);
  text("are we re-drawing every frame: " + mode, 5, height - 40);
  text("target frame rate: " + targetFrameRate, 5, height - 25);
  text("current frame rate: " + round(frameRate), 5, height - 10);
}
