private double fractionLength = 1; 
private int smallestBranch = 1; 
private double branchAngle = .7;  
public void setup() 
{   
  size(640, 480);    
  noLoop();
} 
public void draw() 
{   
  background(0);   
  stroke(0, 255, 0);   
  line(320, 480, 320, 380);   
  drawBranches(320, 380, 200, 3*Math.PI/2);  //will add later
} 
public void drawBranches(int x, int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1)+x);
  int endY1 = (int)(branchLength*Math.sin(angle1)+y);
  int endX2 = (int)(branchLength*Math.cos(angle2)+x);
  int endY2 = (int)(branchLength*Math.sin(angle2)+y);
  int centerX = (endX1 + endX2)/2;
  int centerY = (endY1 + endY2)/2;
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  line(x, y, centerX, centerY);
  if (branchLength <= smallestBranch) {
    return;
  } else {
    drawBranches(endX1, endY1, branchLength/2, angle1);
    drawBranches(endX2, endY2, branchLength/2, angle2);
    drawBranches(centerX,centerY,branchLength/2,angle);
  }
} 


public void keyTyped() {
  if (key == 'w') {
    if (fractionLength <= 0.9) {
      fractionLength+= .1;
      redraw();
    }
  }
  if (key == 's') {
    if(fractionLength >= 0) {
    fractionLength-= .1;
    redraw();
    }
  }
  if (key == 'e') {
    branchAngle+= .1;
    redraw();
  }
  if (key == 'd') {
    branchAngle-= .1;
    redraw();
  }
  if (key == 'r') {
    if (smallestBranch <= 10) {
      smallestBranch++;
      redraw();
    } else {
      smallestBranch = 1;
      redraw();
    }
  }
}
