import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor; 

PImage crab;
PImage kid;
PImage ocean;
PImage sand;
PImage sea;
PImage ear;

PImage spoon;
PImage mother;
PImage food;
PImage silver;
PImage matrix;
PImage hammer;

PImage camera;
PImage eyes;
PImage girl;
PImage memory;
PImage party;
PImage pics;

void setup() {
  size(1280, 960);
  frameRate(100);

  background(0);
  
  sea = loadImage("sea.png"); 
  ear = loadImage("ear.png");
  crab = loadImage("crab.jpg");
  kid = loadImage("kid.png");
  ocean = loadImage("ocean.jpg");
  sand = loadImage("sand.jpeg");
  
  
  spoon = loadImage("spoon.png");
  mother = loadImage("mother.jpg");
  food = loadImage("food.jpg");
  silver = loadImage("silver.jpeg");
  matrix = loadImage("matrix.jpg");
  hammer = loadImage("hammer.jpg");
  
  camera = loadImage("camera.jpg");
  eyes = loadImage("eyes.jpg");
  girl = loadImage("girl.jpg");
  memory = loadImage("memory.jpg");
  party = loadImage("party.jpg");
  pics = loadImage("pics.jpg");
  

//  String[] cameras = Capture.list();
//  printArray(cameras);
  video = new Capture(this, 1280, 960, "FaceTime HD Camera", 30);
//  video = new Capture(this, 1280, 960, cameras[3]);

  video.start();
  // Start off tracking for red
  trackColor = color(200, 0, 0);//r,g,b
}

void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}

void draw() {
  video.loadPixels();
  //image(video, 0, 0);
         if (millis() < 5*10000) {
     image(ear, 10, 10, ear.width/2, ear.height/2);
     image(crab, width/2, 100, crab.width/2, crab.height/2);
     image(kid, width/1.5, 10, kid.width/10, kid.height/10);
     image(ocean, 10, height/2.2, ocean.width/10, ocean.height/10);
     image(sand, width/2, height/2, sand.width/2, sand.height/2);
     image(sea, width/1.1, height/2, sea.width/10, sea.height/10);
     }
     if (millis() > 5*30000){
      image(camera, 200, 10, camera.width/2, camera.height/2);
      image(eyes, width/3, 10, eyes.width/10, eyes.height/10);
      image(girl, width/1.3, 10, girl.width/10, girl.height/10);
      image(memory, 10, height/1.9, memory.width/2, memory.height/2);
      image(party, width/2.3, height/2, party.width/2, party.height/2);
      image(pics, width/1.4, height/2.7, pics.width/3, pics.height/3);
     
     }
    if (millis() > 5*60000) {
      image(spoon, 200, height/3, spoon.width/2, spoon.height/2);
      image(mother, width/3, height/5, mother.width/2, mother.height/2);
      image(food, width/1.5, height/4, food.width/5, food.height/5);
      image(silver, 10, height/2.7, silver.width/2, silver.height/2);
      image(hammer, width/4, height/2, hammer.width/2, hammer.height/2);
      image(matrix, width/1.4, height/1.8, matrix.width/5, matrix.height/5);
 
    }

  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord = 500; 

  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }


  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if (worldRecord < 100) { 
    // Draw a circle at the tracked pixel
    fill(255);
    noStroke();
    ellipse(closestX, closestY, 5, 5);
    
    //line(1, 1, closestX, closestY);
   
  }
}
/*
void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}
*/
