class CircleMesh {
  constructor(x_d, y_d, d_min, d_max) {
    this.circles = [];
    this.d_min = d_min;
    this.d_max = d_max;
    for(let i=0;i<x_d;i++){
      for(let j=0;j<x_d;j++){
        var x= width/x_d * i + (width/x_d/2);
        var y=height/y_d * j + (width/y_d/2);
        this.circles.push(new Circle(x, y));
      }
    }
  }

  move() {
    for (let c of this.circles) {
      const speed = map((c.c[0] + c.c[1] + c.c[2])/3, 0, 255, 5, 0);
      const r = [-1, 0, 1];
      c.x = (c.x + random(r) * speed) % width;
      c.y = (c.y + random(r) * speed) % height;
    }
  }

  draw() {
    for (let c of this.circles) {
      var col=cam.get(c.x,c.y);
      c.draw(col, this.d_min, this.d_max);
    }
  }
}

class Circle {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    this.c = [0, 0, 0];
  }

  draw(c, d_min, d_max) {
    var colorValues = (c[0] + c[1] + c[2])/3;
    var d = map(colorValues, 0, 255, d_max, d_min);
    fill(c);
    ellipse(this.x,this.y,d,d);
    this.c = c;
  }
}