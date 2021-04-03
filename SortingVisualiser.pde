import controlP5.*;
ControlP5 cp5;// = new ControlP5(this);

SemiGlobals G = new SemiGlobals();

int framesPerSec = 180;
int sliderNumBars = G.numBars;
int sliderTimeScale = G.timeScale;

void setup() {
  size(1020, 800);
  background(255);
  frameRate(framesPerSec);

  G.buttonWidth = width / 10;
  G.buttonHeight = height / 6;

  G.ceiling = G.buttonHeight;
  G.leftWall = G.buttonWidth;

  boolean fillArray = true;

  G.barArray = new BarArray(G.numBars, G.ceiling, G.leftWall, fillArray);
  G.barAnimationArray = G.barArray.copyBarArray();
  G.animationArray = new AnimationArray(G.barAnimationArray);

  cp5 = new ControlP5(this);

  ControlFont buttonLabelFont = new ControlFont(createFont("Times-Roman", 16));
  G.buttonInitializer = new ButtonInitializer(this, buttonLabelFont);
  G.buttonFunctions = new ButtonFunctions(G.barArray, G.animationArray);

  float[] position = new float[] {0.0, 0.0};
  int[] size = {G.buttonWidth, G.buttonHeight};

  boolean buttonIsActive = true;

  // corner button
  G.doSort = G.buttonInitializer.setupButton("doSortG", "Sort", position, size, false);

  float topButtonWidth = (width - G.buttonWidth) / 4;
  int[] topButtonSize = {int(topButtonWidth), G.buttonHeight};

  // top buttons
  position[0] += G.buttonWidth;
  G.mergeSort = G.buttonInitializer.setupButton("mergeSortG", "Merge Sort", position, topButtonSize, buttonIsActive);

  position[0] += topButtonWidth;
  G.bubbleSort = G.buttonInitializer.setupButton("bubbleSortG", "Bubble Sort", position, topButtonSize, buttonIsActive);

  position[0] += topButtonWidth;
  G.selectionSort = G.buttonInitializer.setupButton("selectionSortG", "Selection Sort", position, topButtonSize, buttonIsActive);

  position[0] += topButtonWidth;
  G.quickSort = G.buttonInitializer.setupButton("quickSortG", "Quick Sort", position, topButtonSize, buttonIsActive);

  // side buttons
  position[0] = 0;
  position[1] += G.buttonHeight;
  G.pause = G.buttonInitializer.setupButton("pauseG", "Pause", position, size, !buttonIsActive);

  position[1] += G.buttonHeight;
  G.stopSort = G.buttonInitializer.setupButton("stopSortG", "Stop", position, size, !buttonIsActive);

  position[1] += G.buttonHeight;
  G.reset = G.buttonInitializer.setupButton("resetG", "Reset", position, size, buttonIsActive);

  float sliderButtonWidth = G.buttonWidth / 6;
  int[] sliderButtonSize = {int(sliderButtonWidth), int(sliderButtonWidth)};

  // slider buttons
  position[1] += G.buttonHeight;
  G.minusOneHundred = G.buttonInitializer.setupButton("minusOneHundredG", "-100", position, sliderButtonSize, buttonIsActive);

  position[0] += sliderButtonWidth;
  G.minusTen = G.buttonInitializer.setupButton("minusTenG", "-10", position, sliderButtonSize, buttonIsActive);

  position[0] += sliderButtonWidth;
  G.minusOne = G.buttonInitializer.setupButton("minusOneG", "-1", position, sliderButtonSize, buttonIsActive);

  position[0] += sliderButtonWidth;
  G.plusOne = G.buttonInitializer.setupButton("plusOneG", "+1", position, sliderButtonSize, buttonIsActive);

  position[0] += sliderButtonWidth;
  G.plusTen = G.buttonInitializer.setupButton("plusTenG", "+10", position, sliderButtonSize, buttonIsActive);

  position[0] += sliderButtonWidth;
  G.plusOneHundred = G.buttonInitializer.setupButton("plusOneHundredG", "+100", position, sliderButtonSize, buttonIsActive);

  int min = 2;
  int max = 1024;

  float[] barSliderPos = new float[] {0.0, G.buttonHeight*4+sliderButtonWidth};
  int[] barSliderSize = new int[] {G.buttonWidth, 2*G.buttonHeight - int(sliderButtonWidth)};

  G.setNumBars = G.buttonInitializer.setupSlider("sliderNumBars", "Number of Bars", min, max, G.numBars, barSliderPos, barSliderSize, true);

  min = 2;
  max = framesPerSec;

  barSliderSize[0] = 2*G.buttonHeight - int(sliderButtonWidth);
  barSliderSize[1] = int(.5*G.buttonWidth);

  barSliderPos[0] = G.buttonWidth;
  barSliderPos[1] = G.buttonHeight*4+sliderButtonWidth + barSliderSize[0] - int(.5*G.buttonWidth);

  G.setTimeScale = G.buttonInitializer.setupSlider("sliderTimeScale", "Time Slider", min, max, G.timeScale, barSliderPos, barSliderSize, false);

  G.barArray.drawBars();


  G.setupIsDone = true;
}

int timer = 0;
float animationIncrementor = 0.0;
float animationGap = float(framesPerSec) / G.timeScale; 

int animations = 0;

void draw() {
  if (G.barArray.getNumBars() != sliderNumBars) {
    // barArray is used to create a record of the algorithm's steps
    // animationArray records the steps and takes a barArray as input to use them on
    // barAnimationArray is used to draw these steps for the user/is the aforementioned input barArray
    G.numBars = sliderNumBars;
    G.buttonFunctions.reset();
    G.setNumBars.setValue(G.numBars);
  }

  if (framesPerSec+1 - G.timeScale != sliderTimeScale) {
    G.timeScale = framesPerSec+1 - sliderTimeScale; 
    G.setTimeScale.setValue(sliderTimeScale);
    //frameRate(G.timeScale);
    animationGap = float(framesPerSec) / G.timeScale;
  }


  background(255);
  G.barAnimationArray.drawBounds();
  G.barAnimationArray.drawBars();

  timer++;
  animationIncrementor += animationGap - floor(animationGap); // handle inconsistent(int) 
  // incrementation of animation steps

  if (G.isAnimationActive && !((timer%floor(animationGap) == 0))) {
    G.animationArray.animateNext(G.buttonFunctions.getActiveFunction());
    animations++;
  } else if (G.isAnimationActive && floor(animationIncrementor) >= 1.0) {
    // add the decimal values up, once they exceed 1.0, animate that frame, then start adding again
    animationIncrementor = animationIncrementor - floor(animationIncrementor);
    G.animationArray.animateNext(G.buttonFunctions.getActiveFunction());
    animations++;
  }


  //if (timer>=framesPerSec) {
  //  timer = 0;
  //}
}


void keyPressed() {
  if (key == 'q') {
    exit();
  } else if (key == 'r') {
    resetG();
  } else if (key == 's') {
    stopSortG();
  } else if (key == ' ') {
    doSortG();
  } else if (key == 'p') {
    pauseG();
  }
}
