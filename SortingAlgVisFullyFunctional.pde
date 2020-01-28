import controlP5.*;
ControlP5 cp5;

int numOfBars = 8;
int oldNumOfBars = numOfBars;
int stage = 0;
int animationLocation = 0;

int[][] barHeightArray; // working array
int[][] barHeightArrayDuplicate; // used to generate animation array size
// begin controlP5
Button doSort;
Button mergeSort;
Button bubbleSort;
Button selectionSort;
Button quickSort;
Button pause;
Button stopSort;
Button reset;
Button plusOne;
Button plusTen;
Button plusOneHundred;
Button minusOne;
Button minusTen;
Button minusOneHundred;
Slider setNumOfBars;
Slider setTimeScale;
// end controlP5

// begin g4p_controls
int timerInterval = 1000;


//end g4p_controls

boolean mergeActive = false;
boolean bubbleActive = false;
boolean selectionActive = false;
boolean quickActive = false;

boolean setupIsDone = false;

int drawState = 0;
int numOfAnimations = 0;
int[][] animations;
PFont buttonLabelFont;
//PFont sliderLabelFont;
void setup() {
  buttonLabelFont = createFont("Times-Roman", 16);
  //sliderLabelFont = createFont("Times-Roman", 8);
  println("setup");
  fullScreen();
  background(255);
  frameRate(30);

  barHeightArray = new int[2][numOfBars];
  barHeightArrayDuplicate = new int[2][numOfBars];
  //setTestArray();
  randomizeBars();


  setupButtons();

  setupIsDone = true;
}

void draw() {
  // println("numOfAnimations" + numOfAnimations);
  if (oldNumOfBars != numOfBars) {
    println("draw 'if' statement clears");
    barHeightArray = new int[2][numOfBars];
    barHeightArrayDuplicate = new int[2][numOfBars];
    randomizeBars();
    stopSort();
  }
  if (oldTimeScale != timeScale) {
    time = 0;
    timeCheck = int(timeMax/timeScale);
    drawBars(barHeightArrayDuplicate);
  }
  oldTimeScale = timeScale;
  oldNumOfBars = numOfBars;
  //drawBars(barHeightArrayDuplicate);
  if (drawState != 0) {
    runTimer();
  }


  //if (drawState == 1) {
  //  println("animationLocation" + animationLocation);
  //  if (animationLocation > numOfAnimations-1) {
  //    mergeActive = false;
  //    drawState = 0;
  //  } else {
  //    swapBars(stage, animations[0][animationLocation], animations[1][animationLocation], animations[2][animationLocation], animations[3][animationLocation]);

  //    stage++;
  //    if (stage>2) {
  //      stage = 0;
  //      animationLocation++;
  //    }
  //  }

  //}
}
