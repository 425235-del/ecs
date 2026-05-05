//Caleb Taylor | 3/17/26 | EtchaSketch
int x, y;
PImage e1;
float hue = 0;

void setup() {
  size(1001, 818);
  colorMode(HSB, 360, 100, 100); 
  x = 100;
  y = height / 2;
  point(x, y);
  e1 = loadImage("etch.png");
}

void draw() {
  hue = (hue + 1) % 360; 
  image(e1,0,0);
  strokeWeight(3);
}

void keyPressed() {
  stroke(hue, 80, 80); 
  
  if (keyCode == RIGHT) {
    moveR(8);
  } else if (keyCode == LEFT) {
    moveL(8);
  } else if (keyCode == UP) {
    moveU(8);
  } else if (keyCode == DOWN) {
    moveD(8);
  }
  
  if (key == 's' || key == 'S') {
    saveFrame("myArt-######.png");
    println("Frame Saved!");
  }
  
  if (key == 'c' || key == 'C') {
    background(200);
  }
}


void moveR(int l) {
  line(x,y,x+l,y);
  x+=l;
}

void moveL(int l) {
  line(x,y,x-l,y);
  x-=l;
}

void moveU(int l) {
  line(x, y, x, y - l);
  y -= l;
}

void moveD(int l) {
  line(x, y, x, y + l);
  y += l;
}

void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x = x + rep;
}
