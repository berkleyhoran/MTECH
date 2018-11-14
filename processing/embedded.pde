int cols, rows;
int gridw = 1700;
int gridh = 1700;
int scl = 10;
float [][] terrain;

float flying = 0;

import peasy.*;
PeasyCam cam;

void setup(){
   size(1000, 1000, P3D);
   cols = gridw/ scl;
   rows = gridh/ scl;
   terrain = new float[cols][rows];
   cam = new PeasyCam(this, -700, -1000, 750, 100);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(2000);
   
}

void draw(){
  flying -= .05;
  float yoff = flying;
   for(int s = 0; s < rows; s++){
     float xoff = 0.0;
    for(int k = 0; k < cols; k++){
      terrain[k][s] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  rotateX(PI/4);
  translate(-1600, -2000, 200);
  background(255, 204, 0);
  for(int s = 0; s < rows; s++){
    for(int k = 0; k < cols; k++){
      line(k*scl, s*scl, terrain[k][s], k*scl + scl, s*scl + scl, terrain[k][s]);
      line(k*scl + scl/2, s*scl + scl/2, terrain[k][s] + scl/2, k*scl + scl + scl/2, s*scl + scl + scl/2, terrain[k][s]+ scl/2);
      
    }
  
  }

}
