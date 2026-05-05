//Caleb Taylor | 31 Mar 2026 | Mini Project
int rows = 8;
int cols = 10;
float w, h;
boolean[][] wall;
int[][] colors;

int score = 0;
int startTime;
int timeLimit = 22;
boolean gameOver = false;

void setup() {
  size(600, 600);
  w = width / cols;
  h = 35; 
  initWall();
}

void draw() {
  background(30);
  
  int elapsed = (millis() - startTime) / 1000;
  int remaining = timeLimit - elapsed;
  
  if (remaining <= 0) {
    remaining = 0;
    gameOver = true;
  }
  
  //UI / SCOREBOARD
  fill(255);
  textSize(20);
  text("Score: " + score, 20, 30);
  
  if (remaining < 5) fill(255, 0, 0); 
  textAlign(RIGHT);
  text("Time Left: " + remaining + "s", width - 20, 40);
  textAlign(LEFT);
  
  // DRAW WALL
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if (wall[r][c]) {
        fill(colors[r][c]);
        stroke(0);
        rect(c * w, 70 + (r * h), w, h);
      }
    }
  }
  
  if (gameOver) {
    fill(0, 200);
    rect(0, 0, width, height);
    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("TIME'S UP!", width/2, height/2 - 50);
    textSize(20);
    text("Final Score: " + score, width/2, height/2 + 10);
  }
  //RESET BUTTON
  fill(80);
  stroke(255);
  rect(width/2 - 50, height - 60, 100, 40, 10);
  fill(255);
  textAlign(CENTER, CENTER);
  text("RESET", width/2, height - 35);
  textAlign(LEFT, BASELINE);
}

void mousePressed() {
if (!gameOver) {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        float blockY = 70 + (r * h);
        if (wall[r][c] && mouseX > c * w && mouseX < (c + 1) * w && 
            mouseY > blockY && mouseY < blockY + h) {
          
          wall[r][c] = false; 
          score += 10;
        }
      }
    }
  }
  
 if (mouseX > width/2 - 50 && mouseX < width/2 + 50 && 
      mouseY > height - 60 && mouseY < height - 20) {
    initWall();
  }
}

void initWall() {
  wall = new boolean[rows][cols];
  colors = new int[rows][cols];
  score = 0;
  startTime = millis(); 
  gameOver = false;
  
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      wall[r][c] = true;
      colors[r][c] = color(random(50, 200), random(50, 200), 255); // Cool blue-ish theme
    }
  }
}
