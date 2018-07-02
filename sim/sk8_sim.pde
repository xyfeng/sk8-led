import processing.video.*;
int tileCount;
float rectSize;
int drawMode = 1;

Movie myMovie;

void setup() {
  size(1280, 256);
  background(255);
  noStroke();

  tileCount = 80;
  rectSize = width/ tileCount;

  myMovie = new Movie(this, "SK8-bit.mp4");
  myMovie.loop();
}

void draw() {
  background(0);

  for (int gridX=0; gridX < tileCount; gridX++ ) {
    for ( int gridY=0; gridY < tileCount; gridY++ ) {
      int px = (int)( gridX * rectSize );
      int py = (int)( gridY * rectSize );
      color c = myMovie.get(px, py);
      float rectX = gridX * rectSize;
      float rectY = gridY * rectSize;
      float centerX = rectX + rectSize/2;
      float centerY = rectY + rectSize/2 - 240;
      float ellipseSize = 12;

      fill(c);
      noStroke();
      ellipse(centerX, centerY, ellipseSize, ellipseSize);
    }
  }
}

void movieEvent(Movie m) {
  m.read();
}