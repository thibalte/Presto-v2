void nextPoint()
{
  // println("printing...");
  
  if (pointPaths[currentPath] != null) { // be sure there is something to plot
    if (pointPaths[currentPath].length >= currentPoint) // be sure the current point exists
    {
      fill(255, 0, 0);
      stroke(255, 0, 0); // red to see what we are doing
      currentX = pointPaths[currentPath][currentPoint].x*rescale;
      currentY = pointPaths[currentPath][currentPoint].y*rescale;
      // ellipse(currentX, currentY, 3, 3); // draw the current point on screen
      line(currentX, currentY, Math.round(pointPaths[currentPath][currentPoint+1].x*rescale), Math.round(pointPaths[currentPath][currentPoint+1].y*rescale));
      plotter.write("g0x"+currentX+"y"+currentY+"\n"); // send point coords to plotter
      if (currentPoint == 0) plotter.write("m3\n"); // if first point of path, lower tool
      // println("g0x"+currentX+"y"+currentY+"\n"); // send point coords to plotter
      
      if (pointPaths[currentPath].length-2 == currentPoint) // Ignore last point (duplicated) and check if we have finished drawing the current path
      {
        plotter.write("m4\n");
        currentPoint = 0; // if we go to the next path, reset the current point index
        if (pointPaths.length-1 > currentPath && !onlySelected)  // if the next path exists
        {
          currentPath++; // go to next path
        } else {
          if (!onlySelected) currentPath = 0; // reset current path for next print
          paused = true; // we pause the print
          println("finished!"); 
        }
      } else {
        currentPoint ++; // if nothing comes up, go to the next point
      }
    }
  }
  
}

void serialEvent(Serial plotter){
  String temp = plotter.readString();
  if (temp.trim().startsWith("ok")){
    if (!paused) nextPoint(); 
  } else if (temp.trim().startsWith("Grbl")) {
    plotter.write("m4\n");
  }
  println(temp);
}

