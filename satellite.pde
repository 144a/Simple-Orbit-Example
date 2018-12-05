public class satellite {

  private float xpos;
  private float ypos;
  private float vx;
  private float vy;
  private float size;
  private float deltatime;
  private float totaltime;
  
  satellite(float ixpos, float iypos, float angle, float velocity, float isize, float timeDiff) {
    this.xpos = ixpos;
    this.ypos = iypos;
    this.vx = velocity * degrees(cos(radians(angle)));
    this.vy = velocity * degrees(sin(radians(angle)));
    this.size = isize;
    this.deltatime = timeDiff;
    this.totaltime = 0;
    
  }
  
  public float getXpos() {
    return this.xpos;
  }
  
  public float getYpos() {
    return this.ypos;
  }
  
  public float getVx() {
    return this.vx;
  }
  
  public float getVy() {
    return this.vy;
  }
  
  public float getSize() {
    return size;
  }
  
  public float getDeltatime() {
    return this.deltatime;
  }
  
  public float getTotaltime() {
    return this.totaltime;
  }
  
  public void setXpos(float n) {
    this.xpos = n;
  }
  
  public void setYpos(float n) {
    this.ypos = n;
  } 
  
  public void setVx(float n) {
    this.vx = n;
  }
  
  public void setVy(float n) {
    this.vy = n;
  }
  
  public void setSize(float n) {
    this.size = n;
  }
  
  public void setDeltatime(float n) {
    this.deltatime = n;
  }
  
  public void setTotaltime(float n) {
    this.totaltime = n;
  }
  
  public void updateSatellite() {
    
    // increase total time past by delta time
    this.totaltime += this.deltatime;
    
    // calculating the distance between star and satellite
    float r = sqrt(pow(this.xpos, 2) + pow(this.ypos, 2));
    float a = (g * m) / (r * r);
    
    // calculating x and y acceleration components
    float ax = -1 * a * (this.xpos / r);
    float ay = -1 * a * (this.ypos / r);  
    
    // updating x and y velocity components
    this.vx = this.vx + ax * totaltime;
    this.vy = this.vy + ay * totaltime;
    
    // updating x and y coordinates
    this.xpos = this.xpos + vx * totaltime;
    this.ypos = this.ypos + vy * totaltime;
  }
  
  
}
