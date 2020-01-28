int time = 0;
int timeScale = 1;
int oldTimeScale = timeScale;
final int timeMax = 240;
int timeCheck = timeMax/timeScale;

void runTimer() {
  if (time != timeCheck) {
    time++;
  } else {
    time = 0;
    if (drawState == 1) {
      println("animationLocation" + animationLocation);
      if (animationLocation > numOfAnimations-1) {
        stopSort();
      } else {
        swapBars(stage, animations[0][animationLocation], animations[1][animationLocation], animations[2][animationLocation], animations[3][animationLocation]);

        stage++;
        if (stage>2) {
          stage = 0;
          animationLocation++;
        }
      }
    } else if (drawState == 2) {
      selectionSorter();
    } else if (drawState == 3) {
      drawBars(barHeightArrayDuplicate);
      if (!(animationArrayPosition >= numOfAnimations)) {
        pivotBars(); // quick sort
      } else {
        drawBars(barHeightArrayDuplicate);
        stopSort();
      }
    } else if (drawState == 4) {

      bubbleSorter();
    }

    //next animation;
  }
}
