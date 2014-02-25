/* The Command interface */
public interface Command {
   void execute();
}

static class doThis implements Command {
   public void execute() {
     println( "999" );
   } 
}

public static class EXECUTE {
  
  static final int JUMP_UP = 1;
  
  static public void it( int type, Thing self ) {
    switch( type ) {
       
       case JUMP_UP:
        println( self.name );
        println( "jumping up and down !!" );
         break; 
      
    }
  } 
  
}

import java.util.List;
import java.util.ArrayList;

public class Thing {
   Thing(){
     app.registerMouseEvent( this );
     _ready = false;
     name = "untitled";
   }
   Command[] commands = new Command[1];
  
  Boolean _ready;
  String name;
  
  public void storeAndExecute( Command cmd, String name ) {
   commands[0] = cmd;
   _ready = true;
   //cmd.execute();
  }
  
  int _cmd_onmouseclick;
  Boolean __onmouseclick = false;
  public void onmouseclick( int type ) {
    _cmd_onmouseclick = type;
    __onmouseclick = true;
  }
  
  public void _onmouseclicked() {
      if ( __onmouseclick ) EXECUTE.it( _cmd_onmouseclick, this );
  }
  
  public void sayHi() {
   println( "HI! " + name ); 
  }
  
  public void onmousepressed() {
    println( "onmousepressed" );
    if( _ready ) commands[0].execute();
  }
  void mouseEvent(MouseEvent event) {
    switch( event.getID() ) {
      case MouseEvent.MOUSE_CLICKED:
        _onmouseclicked();
        break;
      }
  }

}

public class MyCommand implements Command {
   private Thing thing; 
   MyCommand( Thing thing ){
     this.thing = thing;
   } 
   
   public void execute() {
    thing.sayHi();
   }
   
   
}

Thing thing,
  thing2;
PApplet app = this;

void setup(){
  thing = new Thing();
  thing.name = "Sweeeet";
  thing2 = new Thing();
  //MyCommand test = new MyCommand( thing );
  //thing.storeAndExecute( doThis );
  thing.onmouseclick( EXECUTE.JUMP_UP );
}

void draw(){
  
}
