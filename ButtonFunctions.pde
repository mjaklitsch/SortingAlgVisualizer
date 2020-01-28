void doSort() {
  if (mergeActive||quickActive||bubbleActive||selectionActive) {
    frameRate(240);
    pause.setColorBackground(color(#7E6B8F))
      .setColorForeground(color(#8D78A0))
      .setColorActive(color(#9D85B2));
    doSort.setColorBackground(color(90, 90, 90))
      .setColorForeground(color(90, 90, 90))
      .setColorActive(color(90, 90, 90));
    if (mergeActive) {
      drawState = 1;
    } else if (selectionActive) {
      drawState = 2;
    } else if (quickActive) {
      drawState = 3;
    } else if (bubbleActive) {
      drawState = 4;
    }
  }
}

void mergeSort() {
  stopSort();
  numOfAnimations = 0;
  mergeActive = true;
  mergeSort.setColorBackground(#9D85B2);
  selectionActive = false;
  selectionSort.setColorBackground(#7E6B8F);
  quickActive = false;
  quickSort.setColorBackground(#7E6B8F);
  bubbleActive = false;
  bubbleSort.setColorBackground(#7E6B8F);
  doSort.setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));
  stopSort.setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));
  pause.setColorBackground(color(90, 90, 90))
    .setColorForeground(color(90, 90, 90))
    .setColorActive(color(90, 90, 90));
  //printHeightArray();
  mergeSortCount(barHeightArrayDuplicate, 0, numOfBars-1);
  for (int i = 0; i < numOfBars; i++) {
    int val = barHeightArray[0][i];
    barHeightArrayDuplicate[0][i] = val;
    barHeightArrayDuplicate[1][i] = i;
  }
  println("set up animation array: " + numOfAnimations);
  animations = new int[4][numOfAnimations];
  //printHeightArray();
  mergeSortAnimate(barHeightArray, 0, numOfBars-1);
}

void selectionSort() {
  stopSort();
  mergeActive = false;
  mergeSort.setColorBackground(#7E6B8F);
  selectionActive = true;
  selectionSort.setColorBackground(#9D85B2);
  quickActive = false;
  quickSort.setColorBackground(#7E6B8F);
  bubbleActive = false;
  bubbleSort.setColorBackground(#7E6B8F);
  doSort.setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));
  stopSort.setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));
  pause.setColorBackground(color(90, 90, 90))
    .setColorForeground(color(90, 90, 90))
    .setColorActive(color(90, 90, 90));
}

void quickSort() {
  stopSort();
  quickSorterInitialize(0, numOfBars-1);
  println(numOfAnimations);
  for (int i = 0; i < numOfBars; i++) {
    int val = barHeightArray[0][i];
    barHeightArrayDuplicate[0][i] = val;
    barHeightArrayDuplicate[1][i] = i;
  }
  animations = new int[6][numOfAnimations];
  quickSorter(0, numOfBars-1);
  animationArrayPosition = 0;
  mergeActive = false;
  mergeSort.setColorBackground(#7E6B8F);
  selectionActive = false;
  selectionSort.setColorBackground(#7E6B8F);
  quickActive = true;
  quickSort.setColorBackground(#9D85B2);
  bubbleActive = false;
  bubbleSort.setColorBackground(#7E6B8F);
  doSort.setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));
  stopSort.setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));
  pause.setColorBackground(color(90, 90, 90))
    .setColorForeground(color(90, 90, 90))
    .setColorActive(color(90, 90, 90));
}

void bubbleSort() {
  stopSort();
  sortedToIndex = numOfBars-1;
  mergeActive = false;
  mergeSort.setColorBackground(#7E6B8F);
  selectionActive = false;
  selectionSort.setColorBackground(#7E6B8F);
  quickActive = false;
  quickSort.setColorBackground(#7E6B8F);
  bubbleActive = true;
  bubbleSort.setColorBackground(#9D85B2);
  doSort.setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));
  stopSort.setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));
  pause.setColorBackground(color(90, 90, 90))
    .setColorForeground(color(90, 90, 90))
    .setColorActive(color(90, 90, 90));
}

void stopSort() {
  if (mergeActive||quickActive||bubbleActive||selectionActive) {
    drawState=0;
    animationLocation = 0;
    stage = 0;
    animationArrayPosition = 0;
    numOfAnimations = 0;
    bubbleCurIndex = 0;
    hasSwapped = false;
    selectionSortedIndex = 0;
    selectionCurIndex = 0;
    selectionCompareIndex = 0;
    frameRate(30);
    for (int i = 0; i < numOfBars; i++) {
      barHeightArray[0][i] = barHeightArrayDuplicate[0][i];
    }
    println("stopsort");
    mergeActive = false;
    mergeSort.setColorBackground(#7E6B8F);
    selectionActive = false;
    selectionSort.setColorBackground(#7E6B8F);
    quickActive = false;
    quickSort.setColorBackground(#7E6B8F);
    bubbleActive = false;
    bubbleSort.setColorBackground(#7E6B8F);

    pause.setColorBackground(color(90, 90, 90))
      .setColorForeground(color(90, 90, 90))
      .setColorActive(color(90, 90, 90));
    doSort.setColorBackground(color(90, 90, 90))
      .setColorForeground(color(90, 90, 90))
      .setColorActive(color(90, 90, 90));
    stopSort.setColorBackground(color(90, 90, 90))
      .setColorForeground(color(90, 90, 90))
      .setColorActive(color(90, 90, 90));
  }
}

void pause() {
  if (mergeActive||quickActive||bubbleActive||selectionActive) {
    drawState=0;
    frameRate(30);
    doSort.setColorBackground(color(#7E6B8F))
      .setColorForeground(color(#8D78A0))
      .setColorActive(color(#9D85B2));
    pause.setColorBackground(color(90, 90, 90))
      .setColorForeground(color(90, 90, 90))
      .setColorActive(color(90, 90, 90));
  }
}


void plusOne() {
  println("plus1");
  if (numOfBars < 1024) {
    numOfBars+=1;
    setNumOfBars.setValue(numOfBars);
  } else {
    numOfBars = 1024;
    setNumOfBars.setValue(numOfBars);
  }
}

void plusTen() {
  println("plus10");
  if (numOfBars <= 1014) {
    numOfBars+=10;
    setNumOfBars.setValue(numOfBars);
  } else {
    numOfBars = 1024;
    setNumOfBars.setValue(numOfBars);
  }
}

void plusOneHundred() {
  println("plus100");
  if (numOfBars <= 924) {
    numOfBars+=100;
    setNumOfBars.setValue(numOfBars);
  } else {
    numOfBars = 1024;
    setNumOfBars.setValue(numOfBars);
  }
}

void minusOne() {
  println("minus1");
  if (numOfBars > 2) {
    numOfBars-=1;
    setNumOfBars.setValue(numOfBars);
  } else {
    numOfBars = 2;
    setNumOfBars.setValue(numOfBars);
  }
}

void minusTen() {
  println("minus10");
  if (numOfBars > 12) {
    numOfBars-=10;
    setNumOfBars.setValue(numOfBars);
  } else {
    numOfBars = 2;
    setNumOfBars.setValue(numOfBars);
  }
}

void minusOneHundred() {
  println("minus100");
  if (numOfBars > 102) {
    numOfBars-=100;
    setNumOfBars.setValue(numOfBars);
  } else {
    numOfBars = 2;
    setNumOfBars.setValue(numOfBars);
  }
}

//non-commented version found in BarArraySetupFunctions
//void randomizeBars() {
//  println("randomize bars");
//  if (setupIsDone) {
//    stopSort();
//  }
//  for (int i = 0; i < numOfBars; i++) {
//    int val = int(random((.05 * height), (.5 * height)));
//    barHeightArray[0][i] = val;
//    barHeightArray[1][i] = i;
//    barHeightArrayDuplicate[0][i] = val;
//    barHeightArrayDuplicate[1][i] = i;
//  }
//  background(255);
//  drawBars(barHeightArray);
//}
