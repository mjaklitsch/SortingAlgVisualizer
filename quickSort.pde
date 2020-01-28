boolean sorted = false;
int partitionInizialize(int low, int high) 
{ 
  int pivot = barHeightArrayDuplicate[0][high];  
  int i = (low-1); // index of smaller element 
  for (int j=low; j<high; j++) 

  { 
    numOfAnimations++;
    // If current element is smaller than the pivot 
    if (barHeightArrayDuplicate[0][j] < pivot) 
    { 
      i++; 
      // swap arr[i] and arr[j] 
      int temp = barHeightArrayDuplicate[0][i]; 
      barHeightArrayDuplicate[0][i] = barHeightArrayDuplicate[0][j]; 
      barHeightArrayDuplicate[0][j] = temp;
    }
  } 

  // swap arr[i+1] and arr[high] (or pivot) 
  numOfAnimations++;
  int temp = barHeightArrayDuplicate[0][i+1]; 
  barHeightArrayDuplicate[0][i+1] = barHeightArrayDuplicate[0][high]; 
  barHeightArrayDuplicate[0][high] = temp; 

  return i+1;
} 


/* The main function that implements QuickSort() 
 arr[] --> Array to be sorted, 
 low  --> Starting index, 
 high  --> Ending index */
void quickSorterInitialize(int low, int high) 
{ 
  if (low < high) 
  { 
    /* pi is partitioning index, arr[pi] is  
     now at right place */
    int pi = partitionInizialize(low, high); 

    // Recursively sort elements before 
    // partition and after partition 
    quickSorterInitialize(low, pi-1); 
    quickSorterInitialize(pi+1, high);
  }
}
// ==============================
// Get Animations Stage
// ==============================
// animations[0][i] ;  [1][i] ;  [2][i] ;   [3][i] ;   [4][i] ;    [5][i] ;   
// animations[lowIndex][lowValue][highIndex][highValue][pivotIndex][pivotValue]

int partition(int low, int high) 
{ 
  //println("Partition low: " + low + " high: " + high);
  int pivot = barHeightArray[0][high];  
  int i = (low-1); // index of smaller element 
  for (int j=low; j<high; j++) 
  { 

    // If current element is smaller than the pivot 
    if (barHeightArray[0][j] < pivot)  { 
      i++; 
      animations[0][animationArrayPosition] = i;
      animations[1][animationArrayPosition] = barHeightArray[0][i];
      animations[2][animationArrayPosition] = j;
      animations[3][animationArrayPosition] = barHeightArray[0][j];
      animations[4][animationArrayPosition] = high;
      animations[5][animationArrayPosition] = barHeightArray[0][high];
      animationArrayPosition++;

      // swap arr[i] and arr[j] 
      int temp = barHeightArray[0][i]; 
      barHeightArray[0][i] = barHeightArray[0][j]; 
      barHeightArray[0][j] = temp;
    } else {
      animations[0][animationArrayPosition] = i+1;
      animations[1][animationArrayPosition] = barHeightArray[0][i+1];
      animations[2][animationArrayPosition] = j;
      animations[3][animationArrayPosition] = barHeightArray[0][j];
      animations[4][animationArrayPosition] = high;
      animations[5][animationArrayPosition] = barHeightArray[0][high];
      animationArrayPosition++;
    }
  } 
  // swap arr[i+1] and arr[high] (or pivot) 

  animations[0][animationArrayPosition] = i+1;
  animations[1][animationArrayPosition] = barHeightArray[0][i+1];
  animations[2][animationArrayPosition] = high;
  animations[3][animationArrayPosition] = barHeightArray[0][high];
  animations[4][animationArrayPosition] = high;
  animations[5][animationArrayPosition] = barHeightArray[0][high];
  animationArrayPosition++;
  int temp = barHeightArray[0][i+1]; 
  barHeightArray[0][i+1] = barHeightArray[0][high]; 
  barHeightArray[0][high] = temp; 

  return i+1;
} 


/* The main function that implements QuickSort() 
 arr[] --> Array to be sorted, 
 low  --> Starting index, 
 high  --> Ending index */
void quickSorter(int low, int high) { 
  //println("Sorter low: " + low + " high: " + high);
  if (low < high) { 
    /* pi is partitioning index, arr[pi] is  
     now at right place */
    int pi = partition(low, high); 

    // Recursively sort elements before 
    // partition and after partition 
    quickSorter(low, pi-1); 
    quickSorter(pi+1, high);
  }
}
