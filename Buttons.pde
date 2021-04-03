import java.util.function.Consumer;

class ButtonInitializer {
  private ControlFont buttonLabelFont;

  private ControlP5 cp5;

  public color activeButtonBackground = color(#7E6B8F);
  public color activeButtonForeground = color(#8D78A0);
  public color activeButton = color(#9D85B2);
  public color inactiveButtonColor = color(90, 90, 90);

  private color activeSliderBackground = color(#96E6B3);
  private color activeSliderForeground = color(#DA3E52);
  private color activeSlider = color(#DA3E52);
  private color inactiveSliderColor = color(0);

  public ButtonInitializer(PApplet papp, ControlFont buttonLabelFont) {
    this.cp5 = new ControlP5(papp);
    this.buttonLabelFont = buttonLabelFont;
  }

  public Button setupButton(String function, String label, float[] position, int[] size, boolean isActive) {

    color back = this.inactiveButtonColor;
    color fore = this.inactiveButtonColor;
    color active = this.inactiveButtonColor;

    if (isActive) {
      back = this.activeButtonBackground;
      fore = this.activeButtonForeground;
      active = this.activeButton;
    }

    return this.cp5.addButton(function)
      .setPosition(position[0], position[1])
      .setFont(this.buttonLabelFont)
      .setLabel(label)
      .setSize(size[0], size[1])
      .setColorBackground(back)
      .setColorForeground(fore)
      .setColorActive(active);
  }

  public Slider setupSlider(String variable, String label, int min, int max, 
    int initial, float[] position, int[] size, boolean isActive) {

    color back = this.inactiveSliderColor;
    color fore = color(145, 0, 185);
    color active = fore;

    if (isActive) {
      back = this.activeSliderBackground;
      fore = this.activeSliderForeground;
      active = this.activeSlider;
    }
    Slider s = this.cp5.addSlider(variable)
      .setMin(min)
      .setMax(max)
      .setValue(initial)
      .setLabel(label)
      .setPosition(position[0], position[1])
      .setSize(size[0], size[1])
      .setColorBackground(back)
      .setColorForeground(fore)
      .setColorActive(active)
      .setColorValueLabel(variable.equals("sliderNumBars")? color(40, 100, 255) : active)
      .setColorCaptionLabel(active);

    if (variable.equals("sliderNumBars")) {
      this.cp5.getController("sliderNumBars").getValueLabel().align(ControlP5.CENTER, ControlP5.TOP).setPaddingX(10).setPaddingY(50);
      //s.style()
    }

    if (variable.equals("sliderTimeScale")) {
      cp5.getController("sliderTimeScale").getCaptionLabel().align(ControlP5.CENTER, ControlP5.TOP_OUTSIDE).setPaddingX(40).setPaddingY(5);
      cp5.getController("sliderTimeScale").getValueLabel().align(ControlP5.RIGHT_OUTSIDE, ControlP5.CENTER).setPaddingX(10).setPaddingY(50);
    }
    return s;
  }
}



class ButtonFunctions {
  private String activeFunction = "";
  private SortingAlgorithms algs;

  ButtonFunctions(BarArray barArray, AnimationArray animationArray) {
    this.algs = new SortingAlgorithms(barArray, animationArray);
  }

  public void resetSortingAlgorithms(BarArray barArray, AnimationArray animationArray) {
    this.algs.setBarArray(barArray);
    this.algs.setAnimationArray(animationArray);
  }

  public String getActiveFunction() {
    return this.activeFunction;
  }

  public void doSort() {
    G.isAnimationActive = true;
    switch(this.activeFunction) {
    case "MergeSort":
      this.algs.mergeSort();
      break;
    case "BubbleSort":
      this.algs.bubbleSort();
      break;
    case "QuickSort":
      this.algs.quickSort();
      break;
    case "SelectionSort":
      this.algs.selectionSort();
      break;
    }

    G.pause.setColorBackground(G.buttonInitializer.activeButtonBackground)
      .setColorForeground(G.buttonInitializer.activeButtonForeground)
      .setColorActive(G.buttonInitializer.activeButton);

    G.stopSort.setColorBackground(G.buttonInitializer.activeButtonBackground)
      .setColorForeground(G.buttonInitializer.activeButtonForeground)
      .setColorActive(G.buttonInitializer.activeButton);
  }

  // set active sorting function

  public void setMergeSort() {
    this.activeFunction = "MergeSort";
  }

  public void setBubbleSort() {
    this.activeFunction = "BubbleSort";
  } 

  public void setSelectionSort() {
    this.activeFunction = "SelectionSort";
  }  

  public void setQuickSort() {
    this.activeFunction = "QuickSort";
  }

  public void pause() {
    // pauses the animation
    G.isAnimationActive = false;
  }

  public void stopSort() {
    // stops the algorithm in place and allows restarting with any other algorithm from this point
    G.isAnimationActive = false;
    this.activeFunction = "";
    color inactiveColor = G.buttonInitializer.inactiveButtonColor;
    G.doSort.setColorBackground(inactiveColor)
      .setColorForeground(inactiveColor)
      .setColorActive(inactiveColor);

    Button inactiveButton = G.quickActive? G.quickSort
      :(G.selectionActive? G.selectionSort 
      :(G.mergeActive? G.mergeSort
      :(G.bubbleActive? G.bubbleSort
      :null)));

    if (inactiveButton != null) {

      G.mergeActive = false;
      G.selectionActive = false;
      G.quickActive = false;
      G.bubbleActive = false;

      inactiveButton.setColorBackground(G.buttonInitializer.activeButtonBackground)
        .setColorForeground(G.buttonInitializer.activeButtonForeground)
        .setColorActive(G.buttonInitializer.activeButton);
    }

    G.barAnimationArray.clearBounds();
    G.barArray = G.barAnimationArray.copyBarArray();

    for (int i =0; i < G.numBars; i++) {
      G.barAnimationArray.setDefaultColor(i);
    }

    G.animationArray = new AnimationArray(G.barAnimationArray);

    G.buttonFunctions.resetSortingAlgorithms(G.barArray, G.animationArray);
  }

  public void reset() {
    G.barArray.rebuildArray(G.numBars);
    G.barAnimationArray = G.barArray.copyBarArray();
    G.animationArray = new AnimationArray(G.barAnimationArray);

    G.buttonFunctions.resetSortingAlgorithms(G.barArray, G.animationArray);
  }

  // update numBars slider

  public void plusOne() {
    sliderNumBars++;
  }

  public void plusTen() {
    sliderNumBars+=10;
  }

  public void plusOneHundred() {
    sliderNumBars+=100;
  } 

  public void minusOne() {
    sliderNumBars--;
  }

  public void minusTen() {
    sliderNumBars-=10;
  }

  public void minusOneHundred() {
    sliderNumBars-=100;
  }
}
