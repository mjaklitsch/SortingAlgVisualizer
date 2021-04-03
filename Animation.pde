class Animation {

  private int index1, index2, l, m, r;
  private boolean isSwap, isSelect;

  ArrayList<Integer> bounds;
  //private String startState;

  private String animationState = "Compare"; // else Compare or Swap, 

  Animation(int index1, int index2, boolean isSwap, boolean isSelect, String startState) {
    this.index1 = index1; // used for destination
    this.index2 = index2;

    this.isSwap = isSwap;
    this.isSelect = isSelect;

    this.animationState = startState;
  }

  Animation(int index1, int index2, int l, int m, int r, boolean isSwap) { // separate constructor for mergesort
    this.index1 = index1; // used for destination
    this.index2 = index2;

    this.l = l;
    this.m = m;
    this.r = r;

    this.isSwap = isSwap;
  }

  public boolean isDone() {
    return this.animationState.equals("Done");
  }


  public void animate(BarArray barArray, String activeFunction) { // adjusts the next 
    switch (activeFunction) {
    case "BubbleSort":
      this.animateBubbleSort(barArray);
      break;
    case "SelectionSort":
      this.animateSelectionSort(barArray);
      break;
    case "QuickSort":
      this.animateQuickSort(barArray);
      break;
    case "MergeSort":
      this.animateMergeSort(barArray);
      break;
    }
  }


  // Each sorting algorithm is performing different operations
  // each should have its own way of being animated to show 
  // off these differences

  public void animateBubbleSort(BarArray barArray) {
    switch(this.animationState) {
    case "Compare":
      barArray.setCompareColor(this.index1);
      barArray.setCompareColor(this.index2);

      this.animationState = this.isSwap? "Swap": "Reset";
      break;
    case "Swap":
      barArray.setDefaultColor(this.index2);
      barArray.setDefaultColor(this.index1);

      barArray.swapBars(this.index1, this.index2);

      this.animationState = "Done";
      break;
    case "Reset": 
      barArray.setDefaultColor(this.index2);
      barArray.setDefaultColor(this.index1);

      this.animationState = "Done";
      break;
    default:
      // should never hit
      this.animationState = "Done";
      break;
    }
  }

  public void animateSelectionSort(BarArray barArray) {
    switch(this.animationState) {
    case "Compare":
      barArray.setCompareColor(this.index1);
      barArray.setCompareColor(this.index2);

      this.animationState = "ResetCompare";
      break;
    case "ResetCompare": 
      // deselect second bar, comparison bar stays colored
      barArray.setDefaultColor(this.index1);
      barArray.setDefaultColor(this.index2);

      this.animationState = "Done";
      break;
    case "Select":
      barArray.insertBar(this.index1, this.index2);

      barArray.setSelectColor(this.index1);

      this.animationState = "ResetSelect";
      break; 
    case "ResetSelect": 
      barArray.setDefaultColor(this.index1);
      barArray.setDefaultColor(this.index2);

      this.animationState = "Done";
      break;
    default:
      // should never hit
      this.animationState = "Done";
      break;
    }
  }

  public void animateQuickSort(BarArray barArray) {

    switch(this.animationState) {
    case "Compare":
      barArray.setCompareColor(this.index1);
      barArray.setCompareColor(this.index2);

      this.animationState = this.isSelect? "Select": (this.isSwap? "Swap": "ResetCompare");
      break;
    case "ResetCompare": 
      barArray.setDefaultColor(this.index1);

      this.animationState = "Done";
      break;
    case "Select":
      barArray.swapBars(this.index1, this.index2);

      barArray.setDefaultColor(this.index2);

      this.animationState = "ResetSelect";
      break;
    case "ResetSelect": 
      barArray.setDefaultColor(this.index1);
      barArray.setDefaultColor(this.index2);

      this.animationState = "Done";
      break;
    case "Swap":
      barArray.swapBars(this.index1, this.index2);

      this.animationState = "ResetSwap";
      break;
    case "ResetSwap": 
      barArray.setDefaultColor(this.index1);
      barArray.setDefaultColor(this.index2);

      this.animationState = "Done";
      break;
    default:
      // should never hit
      this.animationState = "Done";
      break;
    }
  }


  public void animateMergeSort(BarArray barArray) {
    ArrayList<Integer> newBounds = new ArrayList<Integer>();

    newBounds.add(this.l);
    newBounds.add(this.m+1);
    newBounds.add(this.r+1);

    if (!newBounds.equals(this.bounds)) {
      this.bounds = newBounds;
      barArray.setBounds(this.bounds);
    }

    switch(this.animationState) {
    case "Compare":
      barArray.setCompareColor(this.index1);
      barArray.setCompareColor(this.index2);

      this.animationState = this.isSwap? "Swap": "Reset";
      break;
    case "Swap":
      barArray.setDefaultColor(this.index2);
      barArray.setDefaultColor(this.index1);

      barArray.insertBar(this.index1, this.index2);

      this.animationState = "Reset";
      //break; // purposefully left off for better animation flow
    case "Reset": 
      barArray.setDefaultColor(this.index2);
      barArray.setDefaultColor(this.index1);

      this.animationState = "Done";
      break;
    default:
      // should never hit
      this.animationState = "Done";
      break;
    }
  }
}



class AnimationArray {

  private ArrayList<Animation> animationArray;
  private int animationIndex = 0;
  private BarArray barAnimationArray;

  AnimationArray(BarArray barAnimationArray) {
    this.animationArray = new ArrayList<Animation>();
    this.barAnimationArray = barAnimationArray;
  }

  public void record(Animation animation) {
    this.animationArray.add(animation);
  }

  public ArrayList<Animation> getAnimationArray() {
    return this.animationArray;
  }

  public void animateNext(String activeFunction) {
    if (this.animationIndex < this.animationArray.size()) {
      Animation nextAnimation = this.animationArray.get(this.animationIndex);
      nextAnimation.animate(this.barAnimationArray, activeFunction);

      if (nextAnimation.isDone()) {
        this.animationIndex++;
      }
    }
  }

  public void prepAnimationArray() {
    this.animationIndex = 0;
  }
}
