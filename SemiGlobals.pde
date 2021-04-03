class SemiGlobals {

  int numBars, timeScale, buttonWidth, buttonHeight;
  float ceiling, leftWall;

  Button doSort, mergeSort, bubbleSort, selectionSort, quickSort, pause, stopSort, 
    reset, plusOne, plusTen, plusOneHundred, minusOne, minusTen, minusOneHundred;

  Slider setNumBars, setTimeScale;

  boolean mergeActive, bubbleActive, selectionActive, quickActive, isAnimationActive, setupIsDone;

  BarArray barArray;
  BarArray barAnimationArray;

  AnimationArray animationArray;

  ButtonInitializer buttonInitializer;
  ButtonFunctions buttonFunctions;


  SemiGlobals() {
    this.isAnimationActive = false;
    this.numBars = 8;
    this.timeScale = 30;
    this.mergeActive = false;
    this.bubbleActive = false;
    this.selectionActive = false;
    this.quickActive = false;
    this.setupIsDone = false;
  }
}
