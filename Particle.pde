class Particle {

  int x, y, pSize;
  int pColRedMax, pColGreenMax, pColBlueMax, pColRed, pColGreen, pColBlue, strokeColRed, strokeColGreen, strokeColBlue, alpha, strokeAlpha, strokeWeight;

  Particle(int x, int y, int pSize) {
    this(pSize);
    this.x = x;
    this.y = y;
  }

  Particle(int pSize) {
    this();
    this.pSize = pSize;
  }

  Particle() {
    applyDefaultColorProperties();
  }

  void applyDefaultColorProperties() {
    this.pColRedMax = 255;
    this.pColRed = pColRedMax;
    this.pColGreenMax = 255;
    this.pColGreen = pColGreenMax;
    this.pColBlueMax = 255;
    this.pColBlue = pColBlueMax;

    this.strokeColRed = 255;
    this.strokeColGreen = 255;
    this.strokeColBlue = 255;

    this.strokeAlpha = 0;
    this.strokeWeight = 2;
    this.alpha = 100;
  }

  //////

  void drawParticle() {
    fill(pColRed, pColGreen, pColBlue, alpha);
    stroke(strokeColRed, strokeColGreen, strokeColBlue, strokeAlpha);
    strokeWeight(strokeWeight);
    ellipse(x, y, pSize, pSize);
  }

  void setXY(int x, int y) {
    this.x = x;
    this.y = y;
  }

  //////

  void setPSize(int pSize) {
    this.pSize = pSize;
  }

  void setPSizeRandom() {
    this.pSize = (int)random(5, 50);
  }

  //////

  void setColor(int r, int g, int b) {
    this.pColRedMax = r;
    this.pColRed = r;
    this.pColGreenMax = g;
    this.pColGreen = g;
    this.pColBlueMax = b;
    this.pColBlue = b;
  }

  void setColorRandom(int rMax, int gMax, int bMax) {
    this.pColRedMax = (int)random(0, rMax);
    this.pColRed = pColRedMax;
    this.pColGreenMax = (int)random(0, gMax);
    this.pColGreen = pColGreenMax;
    this.pColBlueMax = (int)random(0, bMax);
    this.pColBlue = pColBlueMax;
  }

  //////

  void setAlpha(int alpha) {
    this.alpha = alpha;
  }

  void setAlphaRandom(int alphaMax) {
    this.alpha = (int)random(40, alphaMax);
  }

  void setStrokeAlpha(int strokeAlpha) {
    this.strokeAlpha = strokeAlpha;
  }

  void setStrokeColorRandom() {
    this.strokeColRed = (int)random(0, 255);
    this.strokeColGreen = (int)random(0, 255);
    this.strokeColBlue = (int)random(0, 255);
  }

  void setStrokeColor(int r, int g, int b) {
    this.strokeColRed = r;
    this.strokeColGreen = g;
    this.strokeColBlue = b;
  }
}
