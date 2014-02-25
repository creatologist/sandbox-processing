class Sprite {
   Sprite[] children;
   Sprite parent;
    
    
   Sprite(){}
}

class OtherSprite extends Sprite {
  OtherSprite(){}
  
  Sprite[] children = new Sprite[3];
  
  void addChild( Sprite s ) {
    children[0] = s;
  }
}
