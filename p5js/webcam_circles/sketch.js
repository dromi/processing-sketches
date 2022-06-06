let cam;
const x_d = 40;
const y_d = 40;
const bg = 255;

let circleMesh;


function setup() {
  createCanvas(600, 400);
  cam=createCapture(VIDEO);
  cam.size(width, height);
  background(bg);
  const m = min(width, height)
  const d_min = m/x_d * 0.1;
  const d_max = m/x_d * 1.1;
  circleMesh = new CircleMesh(x_d, y_d, d_min, d_max);
  noStroke();
  cam.hide();
}
 
function draw() {
  background(bg);
  circleMesh.move();
  circleMesh.draw();  
}
