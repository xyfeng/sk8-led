import processing.video.*;
int tileCount;
float rectSize;
int drawMode = 1;

Movie myMovie;

void setup() {
  size(1280, 16);
  background(255);
  noStroke();

  tileCount = 80;
  rectSize = width/ tileCount;

  myMovie = new Movie(this, "SK8-bit.mp4");
  myMovie.loop();
  frameRate(12);
}

void draw() {
  background(255);

  for (int gridX=0; gridX < 80; gridX++ ) {
    for ( int gridY=0; gridY < 16; gridY++ ) {
      int px = (int)( gridX * rectSize );
      int py = (int)( (gridY + 16)* rectSize );
      color c = myMovie.get(px, py);
      fill(c);
      rect(gridX, gridY, 1, 1);
    }
  }
  saveFrame("sk8-######.png");
}

void movieEvent(Movie m) {
  m.read();
}