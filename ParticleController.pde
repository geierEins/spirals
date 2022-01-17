class ParticleController {

  Particle[] particleArray;
  int pCount, rSpiralMax, rSpiralMin, pSize;
  float degree, degreeMin, degreeMax, rNew;


  ParticleController() {
    // apply properties here
    applyRandomSpiralProperties();
    //applyDefaultSpiralProperties();
    // create particle array to store particles
    particleArray = new Particle[pCount];
    // create particles
    createParticlesAndPutThemInArray();
    // apply particle properies
    applyParticleProperties();
  }


  void runParticles() {
    for (int i = 0; i < particleArray.length; i++) {
      particleArray[i].drawParticle();
    }
  }

  void createParticlesAndPutThemInArray() {
    for (int i = 0; i < particleArray.length; i++) {
      particleArray[i] = new Particle();
    }
  }

  // X&Y for each particle
  void setXYForEachParticle(String strategy) {
    for (int i = 0; i < particleArray.length; i++) {
      switch(strategy) {
      case "RANDOM" :
        particleArray[i].setXY((int)random(0, width), (int)random(0, height));
        break;
      case "SPIRAL" :
        degree = map(i, 0, particleArray.length, degreeMin, degreeMax);
        rNew = map(i, 0, particleArray.length, rSpiralMax, rSpiralMin);
        particleArray[i].setXY(
          (int)(sin(radians(degree)) * rNew),
          (int)(cos(radians(degree)) * rNew));
        break;
      }
    }
  }

  // SIZE for each particle
  void setSizeForEachParticle(String strategy, int pSize) {
    int nextSize;
    for (int i = 0; i < particleArray.length; i++) {
      switch(strategy) {
        case("UNIQUE") :
        particleArray[i].setPSize(pSize);
        break;
        case("ASCENDING") :
        nextSize = (int)map(i, 0, particleArray.length, 0, pSize);
        particleArray[i].setPSize(nextSize);
        break;
        case("DESCENDING") :
        nextSize = (int)map(i, 0, particleArray.length, pSize, 0);
        particleArray[i].setPSize(nextSize);
        break;
      case "RANDOM" :
        particleArray[i].setPSize((int)random(1, pSize));
        break;
      }
    }
  }
  // COLOR for each particle
  void setColorForEachParticle(String strategy, int r, int g, int b) {
    for (int i = 0; i < particleArray.length; i++) {
      switch(strategy) {
        case("UNIQUE") :
        particleArray[i].setColor(r, g, b);
        break;
        case("RANDOM") :
        particleArray[i].setColorRandom(r, g, b);
        break;
      }
    }
  }

  // ALPHA for each particle
  void setAlphaForEachParticle(String strategy, int alpha) {
    for (int i = 0; i < particleArray.length; i++) {
      switch(strategy) {
        case("UNIQE") :
        particleArray[i].setAlpha(alpha);
        break;
        case("RANDOM") :
        particleArray[i].setAlphaRandom(alpha);
        break;
        case("NOFILL") :
        particleArray[i].setAlpha(0);
        break;
      }
    }
  }

  // STROKE for each particle
  void setStrokeForEachParticle(String strategy) {
    for (int i = 0; i < particleArray.length; i++) {
      switch(strategy) {
        case("NOSTROKE") :
        particleArray[i].setStrokeAlpha(0);
        break;
        case("RANDOM") :
        particleArray[i].setStrokeColorRandom();
        particleArray[i].setStrokeAlpha(200);
        break;
        case("BACKGROUND") :
        particleArray[i].setStrokeAlpha(200);
        particleArray[i].setStrokeColor(bgColRed, bgColGreen, bgColBlue);
        break;
      }
    }
  }
  void setStrokeForEachParticle(String strategy, int r, int g, int b) {
    for (int i = 0; i < particleArray.length; i++) {
      switch(strategy) {
        case("UNIQUE") :
        particleArray[i].setStrokeAlpha(200);
        particleArray[i].setStrokeColor(r, g, b);
        break;
      }
    }
  }

  //---------

  void applyDefaultSpiralProperties() {
    this.rSpiralMin = 50;
    this.rSpiralMax = 500;
    this.degreeMin = 0;
    this.degreeMax = 1080;
    this.pSize = 50;
  }

  void applyRandomSpiralProperties() {
    this.pCount = (int)random(20, 300);
    this.rSpiralMin = (int)random(0, 100);
    this.rSpiralMax = (int)random(100, width);
    this.degreeMin = 0;
    this.degreeMax = (int)random(90, 2160);
  }

  void applyParticleProperties() {
    setXYForEachParticle("SPIRAL");                    // X&Y:    "SPIRAL", "RANDOM"
    setSizeForEachParticle("RANDOM", 70);              // SIZE:   "UNIQUE", "RANDOM", "DESCENDING", "ASCENDING"
    setColorForEachParticle("RANDOM", 255, 255, 255);  // COLOR:  "UNIQUE", "RANDOM"
    setAlphaForEachParticle("RANDOM", 150);            // ALPHA:  "UNIQUE", "RANDOM", "NOFILL"
    setStrokeForEachParticle("NOSTROKE");              // STROKE: "UNIQUE", "RANDOM", "NOSTROKE", "BACKGROUND"
  }
}
