int bgColRed, bgColGreen, bgColBlue;
Button resetButton, saveButton;
ScreenshotHelper screenshotHelper;
ParticleController pc;

void setup() {
  size(1000, 1000);
  //bgColRed = 15;
  //bgColGreen = 15;
  //bgColBlue = 15;
  bgColRed = (int)random(0, 80);
  bgColGreen = (int)random(0, 80);
  bgColBlue = (int)random(0, 80);

  pc = new ParticleController();
  resetButton = new Button(width/2 - 80, height-25, 100, 25, "RESET");
  saveButton = new Button(width/2 + 80, height-25, 100, 25, "SAVE");
  screenshotHelper = new ScreenshotHelper();
}

void draw() {
  background(bgColRed, bgColGreen, bgColBlue);

  // translate canvas forth and back for spiral view
  translate(width/2, height/2);
  pc.runParticles();
  translate(-width/2, -height/2);

  // buttons
  resetButton.drawButton();
  saveButton.drawButton();
}

void mouseClicked() {
  // RESET
  if (resetButton.mouseIsOverButton()) {
    setup();
  }

  // SAVE
  if (saveButton.mouseIsOverButton()) {
    saveButton.hide();
    resetButton.hide();
    draw();
    screenshotHelper.shot();
    saveButton.retrieve();
    resetButton.retrieve();
  }
}
