void pivotBars() {
  float yPos = height/6;                // this will be the Y boundary for the beginning of the bars, above this will be buttons for the different sorting algorithms
  float leftBound = width/8;            // this space will be used for other functionality buttons such as Reset, Randomize Array, and Change Array Size
  float rectWidth = (width-leftBound)/(numOfBars*1.5);     // uses the working space and the amount of bars needed to set the size of the bars (gaps will be half a bar width)
  float rectSpace = (width-leftBound)/(numOfBars);
  float xPos1 = leftBound + (.25 * rectWidth) + (barHeightArrayDuplicate[1][animations[0][animationArrayPosition]] * rectSpace);
  float xPos2 = leftBound + (.25 * rectWidth) + (barHeightArrayDuplicate[1][animations[2][animationArrayPosition]] * rectSpace);
  float xPos3 = leftBound + (.25 * rectWidth) + (barHeightArrayDuplicate[1][animations[4][animationArrayPosition]] * rectSpace);
  fill(255);
  //stroke(1);
  rect(xPos1-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeightArrayDuplicate[0][animations[0][animationArrayPosition]]);
  rect(xPos2-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeightArrayDuplicate[0][animations[2][animationArrayPosition]]);
  rect(xPos3-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeightArrayDuplicate[0][animations[4][animationArrayPosition]]);
  fill(color(#DA3E52));
  rect(xPos1, yPos, rectWidth, barHeightArrayDuplicate[0][animations[0][animationArrayPosition]]);
  rect(xPos2, yPos, rectWidth, barHeightArrayDuplicate[0][animations[2][animationArrayPosition]]);
  fill(color(#96E6B3));
  rect(xPos3, yPos, rectWidth, barHeightArrayDuplicate[0][animations[4][animationArrayPosition]]);
  if (animations[2][animationArrayPosition] < animations[4][animationArrayPosition]) {
    println("array position: " + animationArrayPosition);
    if (animations[3][animationArrayPosition] < animations[5][animationArrayPosition]) { 
      int temp = barHeightArrayDuplicate[0][animations[0][animationArrayPosition]]; //pull low
      println("swap left value " + temp + " with right value " + barHeightArrayDuplicate[0][animations[2][animationArrayPosition]]);
      barHeightArrayDuplicate[0][animations[0][animationArrayPosition]] = barHeightArrayDuplicate[0][animations[2][animationArrayPosition]];
      barHeightArrayDuplicate[0][animations[2][animationArrayPosition]] = temp;
    }
  } else if (barHeightArrayDuplicate[0][animations[0][animationArrayPosition]]!= barHeightArrayDuplicate[0][animations[4][animationArrayPosition]]) {
    println("array position: " + animationArrayPosition);
    int temp = barHeightArrayDuplicate[0][animations[0][animationArrayPosition]]; //pull low
    println("swap left value " + temp + " with pivot " + barHeightArrayDuplicate[0][animations[4][animationArrayPosition]]);
    barHeightArrayDuplicate[0][animations[0][animationArrayPosition]] = barHeightArrayDuplicate[0][animations[4][animationArrayPosition]];
    barHeightArrayDuplicate[0][animations[4][animationArrayPosition]] = temp;
  }

  // issue is with the edge case of swapping the pivot with the bar next to it because the i+1 ensures it actually doesnt swap
  animationArrayPosition++;
}
