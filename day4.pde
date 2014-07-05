import java.util.Calendar;

// please change this variables
int triangleWidth = 20;
int triangleHeight = 20;

int topX = triangleWidth;
int leftX = topX - triangleWidth;
int rightX = topX + triangleWidth; 
int topY = 0;
int bottomY = triangleHeight;
float h = 360;
float s = 360;
float b = 360;
int actRandomSeed = 0;

void setup()
{
  size(640, 640);
  background(255);
  colorMode(HSB);
  smooth();
  noStroke();
}

void draw()
{
  randomSeed(actRandomSeed);
  drawTriangles();
}

void drawTriangles()
{
  while (topX <= width)
  {
    fill(noise(h)*width/random(2), s / random(2, 3), b - noise(actRandomSeed));
    triangle(topX, topY, rightX, bottomY, leftX, bottomY);
    topX = topX + triangleWidth * 2;
    leftX = leftX + triangleWidth * 2;
    rightX = rightX + triangleWidth * 2;
    
    if (topX >= width && topY <= height)
    {
      topX = triangleWidth; 
      leftX = topX - triangleWidth;
      rightX = topX + triangleWidth; 
      topY = topY + triangleHeight;
      bottomY = bottomY + triangleHeight;
    }
  } 
}

void mousePressed() {
  actRandomSeed = (int) random(1000, 1000000);
}

void keyReleased(){
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
