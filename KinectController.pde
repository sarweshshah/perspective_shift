import java.util.List;
import org.openkinect.processing.*;

Kinect2 kinect2 = new Kinect2(this);

class KinectController extends PApplet {
  float kinMinThresh = 900;
  float kinMaxThresh = 970;
  PImage img;
  float avgX, avgY;

  void settings() {
    size(kinect2.depthWidth, kinect2.depthHeight);

    kinect2.initDepth();
    kinect2.initDevice();
    img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
    
    this.avgX = 0;
    this.avgY = 0;
  }

  void draw() {
    img.loadPixels();

    // Get the raw depth as array of integers
    int[] depth = kinect2.getRawDepth();

    float sumX = 0;
    float sumY = 0;
    float totalPixels = 0;

    for (int x = 0; x < kinect2.depthWidth; x++) {
      for (int y = 0; y < kinect2.depthHeight; y++) {      
        int offset = x + y * kinect2.depthWidth;
        int d = depth[offset];

        if (d > kinMinThresh && d < kinMaxThresh) {
          img.pixels[offset] = color(255, 0, 150);
          sumX += x;
          sumY += y;
          totalPixels++;
        } else {
          img.pixels[offset] = color(51);
        }
      }
    }

    img.updatePixels();
    image(img, 0, 0);

    this.avgX = sumX / totalPixels;
    this.avgY = sumY / totalPixels;

    if (totalPixels >= 900) {
      fill(150, 0, 255);
      ellipse(avgX, avgY, 15, 15);
    }
  }
}
