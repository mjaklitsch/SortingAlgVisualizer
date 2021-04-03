class BarArray {
  // implements and builds a Bar arraylist
  private int numBars;
  private float minBarSize, maxBarSize, workingWidth, workingHeight, ceilingHeight, wallOffset, gapWideness, barWideness;

  private color defaultBlueColor = color(0, 0, 200);
  private color defaultCompareColor = color(200, 0, 0);
  private color defaultSelectColor = color(130, 100, 0);
  private color defaultBoundColor = color(0, 200, 0);

  private ArrayList<Bar> barArrayList = new ArrayList<Bar>();
  private ArrayList<Integer> bounds = new ArrayList<Integer>();

  private void buildArrayList() {
    for (int i = 0; i < this.numBars; i++) {
      float barTallness = random(this.minBarSize, this.maxBarSize);

      Bar randomBar = new Bar(barTallness, defaultBlueColor);
      this.barArrayList.add(randomBar);
    }
  }

  public BarArray(int numBars, float ceilingHeight, float wallOffset, boolean fillArray) {
    this.numBars = numBars;

    this.workingWidth = width - wallOffset;
    this.workingHeight = height - ceilingHeight;

    this.ceilingHeight = ceilingHeight;
    this.wallOffset = wallOffset;

    this.minBarSize = workingHeight / 16; 
    this.maxBarSize = this.minBarSize * 15; 

    int gaps = this.numBars+1;
    this.gapWideness = this.workingWidth / (this.numBars*2+gaps);
    this.barWideness = this.gapWideness * 2;

    if (fillArray) {
      buildArrayList();
    }
  }

  public void drawBars() {
    for (int i = 0; i < this.numBars; i++) {
      float barX = this.wallOffset + this.gapWideness + (i * (this.gapWideness + this.barWideness));
      this.barArrayList.get(i).drawBar(barX, this.ceilingHeight, this.barWideness);
    }
  }

  public void drawBounds() {
    int sz = this.bounds.size();
    for (int location = 0; location < sz; location++) {
      float x = this.wallOffset + (.5*this.gapWideness) + (this.bounds.get(location) 
        * (this.gapWideness + this.barWideness));
      float y1 = this.ceilingHeight;
      float y2 = height-y1;
      float w = min(2, this.gapWideness * .75); // arbitrary width of line

      boolean isMid = sz == 3 && location == 1;
      if (isMid) { // 
        fill(this.defaultSelectColor);
      } else {
        fill(this.defaultBoundColor);
      }
      rect(x - w/2, y1, w, y2);
    }
  }

  public void setBounds(ArrayList<Integer> bounds) {
    this.bounds = bounds;
  }

  public void clearBounds() {
    this.bounds.clear();
  }

  public void rebuildArray(int expectedNumBars) {
    this.numBars = expectedNumBars;
    int gaps = this.numBars+1;
    this.gapWideness = this.workingWidth / (this.numBars*2+gaps);
    this.barWideness = this.gapWideness * 2;

    this.barArrayList.clear();
    buildArrayList();
  }

  public void swapBars(int index1, int index2) {
    Bar bar1 = this.barArrayList.get(index1);
    Bar bar2 = this.barArrayList.get(index2);

    this.barArrayList.set(index1, bar2);
    this.barArrayList.set(index2, bar1);
  }

  public void insertBar(int newIndex, int barIndex) {
    this.barArrayList.add(newIndex, this.barArrayList.remove(barIndex));
  }

  public boolean isFirstTallerThanSecondBar(int index1, int index2) {
    return getTallness(index1) > getTallness(index2);
  }

  public void setDefaultColor(int index) {
    this.barArrayList.get(index).setColor(this.defaultBlueColor);
  }
  public void setSelectColor(int index) {
    this.barArrayList.get(index).setColor(this.defaultSelectColor);
  }
  public void setCompareColor(int index) {
    this.barArrayList.get(index).setColor(this.defaultCompareColor);
  }
  public void setBoundColor(int index) {
    this.barArrayList.get(index).setColor(this.defaultBoundColor);
  }

  public BarArray copyBarArray() {

    BarArray dupArray = new BarArray(this.numBars, this.ceilingHeight, this.wallOffset, false);
    ArrayList<Bar> dupBarArrayList = new ArrayList<Bar>();

    for (Bar bar : this.barArrayList) { // make a deep copy of every bar into a new arraylist
      Bar dupBar = bar.copyBar();
      dupBarArrayList.add(dupBar);
    }

    dupArray.setBarArrayList(dupBarArrayList);
    return dupArray;
  }

  public ArrayList<Bar> getBarArrayList() {
    return this.barArrayList;
  }

  public Bar getBar(int i) {
    return this.barArrayList.get(i);
  }

  public int getNumBars() {
    return this.numBars;
  }
  public float getTallness(int i) {
    return this.barArrayList.get(i).getTallness();
  }

  public void setBarArrayList(ArrayList<Bar> barArrayList) {
    this.barArrayList = barArrayList;
  }
}
