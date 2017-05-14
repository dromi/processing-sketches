class MovingPoint { 
  float positionX;
  float positionY;
  color colour;
  int directionX;
  int directionY;
  float translationX;
  float translationY;
  int weight;
  int alpha;
  
  MovingPoint (float pos_x, float pos_y, color c, int w, int a) {  
    positionX = pos_x;
    positionY = pos_y;
    colour = c;
    directionX = 0;
    directionY = 0;
    translationX = 0;
    translationY = 0;
    weight = w;
    alpha = a;
  } 
  
  public void drawLine(float x, float y){
    float l = lineLength(x, y);
    strokeWeight(weight*l/width);
    stroke(colour,alpha);
    fill(colour,alpha);
    
    line(x, y, positionX + translationX, positionY + translationY);
    ellipse(positionX + translationX, positionY + translationY, 10*l/width, 10*l/width);
  }

  public void calculateTranslation(float move){
    // X Translation
    Float newTranslationX = translationX + (directionX * move); //<>//
    if (newTranslationX + positionX > width){
      directionX = -1;
      newTranslationX = translationX + (directionX * move);
    } else if (newTranslationX + positionX < 0){
      directionX = 1;
      newTranslationX = translationX + (directionX * move);
    }
    translationX = newTranslationX;
    
    // Y Translation
    Float newTranslationY = translationY + (directionY * move);
    if (newTranslationY + positionY > height){
      directionY = -1;
      newTranslationY = translationY + (directionY * move);
    } else if (newTranslationY + positionY < 0){
      directionY = 1;
      newTranslationY = translationY + (directionY * move);
    }
    translationY = newTranslationY;
  }
 
  private float lineLength(float x, float y){
    float deltaX = x - (positionX + translationX);
    float deltaY = x - (positionY + translationY);
    float dist = sqrt(pow(deltaX, 2) + pow(deltaY, 2));
    return dist;
  }
} 