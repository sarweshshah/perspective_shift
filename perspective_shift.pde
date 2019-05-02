KinectController kinectController;
float mappedX, mappedY;

void settings() {
  fullScreen(2);
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

  ellipse(mappedX, mappedY, 15, 15);
}
