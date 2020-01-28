int[][] testArray;

boolean mergeSortCountTest(int size) {
  numOfAnimations = 0;
  boolean isCorrect = false;

  testArray = new int[1][size];
  for (int i = 0; i < size; i++) {
    testArray[0][i] = int(random(0, 20));
  }
  mergeSortCount(testArray, 0, size-1);
  println("size of array: " + size);
  println("animations recorded: " + numOfAnimations);
  println("should be: ");
  if (numOfAnimations == ceil(size * log(size))) {
    isCorrect = true;
  }
  println("Correct?: " + isCorrect);
  return isCorrect;
}


// test doesnt exactly work but it led to understanding the pattern which is all that is necessary


//0 0 2 5 8 12 16 20 24 29 34 39 44 49 54 59 64 70 76 82 animations recorded
//0 1 2 3 4 5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 size of array
//0 0 2 3 3 4  4  4  4  5  5  5  5  5  5  5  5  6  6  6  increase from previous animations(+1 after every perfect square after 2)

void printAnimationArray() {
  println("num of animations: " + numOfAnimations);
  if (mergeActive) {
    for (int i = 0; i <numOfAnimations; i++) {
      if (animations[0][i] !=  animations[2][i]) {
        println("[" + animations[0][i] + "][" + animations[1][i] + "]"+"[" + animations[2][i] + "][" + animations[3][i] + "]");
      }
    }
  } else if (quickActive) {
    for (int i = 0; i <numOfAnimations; i++) {
      //if (animations[0][i] !=  animations[2][i]) {
      println("[" + animations[0][i] + "][" + animations[1][i] + "]"+"[" + animations[2][i] + "][" + animations[3][i] + "][" + animations[4][i] + "][" + animations[5][i] + "]");
      //}
    }
  }
}

void printHeightArray() {
  for (int i = 0; i <numOfBars; i++) {
    println("[" + barHeightArray[0][i] + "][" + barHeightArray[1][i] + "]");
  }
  println("================");
}
void printHeightArrayDuplicate() {
  for (int i = 0; i <numOfBars; i++) {
    println("[" + barHeightArrayDuplicate[0][i] +"]");
  }
  println("================");
}

void testSwap1() {
  swapBars(0, 2, 100, 4, 150 );
}
void testSwap2() {
  swapBars(1, 2, 100, 4, 150 );
}
void testSwap3() {
  swapBars(2, 2, 100, 4, 150 );
}

void setTestArray() {
  barHeightArray = new int[2][8];
  for (int i = 0; i <8; i++) {
    barHeightArray[0][7-i] = i*10+10;
    barHeightArray[1][i] = i;
    barHeightArrayDuplicate[0][7-i] = i*10+10;
    barHeightArrayDuplicate[1][i] = i;
  }
  drawBars(barHeightArray);
}


void keyPressed() {
  println("keypressed");
  if (key == 'i') {
    testSwap1();
  }
  if (key == 'o') {
    testSwap2();
  }
  if (key == 'p') {
    printHeightArrayDuplicate();
  }
  if (key == 'g') {

    printAnimationArray();
  }
  if (key == 'j') {
    printHeightArray();
  }
}
