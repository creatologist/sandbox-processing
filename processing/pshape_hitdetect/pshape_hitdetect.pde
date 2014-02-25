PShape s;
float scale = 1.0;
void setup() {
  size( 500, 500, P2D );
  s = createShape();
  //pShape.beginContour();
  s.vertex( 0, 0 );
  s.vertex( 0, 50 );
  s.vertex( 50, 50 );
  s.vertex( 50, 0 );
  s.end( CLOSE );
  println( s.getVertexCount() );
}

void draw() {
  background( 0 );
  fill( 255, 0, 0 );
  s.rotate( 0.01 );
  scale += .0001;
  s.scale( scale );
  shape( s, 100, 100 );
  
}
