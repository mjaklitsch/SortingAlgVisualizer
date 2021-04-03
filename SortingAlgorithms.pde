class SortingAlgorithms {
  private BarArray barArray;
  private AnimationArray animationArray;

  SortingAlgorithms(BarArray barArray, AnimationArray animationArray) {
    this.barArray = barArray;
    this.animationArray = animationArray;
  }

  public void bubbleSort() {

    boolean isSelect = false; // not used for bubblesort
    for (int i = this.barArray.getNumBars()-1; i >= 1; i--) {
      for (int j = 0; j < i; j++) {

        int index1 = j;
        int index2 = j+1;
        boolean isSwap = this.barArray.isFirstTallerThanSecondBar(index1, index2);

        if (isSwap) {
          this.barArray.swapBars(index1, index2);
        }
        this.animationArray.record(new Animation(index1, index2, isSwap, isSelect, "Compare"));
      }
    }
  }

  public void mergeSort() { // calls the actual MergeSort algorithm
    int left = 0;
    int right = G.numBars-1;

    mergeSortInner(left, right);
  }

  private void mergeSortInner(int l, int r) { // the MergeSort Algorithm 

    if (r > l) {

      int m = l + (r-l)/2;

      //split in half recursively
      mergeSortInner(l, m);
      mergeSortInner(m + 1, r);

      // recombine
      int i = l;
      int j = m+1;
      int k = i;

      while (i <= m && j <= r) {

        if (G.barArray.getTallness(i) <= G.barArray.getTallness(j)) {
          this.animationArray.record(new Animation(i, j, l, m, r, false));

          i++;
        } else {
          G.barArray.insertBar(k, j);
          // inserting from right array at index in front of left array
          // this means that all indices must be incremented to keep at the correct position;

          this.animationArray.record(new Animation(i, j, l, m, r, true));

          i++;
          m++;
          j++;
        }

        k++;
      }
    }
  }
  public void quickSort() {

    int low = 0;
    int high = G.numBars-1;

    quickSortInner(low, high);
  }

  private void quickSortInner(int low, int high) {
    if (low < high) {
      float pivot = G.barArray.getTallness(high);

      int i = (low - 1);

      for (int j = low; j <= high - 1; j++) {
        if (G.barArray.getTallness(j) < pivot) {
          this.animationArray.record(new Animation(j, high, false, false, "Compare"));
          i++;

          this.animationArray.record(new Animation(j, i, true, false, "Compare"));
          G.barArray.swapBars(i, j);
        }
      }

      int partitionIndex = i + 1;

      this.animationArray.record(new Animation(partitionIndex, high, true, true, "Compare"));
      G.barArray.swapBars(partitionIndex, high);

      quickSortInner(low, partitionIndex-1);
      quickSortInner(partitionIndex+1, high);
    }
  }


  public void selectionSort() {
    int size = this.barArray.getNumBars();

    for (int i = 0; i < size-1; i++) {
      int shortestBarIndex = i;
      boolean isSelect;
      for (int j = i+1; j < size; j++) {

        this.animationArray.record(new Animation(shortestBarIndex, j, false, false, "Compare"));

        isSelect = this.barArray.getTallness(shortestBarIndex) > this.barArray.getTallness(j);
        if (isSelect) {// set new shortest bar
          shortestBarIndex = j;
        }
      }

      if (i != shortestBarIndex) {
        this.barArray.insertBar(i, shortestBarIndex);
        this.animationArray.record(new Animation(i, shortestBarIndex, false, true, "Select"));
      }
    }
  }


  public void setBarArray(BarArray barArray) {
    this.barArray = barArray;
  }

  public void setAnimationArray(AnimationArray animationArray) {
    this.animationArray = animationArray;
  }
}
