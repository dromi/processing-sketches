float branchLength = 100;
int generations = 2;
int branchNo = 2;
float scale = 0.75;

color trunkColor = color(139,69,19);
color leafColor = color(28, 155, 3);
color skyBG = color(0, 102, 153);


void setup(){
  size(600,600);
}

void draw(){
  translate(width/2,height);
  background(skyBG);
  branch(generations, branchLength);
}

void mousePressed() {
  if (mouseButton == LEFT){
    generations++;
  } else if (mouseButton == RIGHT){
    branchNo++;
  }
}


void branch(int g, float l){
  if (g <= 0){
    return;
  }
  
  float angle = map(mouseX, 0, width, -PI, PI);
  float w = map(g, 0, generations, 1, 10);


  float lars = pow(float(g)/float(generations),2); //<>//

  color lala = lerpColor(leafColor, trunkColor, lars);
  
  stroke(lala);
  strokeWeight(w);

  line(0,0,0,-l);
  translate(0,-l);


  for(int i = 0; i < branchNo; i++){
    pushMatrix();
    float a = map(i, 0, branchNo-1, -angle, angle);
    rotate(a);
    branch(g-1, l*scale);
    popMatrix();
  }  
}