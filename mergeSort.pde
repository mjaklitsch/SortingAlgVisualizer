// ========================================================================================================================================================================
// ================================================================- COUNT - COUNT - COUNT -===============================================================================
// ========================================================================================================================================================================
void mergeCount(int arr[][], int l, int m, int r) { 
  //println("mergecount");
  // Find sizes of two subarrays to be merged 

  int n1 = m - l + 1; 
  int n2 = r - m; 

  /* Create temp arrays */
  int L[] = new int [n1]; 
  int R[] = new int [n2]; 

  /*Copy data to temp arrays*/
  for (int i=0; i<n1; ++i) 
    L[i] = arr[0][l + i]; 
  for (int j=0; j<n2; ++j) 
    R[j] = arr[0][m + 1 + j]; 


  /* Merge the temp arrays */

  // Initial indexes of first and second subarrays 
  int i = 0, j = 0; 

  // Initial index of merged subarry array 
  int k = l; 
  while (i < n1 && j < n2) { 
    if (L[i] <= R[j]) { 
      arr[0][k] = L[i]; 
      i++;
      numOfAnimations++;
    } else { 
      arr[0][k] = R[j]; 
      j++;
      numOfAnimations++;
    } 
    k++;
  } 

  /* Copy remaining elements of L[] if any */
  while (i < n1) { 
    arr[0][k] = L[i]; 
    i++; 
    k++;
    //numOfAnimations++;
  } 

  /* Copy remaining elements of R[] if any */
  while (j < n2) { 
    arr[0][k] = R[j]; 
    j++; 
    k++;
    //numOfAnimations++;
  }
} 

// Main function that sorts arr[l..r] using 
// merge() 
void mergeSortCount(int arr[][], int l, int r) {
  //println("mergesortcount");
  if (l < r) { 
    // Find the middle point 
    int m = (l+r)/2; 

    // Sort first and second halves 
    mergeSortCount(arr, l, m); 
    mergeSortCount(arr, m+1, r); 

    // Merge the sorted halves 
    mergeCount(arr, l, m, r);
  }
}
// ========================================================================================================================================================================
// ================================================================- ANIMATE - ANIMATE - ANIMATE -=========================================================================
// ========================================================================================================================================================================
int animationArrayPosition = 0;

void mergeAnimate(int arr[][], int l, int m, int r) { 
  //println("mergeanimate");
  // Find sizes of two subarrays to be merged 
  int n1 = m - l + 1; 
  int n2 = r - m; 

  /* Create temp arrays */
  int L[][] = new int [2][n1]; 
  int R[][] = new int [2][n2]; 

  /*Copy data to temp arrays*/
  for (int i=0; i<n1; ++i) {
    L[0][i] = arr[0][l + i]; 
    L[1][i] = arr[1][l + i];
  }
  for (int j=0; j<n2; ++j) {
    R[0][j] = arr[0][m + 1+ j];
    R[1][j] = arr[1][m + 1+ j];
  }


  /* Merge the temp arrays */

  // Initial indexes of first and second subarrays 
  int i = 0, j = 0; 

  // Initial index of merged subarray array 
  int k = l; 
  while (i < n1 && j < n2) { 
    if (L[0][i] <= R[0][j]) { 
      animations[0][animationArrayPosition] = L[1][i];
      animations[1][animationArrayPosition] = L[0][i];
      animations[2][animationArrayPosition] = R[1][j];
      animations[3][animationArrayPosition] = R[0][j];
      animationArrayPosition++;
      //println("Array Left: " + "[" + L[0][i] + "][" + L[1][i] + "] Array Right " + "[" + R[0][j] + "][" + R[1][j] + "]");
      arr[0][k] = L[0][i];
      i++;
    } else {   
      animations[0][animationArrayPosition] = L[1][i];
      animations[1][animationArrayPosition] = L[0][i];
      animations[2][animationArrayPosition] = R[1][j];
      animations[3][animationArrayPosition] = R[0][j];
      animationArrayPosition++;
      // println("Array Left: " + "[" + L[0][i] + "][" + L[1][i] + "] Array Right " + "[" + R[0][j] + "][" + R[1][j] + "]");

      arr[0][k] = R[0][j];
      for (int g = i; g < n1; g++) {
        L[1][g]++;
        //println(L[1][g]);
      }
      j++;
     // i++;
    } 
    k++;
  } 

  /* Copy remaining elements of L[] if any */
  while (i < n1) { 
    //animations[0][animationArrayPosition] = L[1][i];
    //animations[1][animationArrayPosition] = L[0][i];
    //animations[2][animationArrayPosition] = L[1][i];
    //animations[3][animationArrayPosition] = L[0][i];
    //animationArrayPosition++;
    //println("Array Left: " + "[" + L[0][i] + "][" + L[1][i] + "]");
    arr[0][k] = L[0][i]; 
    i++; 
    k++;
  } 

  /* Copy remaining elements of R[] if any */
  while (j < n2) { 

    //animations[0][animationArrayPosition] = R[1][j];
    //animations[1][animationArrayPosition] = R[0][j];
    //animations[2][animationArrayPosition] = R[1][j];
    //animations[3][animationArrayPosition] = R[0][j];
    //animationArrayPosition++;
    //println("Array Right " + "[" + R[0][j] + "][" + R[1][j] + "]");
    arr[0][k] = R[0][j]; 
    j++; 
    k++;
  }
} 

// Main function that sorts arr[l..r] using 
// merge() 
void mergeSortAnimate(int arr[][], int l, int r) { 
  //println("mergesortanimate");
  if (l < r) { 
    // Find the middle point 
    int m = (l+r)/2; 

    // Sort first and second halves 
    mergeSortAnimate(arr, l, m); 
    mergeSortAnimate(arr, m+1, r); 

    // Merge the sorted halves 
    mergeAnimate(arr, l, m, r);
  }
}
