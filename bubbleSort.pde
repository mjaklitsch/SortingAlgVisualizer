int bubbleCurIndex = 0;
int sortedToIndex;
boolean hasSwapped = false;


void bubbleSorter() {
  background(255);
  drawBars(barHeightArrayDuplicate);
  if (bubbleCurIndex < sortedToIndex) {
    float yPos = height/6;                // this will be the Y boundary for the beginning of the bars, above this will be buttons for the different sorting algorithms
    float leftBound = width/8;            // this space will be used for other functionality buttons such as Reset, Randomize Array, and Change Array Size
    float rectWidth = (width-leftBound)/(numOfBars*1.5);     // uses the working space and the amount of bars needed to set the size of the bars (gaps will be half a bar width)
    float rectSpace = (width-leftBound)/(numOfBars);
    float xPos1 = leftBound + (.25 * rectWidth) + (barHeightArrayDuplicate[1][bubbleCurIndex] * rectSpace);
    float xPos2 = leftBound + (.25 * rectWidth) + (barHeightArrayDuplicate[1][bubbleCurIndex+1] * rectSpace);
    fill(255);
    //stroke(1);
    rect(xPos1-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeightArrayDuplicate[0][bubbleCurIndex]);
    rect(xPos2-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeightArrayDuplicate[0][bubbleCurIndex+1]);
    fill(color(#DA3E52));
    rect(xPos1, yPos, rectWidth, barHeightArrayDuplicate[0][bubbleCurIndex]);
    rect(xPos2, yPos, rectWidth, barHeightArrayDuplicate[0][bubbleCurIndex+1]);

    if (barHeightArrayDuplicate[0][bubbleCurIndex] > barHeightArrayDuplicate[0][bubbleCurIndex+1]) {
      flip();
      hasSwapped = true;
      bubbleCurIndex++;
    } else {
      bubbleCurIndex++;
    }
  } else {
    if (!hasSwapped) {
      bubbleCurIndex = 0;
      stopSort();
    } else {
      bubbleCurIndex = 0;
      hasSwapped = false;
      sortedToIndex--;
    }
  }
}

void flip() {
  float yPos = height/6;                // this will be the Y boundary for the beginning of the bars, above this will be buttons for the different sorting algorithms
  float leftBound = width/8;            // this space will be used for other functionality buttons such as Reset, Randomize Array, and Change Array Size
  float rectWidth = (width-leftBound)/(numOfBars*1.5);     // uses the working space and the amount of bars needed to set the size of the bars (gaps will be half a bar width)
  float rectSpace = (width-leftBound)/(numOfBars);
  float xPos1 = leftBound + (.25 * rectWidth) + (barHeightArrayDuplicate[1][bubbleCurIndex] * rectSpace);
  float xPos2 = leftBound + (.25 * rectWidth) + (barHeightArrayDuplicate[1][bubbleCurIndex+1] * rectSpace);
  fill(255);
  //stroke(1);
  rect(xPos1-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeightArrayDuplicate[0][bubbleCurIndex]);
  rect(xPos2-(.125*rectSpace), yPos, rectWidth+(.25*rectSpace), barHeightArrayDuplicate[0][bubbleCurIndex+1]);
  fill(color(#DA3E52));
  rect(xPos1, yPos, rectWidth, barHeightArrayDuplicate[0][bubbleCurIndex+1]);
  rect(xPos2, yPos, rectWidth, barHeightArrayDuplicate[0][bubbleCurIndex]);

  int tempHeightHold = barHeightArrayDuplicate[0][bubbleCurIndex+1];
  barHeightArrayDuplicate[0][bubbleCurIndex+1] = barHeightArrayDuplicate[0][bubbleCurIndex];
  barHeightArrayDuplicate[0][bubbleCurIndex] = tempHeightHold;
}
