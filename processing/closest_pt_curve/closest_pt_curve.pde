PVector[] pts;

void setup() {
  size( 800, 500 );
  pts = new PVector[4];
  pts[0] = new PVector( 100, 800, 0 );
  pts[1] = new PVector( 100, 200, 0 );
  pts[2] = new PVector( 700, 200, 0 );
  pts[3] = new PVector( 700, -800, 0 );
  stroke( #ff3333 );
  strokeWeight( 3 );
  fill( 0, 0 );
}

void draw() {
   background( 0 );
   curve( pts[0].x, pts[0].y, pts[1].x, pts[1].y, pts[2].x, pts[2].y, pts[3].x, pts[3].y );
   PVector cpt = ClosestPointOnCatmullRom( pts, new PVector( mouseX, mouseY, 0 ), 20 );
   ellipse( cpt.x, cpt.y, 10, 10 );
}

PVector ClosestPointOnCatmullRom(PVector [] cps, PVector pt, int ndivs) {
  PVector result = new PVector();
  float bestDistanceSquared = 0;
  float bestT = 0;
  for (int i=0; i<=ndivs; i++) {
    float t = (float)(i) / (float)(ndivs);
    float x = curvePoint(cps[0].x,cps[1].x,cps[2].x,cps[3].x,t);
    float y = curvePoint(cps[0].y,cps[1].y,cps[2].y,cps[3].y,t);
    float dx = x - pt.x;
    float dy = y - pt.y;
    float dissq = dx*dx+dy*dy;
    if (i==0 || dissq < bestDistanceSquared) {
      bestDistanceSquared = dissq;
      bestT = t;
      result.set(x,y,0);
    }
  }
  return result;
}

