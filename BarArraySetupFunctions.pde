void randomizeBars() {
  println("randomize bars");
  if (setupIsDone) {
    stopSort();
  }
  for (int i = 0; i < numOfBars; i++) {
    int val = int(random((.05 * height), (.5 * height)));
    barHeightArray[0][i] = val;
    barHeightArray[1][i] = i;
    barHeightArrayDuplicate[0][i] = val;
    barHeightArrayDuplicate[1][i] = i;
  }
  background(255);
  drawBars(barHeightArray);
}

void drawBars(int arr[][]) {
  background(255);
  //println("drawbars");
  float yPos = height/6;                // this will be the Y boundary for the beginning of the bars, above this will be buttons for the different sorting algorithms
  float leftBound = width/8;            // this space will be used for other functionality buttons such as Reset, Randomize Array, and Change Array Size
  float rectWidth = (width-leftBound)/(numOfBars*1.5);     // uses the working space and the amount of bars needed to set the size of the bars (gaps will be half a bar width)
  float rectSpace = (width-leftBound)/(numOfBars);
  for (int i = 0; i < numOfBars; i++) {
    float xPos = leftBound + (.25 * rectWidth) + (i * rectSpace);
    fill(#8ED0FF); // standard blue bar
    noStroke();
    rect(xPos, yPos, rectWidth, arr[0][i]);
  }
}
