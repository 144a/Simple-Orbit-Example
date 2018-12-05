
ArrayList<satellite> objects = new ArrayList<satellite>();

public float starX = 250;
public float starY = 250;
public float g = 6.674 * pow(10, -11);
public float m = 56000000000000.0;

void setup() {
  size(500, 500);
  noStroke();
  background(0);
  fill(255);
  objects.add(new satellite(50.0, 50.0, 270, 0.1, 10, .0001));
}

void draw() {
  background(0);
  ellipse(starX, starY, 30, 30);
  delay(10);
  for(int i = 0; i < objects.size(); i++) {
    ellipse(objects.get(i).getXpos() + starX, objects.get(i).getYpos() + starY, objects.get(i).getSize(), objects.get(i).getSize());
    objects.get(i).updateSatellite();
    // println(objects.get(i).getXpos() + objects.get(i).getVx() * objects.get(i).getTotaltime() );
  }
  CleanUpSatellites();
}

void mouseReleased() {
  objects.add(new satellite(mouseX - starX, mouseY - starY, 270, 0.1, 10, .0001));
  
}


public void CleanUpSatellites() {
  for(int i = 0; i < objects.size(); i++) {
    if(objects.get(i).getXpos() < starX * -1 || objects.get(i).getXpos() > starX || objects.get(i).getYpos() < starY * -1 || objects.get(i).getYpos() > starY) {
      objects.remove(i);
      i--;
    }
      
  }
}
