// ControlP5 is annoying and won't allow for class methods to be called by buttons, global function wrappers work around that
void doSortG() {
  if (G.mergeActive || G.quickActive || G.selectionActive || G.bubbleActive) {
    G.buttonFunctions.doSort();
  }
}

void mergeSortG() {
  if (!G.mergeActive) {
    G.buttonFunctions.setMergeSort();
    G.mergeActive = true;

    color inactiveColor = G.buttonInitializer.inactiveButtonColor;
    G.mergeSort.setColorBackground(inactiveColor)
      .setColorForeground(inactiveColor)
      .setColorActive(inactiveColor);

    Button inactiveButton = G.quickActive? G.quickSort
      :(G.selectionActive? G.selectionSort 
      :(G.bubbleActive? G.bubbleSort
      :G.doSort));

    if (inactiveButton != null) { // color in any inactive button

      G.quickActive = false;
      G.selectionActive = false;
      G.bubbleActive = false;

      inactiveButton.setColorBackground(G.buttonInitializer.activeButtonBackground)
        .setColorForeground(G.buttonInitializer.activeButtonForeground)
        .setColorActive(G.buttonInitializer.activeButton);
    }
  }
}

void quickSortG() {
  if (!G.quickActive) {
    G.buttonFunctions.setQuickSort();
    G.quickActive = true;

    color inactiveColor = G.buttonInitializer.inactiveButtonColor;
    G.quickSort.setColorBackground(inactiveColor)
      .setColorForeground(inactiveColor)
      .setColorActive(inactiveColor);

    Button inactiveButton = G.mergeActive? G.mergeSort
      :(G.selectionActive? G.selectionSort 
      :(G.bubbleActive? G.bubbleSort
      :G.doSort));

    if (inactiveButton != null) { // color in any inactive button

      G.mergeActive = false;
      G.selectionActive = false;
      G.bubbleActive = false;

      inactiveButton.setColorBackground(G.buttonInitializer.activeButtonBackground)
        .setColorForeground(G.buttonInitializer.activeButtonForeground)
        .setColorActive(G.buttonInitializer.activeButton);
    }
  }
}

void selectionSortG() {
  if (!G.selectionActive) {

    G.buttonFunctions.setSelectionSort();
    G.selectionActive = true;

    color inactiveColor = G.buttonInitializer.inactiveButtonColor;
    G.selectionSort.setColorBackground(inactiveColor)
      .setColorForeground(inactiveColor)
      .setColorActive(inactiveColor);

    Button inactiveButton = G.quickActive? G.quickSort
      :(G.mergeActive? G.mergeSort 
      :(G.bubbleActive? G.bubbleSort
      :G.doSort));

    if (inactiveButton != null) { // color in any inactive button

      G.mergeActive = false;
      G.quickActive = false;
      G.bubbleActive = false;

      inactiveButton.setColorBackground(G.buttonInitializer.activeButtonBackground)
        .setColorForeground(G.buttonInitializer.activeButtonForeground)
        .setColorActive(G.buttonInitializer.activeButton);
    }
  }
}

void bubbleSortG() {
  if (!G.bubbleActive) {
    G.buttonFunctions.setBubbleSort();
    G.bubbleActive = true;

    color inactiveColor = G.buttonInitializer.inactiveButtonColor;
    G.bubbleSort.setColorBackground(inactiveColor)
      .setColorForeground(inactiveColor)
      .setColorActive(inactiveColor);

    Button inactiveButton = G.quickActive? G.quickSort
      :(G.selectionActive? G.selectionSort 
      :(G.mergeActive? G.mergeSort
      :G.doSort));

    if (inactiveButton != null) { // color in any inactive button

      G.mergeActive = false;
      G.selectionActive = false;
      G.quickActive = false;

      inactiveButton.setColorBackground(G.buttonInitializer.activeButtonBackground)
        .setColorForeground(G.buttonInitializer.activeButtonForeground)
        .setColorActive(G.buttonInitializer.activeButton);
    }
  }
}

void pauseG() {
  G.buttonFunctions.pause();
}

void resetG() {
  G.buttonFunctions.reset();
}

void stopSortG() {
  G.buttonFunctions.stopSort();
}

void plusOneG() {
  G.buttonFunctions.plusOne();
}

void plusTenG() {
  G.buttonFunctions.plusTen();
}

void plusOneHundredG() {
  G.buttonFunctions.plusOneHundred();
}

void minusOneG() {
  G.buttonFunctions.minusOne();
}

void minusTenG() {
  G.buttonFunctions.minusTen();
}

void minusOneHundredG() {
  G.buttonFunctions.minusOneHundred();
}
