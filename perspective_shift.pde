KinectController kinectController;
float mappedX, mappedY;

void settings() {
  //fullScreen(P3D, 2);
  size(800, 600, P3D);
}

void setup() {
  kinectController = new KinectController();
  String[] args = {"Kinect tracking window"};
  PApplet.runSketch(args, kinectController);
}

void draw() {
  background(51);

  mappedX = map(kinectController.avgX, 0, kinect2.depthWidth, 0, width);
  mappedY = map(kinectController.avgY, 0, kinect2.depthHeight, 0, height);

  stroke(255);
  strokeWeight(5);
  noFill();
  
  pushMatrix();
  translate(abs(width - mappedX), abs(height - mappedY), 0);
  box(160);
  popMatrix();
  
  pushMatrix();
  translate(abs(width - mappedX + 140), abs(height - mappedY + 130), 0);
  box(100, 44, 520);
  popMatrix();
  
  perspective();
}
