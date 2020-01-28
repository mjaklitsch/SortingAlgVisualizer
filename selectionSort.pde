int selectionSortedIndex = 0;
int selectionCurIndex = 0;
int selectionCompareIndex = 0;

void selectionSorter() {
  drawBars(barHeightArrayDuplicate);
  if (selectionSortedIndex < numOfBars) {
    if (selectionCompareIndex < numOfBars) {
      float yPos = height/6;                // this will be the Y boundary for the beginning of the bars, above this will be buttons for the different sorting algorithms
      float leftBound = width/8;            // this space will be used for other functionality buttons such as Reset, Randomize Array, and Change Array Size
      float rectWidth = (width-leftBound)/(numOfBars*1.5);     // uses the working space and the amount of bars needed to set the size of the bars (gaps will be half a bar width)
      float rectSpace = (width-leftBound)/(numOfBars);
      float xPos1 = leftBound + (.25 * rectWidth) + (barHeightArrayDuplicate[1][selectionCurIndex] * rectSpace);
      float xPos2 = leftBound + (.25 * rectWidth) + (barHeightArrayDuplicate[1][selectionCompareIndex] * rectSpace);
      fill(255);
      //stroke(1);
      rect(xPos1-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeightArrayDuplicate[0][selectionCurIndex]);
      rect(xPos2-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeightArrayDuplicate[0][selectionCompareIndex]);
      fill(color(#DA3E52));
      rect(xPos1, yPos, rectWidth, barHeightArrayDuplicate[0][selectionCurIndex]);
      rect(xPos2, yPos, rectWidth, barHeightArrayDuplicate[0][selectionCompareIndex]);
      if (barHeightArrayDuplicate[0][selectionCurIndex] < barHeightArrayDuplicate[0][selectionCompareIndex]) {
        selectionCompareIndex++;
      } else {
        selectionCurIndex = selectionCompareIndex;
        selectionCompareIndex++;
      }
    } else {
      int temp = barHeightArrayDuplicate[0][selectionCurIndex];
      println(temp);
      for (int i = selectionCurIndex; i > selectionSortedIndex; i--) {
        barHeightArrayDuplicate[0][i] = barHeightArrayDuplicate[0][i-1];
      }
      barHeightArrayDuplicate[0][selectionSortedIndex] = temp;
      drawBars(barHeightArrayDuplicate);
      selectionSortedIndex++;
      selectionCurIndex = selectionSortedIndex;
      selectionCompareIndex = selectionSortedIndex;
    }
  } else {
    stopSort();
  }
}
