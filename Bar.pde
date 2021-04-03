class Bar {
  private float tallness;
  private color c;

  public Bar( float tallness, color c) {
    this.tallness = tallness;

    this.c = c;
  }

  public void drawBar(float x, float y, float wideness) { 
    fill(this.c);
    noStroke();
    rect(x, y, wideness, this.tallness);
  }

  public Bar copyBar() {
    return new Bar(this.tallness, this.c);
  }

  public float getTallness() {
    return this.tallness;
  }

  public void setTallness(float tallness) {
    this.tallness = tallness;
  }

  public void setColor(color c) {
    this.c = c;
  }
}
