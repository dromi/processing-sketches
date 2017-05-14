// sketch parameters:
int weightConst = 3;
int alphaConst = 100;
Float moveConst = 10.0;

ArrayList<MovingPoint> points;
boolean isMoving;

void setup () {
  size(800, 800);
  points = new ArrayList<MovingPoint>();
  isMoving = false;
}

void draw () {
  background(0);
  
  if (mouseButton == LEFT){
    color c = color(random(255),random(255),random(255));
    points.add(new MovingPoint(mouseX, mouseY, c, weightConst, alphaConst));
  } else if (mouseButton == RIGHT){
    points = new ArrayList<MovingPoint>();
    isMoving = false;
  }
  
  //Draw Points
  for (int i = 0; i < points.size(); i++){
    MovingPoint p = points.get(i);
    if (isMoving){
      p.calculateTranslation(moveConst); //<>//
    }
    p.drawLine(mouseX, mouseY);
  }
}

void keyPressed() {
  if (key == ' ') {
    isMoving = !isMoving;
  } else if (key == CODED){
    switch(keyCode) {
      case UP:
        for (int i = 0; i < points.size(); i++){
          MovingPoint p = points.get(i);
          p.directionY = -1;
        }
        break;
      case DOWN: 
        for (int i = 0; i < points.size(); i++){
          MovingPoint p = points.get(i);
          p.directionY = 1;
        }
        break;
    case LEFT: 
        for (int i = 0; i < points.size(); i++){
          MovingPoint p = points.get(i);
          p.directionX = -1;
        }
      break;
    case RIGHT: 
        for (int i = 0; i < points.size(); i++){
          MovingPoint p = points.get(i);
          p.directionX = 1;
        }
      break;
    }
  }
}