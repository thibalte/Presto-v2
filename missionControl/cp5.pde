// SVG Select button
public void SVGselect(int theValue) {
  if (frameCount>1)
  {
    selectInput("Select a file to print:", "fileSelected");
  }
}

// Print button
public void Print(int theValue) {
  if (frameCount>1)
  {
    // print routine
    if (pointPaths != null) 
    {
      // reset path index
      currentPath = 0;
      currentPoint = 0;
      // start print
      paused = false;
      onlySelected = false;
      // start first point
      nextPoint();
    }
  }
}

// Pause button
public void Pause(int theValue) {
  if (frameCount>1)
  {
    // Pause routine
    paused = !paused;
    if (paused) println("paused...");
    if (!paused && loaded) 
    {
      nextPoint();
    }
  }
}

// Stop button
public void Stop(int theValue) {
  if (frameCount>1)
  {
    // Stop routine
    paused = true;
    plotter.write("m5\n");
    println("stopped!");
  }
}

// Home button
public void Home(int theValue) {
  if (frameCount>1)
  {
    // Home routine
    paused = true;
    // send "go home" command
    plotter.write("m5\n");
    plotter.write("g0x0y0\n");
    println("going home...");
  }
}

// Refresh button
public void Refresh(int theValue) {
  if (frameCount>1)
  {
    // Refresh routine
    refresh();
  }
}

// PrintSelected button
public void PrintSelected(int theValue) {
  if (frameCount>1)
  {
    // PrintSelected routine
    if (pointPaths != null) 
    {
      // reset path point index
      currentPoint = 0;
      // start print
      paused = false;
      onlySelected = true;
      // start first point
      nextPoint();
    }
  }
}

// Preview button
public void Preview(int theValue) {
  if (frameCount>1)
  {
    if (pointPaths != null)
    {
      // Preview routine
      currentPath--;
      if (currentPath < 0) currentPath = pointPaths.length-1;
      println("path selected : "+currentPath);
      refresh();
      drawCurrentPath();
    }
  }
}

// Next button
public void Next(int theValue) {
  if (frameCount>1)
  {
    if (pointPaths != null)
    {
      // Next routine
      currentPath++;
      if (currentPath > pointPaths.length-1) currentPath = 0;
      println("path selected : "+currentPath);
      refresh();
      drawCurrentPath();
    }
  }
}


// file selector & path display
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("file selected : " + selection.getAbsolutePath());
    grp = RG.loadShape(selection.getAbsolutePath());
    pointPaths = grp.getPointsInPaths();
    noFill();
    
    refresh();
    
    loaded = true;
    paused = true;
    currentPath = 0;
    currentPoint = 0;    
    
  }
}
