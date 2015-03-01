void refresh()
{
  noFill();
  background(255);
  stroke(0);
  if (pointPaths != null)
  {
    for(int i = 0; i<pointPaths.length; i++){
      if (pointPaths[i] != null) {
        beginShape();
        for(int j = 0; j<pointPaths[i].length-1; j++){
          vertex(pointPaths[i][j].x*rescale, pointPaths[i][j].y*rescale);
          ellipse(pointPaths[i][j].x*rescale, pointPaths[i][j].y*rescale, 3, 3);
        }
        endShape();
      }
    }
  } 
  cp5.draw();
}

void drawCurrentPath()
{
  stroke(255, 255, 0);
  if (pointPaths[currentPath] != null) {
    beginShape();
    for(int i = 0; i<pointPaths[currentPath].length-1; i++){
      vertex(pointPaths[currentPath][i].x*rescale, pointPaths[currentPath][i].y*rescale);
      ellipse(pointPaths[currentPath][i].x*rescale, pointPaths[currentPath][i].y*rescale, 3, 3);
    }
    endShape();
  }
}
