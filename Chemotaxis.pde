//10/20/17 Sam Powers Chemotaxis with minimal support from Andrew Smith.
//Declaring all the variables used.
int foodX;
int foodY;
int x = 250;
int y = 100;
int randomNumX;
int randomNumY;
int num = 0;
int mouseCounter = 0;
int circleSize = 0;
int keyCounter = 0;


Bacteria[] myBacteria;


void setup() {
  size(500, 500);
  background(255);
  
  //Filling the "Apartments".
  myBacteria = new Bacteria[5];
  for (int y = 100; y <= 500; y += 100) {
    for (int x = 250; x == 250; x++) {
      myBacteria[num] = new Bacteria(x, y);
      num++;
    }
  }
}

void draw() {
  background(255);
  
  //Calling the methods.
  for (int j = 0; j < myBacteria.length; j++) {    
    myBacteria[j].walk();
    myBacteria[j].show();
  }
}

class Bacteria { 
  int x;
  int y;
  Bacteria(int _x, int _y) {
    x = _x;
    y = _y;
  }


  void walk() {
    //Allows the bacteria to do a random walk around the screen.
    randomNumX = (int) (Math.random() * 3) - 1;
    randomNumY = (int) (Math.random() * 3) - 1;
    x += randomNumX;
    y += randomNumY;
    
    //Checks if the mouse was pressed and goes toward the food with a biased "random" walk.
    if (mouseCounter > 0 && circleSize != 0) {
      if (foodX < x) {
        x -= (int) (Math.random() * 10) - 3;
      } else if (foodX > x) {
        x += (int) (Math.random() * 10) - 3;
      } else {
      }

      if (foodY < y) {
        y -= (int) (Math.random() * 10) - 3;
      } else if (foodY > y) {
        y += (int) (Math.random() * 10) - 3;
      } else {
      }
      //Every time the bacteria hover over the food, the size of the food decreases.
      if (foodX == x && foodY == y && circleSize != 0) {
        circleSize--;
      } else {
      }
    }
  }

  void show() {
    //Shows the bacteria and the food.
    fill(0);
    stroke(255);
    ellipse(x, y, 20, 20);
    if (mouseCounter > 0) {
      noFill();
      stroke(0);
      ellipse(foodX, foodY, circleSize, circleSize);
    }
  }
}
void mousePressed () {
  //Food is created if the mouse is pressed. The food is placed where the mouse is clicked. This also controls the amount of circles on the screen at once.
  if (circleSize == 0){
    circleSize = 10;
    foodX = mouseX;
    foodY = mouseY; 
    mouseCounter++;
  }
}
void keyPressed() {
  
  //Allows the food size to increase when specific keys are pressed.
  if (keyCounter < 3 || circleSize < 20) {
    for (int loop = 48; loop <= 57; loop++) {
      if (keyCode == loop && keyCode != 57 && keyCode != 56 && keyCode != 55) {
        circleSize = circleSize * (loop - 48);
      }
    }
  }else{
  }
  //If the circle size is less than 20, the keyCounter variable resets (allowing new keys to be pressed to increase the food size).
  if (circleSize < 20){
    keyCounter = 0;
  }
  keyCounter++;
}
