void setupButtons() {

  // begin controlP5
  cp5 = new ControlP5(this);

  int sideButtonWidth = (width/8);
  int topButtonWidth = (width * 7)/32;
  int buttonHeight = (height/6);

  doSort = cp5.addButton("doSort")
    .setPosition(0, 0)
    .setFont(buttonLabelFont)
    .setLabel("SORT")
    .setSize(sideButtonWidth, buttonHeight)
    .setColorBackground(color(90, 90, 90))
    .setColorForeground(color(90, 90, 90))
    .setColorActive(color(90, 90, 90));

  mergeSort = cp5.addButton("mergeSort")
    .setPosition((width/8), 0)
    .setFont(buttonLabelFont)
    .setLabel("MERGESORT")
    .setSize(topButtonWidth, buttonHeight)
    .setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));

  selectionSort = cp5.addButton("selectionSort")
    .setPosition((width/8)+topButtonWidth, 0)
    .setFont(buttonLabelFont)
    .setLabel("SELECTIONSORT")
    .setSize(topButtonWidth, buttonHeight)
    .setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));

  quickSort = cp5.addButton("quickSort")
    .setPosition((width/8)+(2*topButtonWidth), 0)
    .setFont(buttonLabelFont)
    .setLabel("QUICKSORT")
    .setSize(topButtonWidth, buttonHeight)
    .setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));

  bubbleSort = cp5.addButton("bubbleSort")
    .setPosition((width/8)+(3*topButtonWidth), 0)
    .setFont(buttonLabelFont)
    .setLabel("BUBBLESORT")
    .setSize(topButtonWidth+5, buttonHeight)
    .setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));

  pause = cp5.addButton("pause")
    .setPosition(0, buttonHeight)
    .setFont(buttonLabelFont)
    .setLabel("PAUSE")
    .setSize(sideButtonWidth, buttonHeight)
    .setColorBackground(color(90, 90, 90))
    .setColorForeground(color(90, 90, 90))
    .setColorActive(color(90, 90, 90));

  stopSort = cp5.addButton("stopSort")
    .setFont(buttonLabelFont)
    .setLabel("STOP")
    .setPosition(0, 2*buttonHeight)
    .setSize(sideButtonWidth, buttonHeight)
    .setColorBackground(color(90, 90, 90))
    .setColorForeground(color(90, 90, 90))
    .setColorActive(color(90, 90, 90));

  reset = cp5.addButton("randomizeBars")
    .setFont(buttonLabelFont)
    .setLabel("RANDOMIZE")
    .setPosition(0, 3*buttonHeight)
    .setSize(sideButtonWidth, buttonHeight)
    .setColorBackground(color(#7E6B8F))
    .setColorForeground(color(#8D78A0))
    .setColorActive(color(#9D85B2));

  plusOneHundred = cp5.addButton("plusOneHundred")
    .setPosition(5*(sideButtonWidth/6), 4*buttonHeight)
    .setSize(sideButtonWidth/6, 25)
    .setColorBackground(color(#F2E94E))
    .setColorForeground(color(#F7EF54))
    .setColorActive(color(#FFF65B))
    .setLabel("+100")
    .setColorLabel(0);

  plusTen = cp5.addButton("plusTen")
    .setPosition(4*(sideButtonWidth/6), 4*buttonHeight)
    .setSize(sideButtonWidth/6, 25)
    .setColorBackground(color(#F2E94E))
    .setColorForeground(color(#F7EF54))
    .setColorActive(color(#FFF65B))
    .setLabel("+10")
    .setColorLabel(0);

  plusOne = cp5.addButton("plusOne")
    .setPosition(3*(sideButtonWidth/6), 4*buttonHeight)
    .setSize(sideButtonWidth/6, 25)
    .setColorBackground(color(#F2E94E))
    .setColorForeground(color(#F7EF54))
    .setColorActive(color(#FFF65B))
    .setLabel("+1")
    .setColorLabel(0);

  minusOne = cp5.addButton("minusOne")
    .setPosition(2*(sideButtonWidth/6), 4*buttonHeight)
    .setSize(sideButtonWidth/6, 25)
    .setColorBackground(color(#F2E94E))
    .setColorForeground(color(#F7EF54))
    .setColorActive(color(#FFF65B))
    .setLabel("-1")
    .setColorLabel(0);

  minusTen = cp5.addButton("minusTen")
    .setPosition((sideButtonWidth/6), 4*buttonHeight)
    .setSize(sideButtonWidth/6, 25)
    .setColorBackground(color(#F2E94E))
    .setColorForeground(color(#F7EF54))
    .setColorActive(color(#FFF65B))
    .setLabel("-10")
    .setColorLabel(0);

  minusOneHundred = cp5.addButton("minusOneHundred")
    .setPosition(0, 4*buttonHeight)
    .setSize(sideButtonWidth/6, 25)
    .setColorBackground(color(#F2E94E))
    .setColorForeground(color(#F7EF54))
    .setColorActive(color(#FFF65B))
    .setLabel("-100")
    .setColorLabel(0);

  setNumOfBars = cp5.addSlider("numOfBars")
    .setMin(2)
    .setMax(1024)
    .setValue(8)
    .setPosition(0, 4*buttonHeight+25)
    .setSize(sideButtonWidth, 2*buttonHeight-25)
    .setColorBackground(color(#96E6B3))
    .setColorForeground(color(#DA3E52))
    .setColorActive(color(#DA3E52))
    .setColorValueLabel(color(0));

  cp5.getController("numOfBars").getValueLabel().align(ControlP5.RIGHT_OUTSIDE, ControlP5.TOP).setPaddingX(10).setPaddingY(50);

  setTimeScale = cp5.addSlider("timeScale")
    .setMin(1)
    .setMax(240)
    .setValue(1)
    .setLabel("SPEED")
    .setPosition(width - sideButtonWidth/6, 4*buttonHeight+25)
    .setSize(sideButtonWidth/6, 2*buttonHeight-25)
    .setColorBackground(color(#96E6B3))
    .setColorForeground(color(#DA3E52))
    .setColorActive(color(#DA3E52))
    .setColorValueLabel(color(0))
    .setColorCaptionLabel(color(0));
  cp5.getController("timeScale").getCaptionLabel().align(ControlP5.CENTER, ControlP5.TOP_OUTSIDE).setPaddingX(40).setPaddingY(5);
  cp5.getController("timeScale").getValueLabel().align(ControlP5.LEFT_OUTSIDE, ControlP5.TOP).setPaddingX(10).setPaddingY(50);
  // end controlP5
}
