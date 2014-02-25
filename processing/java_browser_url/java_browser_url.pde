import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;

void setup(){
  
}

void draw(){
  
}

void keyPressed() {
  if ( key == CODED ) {
    println( "Keyboard CODED: " + keyCode );
    if ( keyCode == UP ) {
    } 
    else if ( keyCode == DOWN ) {
    } 
    else if ( keyCode == RIGHT ) {
    } 
    else if ( keyCode == LEFT ) {
    }
  } 
  else {
    println( "Keyboard KEY: " + int( key ) + " ( " + key + " )" );
    if ( key == 98) { // b
      try {
      Desktop desktop = Desktop.getDesktop();
      URI uri = URI.create( "http://www.9gag.com" );
      desktop.browse( uri );
      } catch ( IOException e ) {
         
      }
    }
  }
}
