Bezier k;
int y = 0;
TimeDebug timer = new TimeDebug();
PVector a,b,c,d;
ArrayList<Bezier> stressTest = new ArrayList<Bezier>();
void setup(){
  size(2560,1440);
  IKDefaults.WINDOW_CORNER = new PVector(width,height);
  a = new PVector(10,0);
  b = new PVector(850,1440);
  c = new PVector(1700,0);
  d = new PVector(2560,1440);
  PVector[] test = new PVector[] {a,b,c,d};
  k = new Bezier(test);
  for(int i = 0; i < 8;i++){
    stressTest.add(new Bezier(test));
  }
  smooth(16);
  for(Bezier i: stressTest){
    i.calcPoints();
    i.renderHandles();
    i.renderPath();
  }
}
void draw(){
  clear();
  timer.startTime();
  stroke(0,255,0);
  strokeWeight(5);
  for(Bezier i: stressTest){
    i.renderHandles();
  }
  stroke(255);
  strokeWeight(5);
  for(Bezier i: stressTest){
    i.calcPoints();
    i.renderPath();
  }
  timer.stopTime();
  System.gc();
  a.y+=2;
  a.y%=1440;
  b.y-=2;
  b.y%=1440;
  c.y+=2;
  c.y%=1440;
  //c.y = 200+y%720*2;
  //b.x = 40+y%600;
  y = y %2000;
  y++;
}
