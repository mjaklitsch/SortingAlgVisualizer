void swapBars(int curStage, int index1, int barHeight1, int index2, int barHeight2) {

  float yPos = height/6;                // this will be the Y boundary for the beginning of the bars, above this will be buttons for the different sorting algorithms
  float leftBound = width/8;            // this space will be used for other functionality buttons such as Reset, Randomize Array, and Change Array Size
  float rectWidth = (width-leftBound)/(numOfBars*1.5);     // uses the working space and the amount of bars needed to set the size of the bars (gaps will be half a bar width)
  float rectSpace = (width-leftBound)/(numOfBars);
  float xPos1 = leftBound + (.25 * rectWidth) + (index1 * rectSpace);
  float xPos2 = leftBound + (.25 * rectWidth) + (index2 * rectSpace);
  if (index1 != index2) {
    if (curStage == 0) { // start, highlight

      fill(255);
      //stroke(1);
      rect(xPos1-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeight1);
      rect(xPos2-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeight2);
      fill(color(#DA3E52));
      rect(xPos1, yPos, rectWidth, barHeight1);
      rect(xPos2, yPos, rectWidth, barHeight2);
    } else if (curStage == 1) { // swap

      fill(255);
      //stroke(1);
      rect(xPos1-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeight1);
      rect(xPos2-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeight2);
      if (barHeight1 > barHeight2) { //  swap is necessary
        for (int i = index2; i > index1; i--) {
          barHeightArrayDuplicate[0][i] = barHeightArrayDuplicate[0][i-1];
        }
        barHeightArrayDuplicate[0][index1] = barHeight2;

        //for (int i = 0; i < numOfBars; i++) {
        //  float tempXPos = leftBound + (.25 * rectWidth) + (i * rectSpace);
        //  fill(255);
        //  rect(tempXPos-.5, yPos, rectWidth+1, height);
        //  fill(#8ED0FF);
        //  rect(tempXPos, yPos, rectWidth, barHeightArrayDuplicate[0][i]);
        //  // println("Draw Bar from dup array: " + barHeightArrayDuplicate[0][i]);
        //}
        
        drawBars(barHeightArrayDuplicate);
      } else { //swap is unnecessary
        fill(color(#DA3E52));
        rect(xPos1, yPos, rectWidth, barHeight1);
        rect(xPos2, yPos, rectWidth, barHeight2);
      }
    } else if (curStage == 2) { // de-highlight, reset

      fill(255);
      //stroke(1);
      rect(xPos1-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeight1);
      rect(xPos2-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeight2);
      fill(#8ED0FF); // standard blue bar
      if (barHeight1 > barHeight2) { //  swap occurred
        rect(xPos1, yPos, rectWidth, barHeight2);
        rect(xPos2, yPos, rectWidth, barHeight1);
      } else { //swap did not occur
        rect(xPos1, yPos, rectWidth, barHeight1);
        rect(xPos2, yPos, rectWidth, barHeight2);
      }
    } else {
      println("error at timer stage recording for swapBars animation");
    }
    // delay(1);
  }
}
