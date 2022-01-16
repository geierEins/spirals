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
    setXYForEachParticle("SPIRAL");
    setSizeForEachParticle("RANDOM", 70);
    setColorForEachParticle("RANDOM", 255, 255, 255);
    setAlphaForEachParticle("RANDOM", 150);
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

  // X & Y for each particle
  void setXYForEachParticle(String strategy) {
    for (int i = 0; i < particleArray.length; i++) {
      switch(strategy) {
      case "RANDOM" :
        // random placement
        particleArray[i].setXY((int)random(0, width), (int)random(0, height));
        break;
      case "SPIRAL" :
        // spiral
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
        // unique size
        particleArray[i].setPSize(pSize);
        break;
        case("ASCENDING") :
        // descending/ascending size
        nextSize = (int)map(i, 0, particleArray.length, 0, pSize);
        particleArray[i].setPSize(nextSize);
        break;
        case("DESCENDING") :
        // descending/ascending size
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
}
