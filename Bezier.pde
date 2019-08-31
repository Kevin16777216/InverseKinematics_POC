public class Bezier{
  private PVector start = IKDefaults.ZERO;
  private PVector end = IKDefaults.WINDOW_CORNER;
  //Good enough resolution up to QHD displays
  private final int MAX_POINTS = 32;
  private ArrayList<PVector> handles = new ArrayList<PVector>();
  private PVector[] points;
  private PVector[] tmp_Points;
  public Bezier(PVector[] inputPoints){
    try{
      if(inputPoints.length < 2){
        throw new IllegalArgumentException("Length of points is too long/short. (2-12)");
      }
      points = new PVector[MAX_POINTS];
      start = inputPoints[0];
      handles.add(start);
      int i = 0;
      while(++i < inputPoints.length){
        handles.add(inputPoints[i]);
      }
      end = inputPoints[i-1];
      handles.add(end);
    }catch (Exception e){
      e.printStackTrace();
    }
  }
  public void renderHandles(){
    renderPoints(handles);
  }
  public void renderPath(){
    renderPoints(points);
  }
  public void renderPoints(PVector[] points){
    PVector p1 = points[0];
    PVector p2;
    for(int i = 1; i < points.length;++i){
      p2 = points[i];
      line(p1.x,p1.y,p2.x,p2.y);
      p1 = p2;
    }
  }
  public void renderPoints(ArrayList<PVector> points){
    PVector p1 = points.get(0);
    PVector p2;
    for(int i = 1; i < points.size(); ++i){
      p2 = points.get(i);
      line(p1.x,p1.y,p2.x,p2.y);
      p1 = p2;
    }
  }
  public void calcPoints(){
    points[0] = start;
    points[points.length-1] = end;
    tmp_Points = new PVector[handles.size()];
    for(int mul = MAX_POINTS; mul > 1;calcPoints(mul/=2));
  }
  private void calcPoints(int resolution){
    final int skip = 2*resolution;
    while(resolution < MAX_POINTS){
      points[resolution] = calcPoint((float)resolution/MAX_POINTS);
      resolution += skip;
    }
  }
  private PVector calcPoint(float t){
    PVector tmp_Next,tmp_Current;
    for(int i = 0; i < handles.size();tmp_Points[i] = handles.get(i++));
    for(int checkEnd = tmp_Points.length ;checkEnd != 1;checkEnd--){
      tmp_Current = tmp_Points[0];
      for(int i = 1;i < checkEnd;){
        tmp_Next = tmp_Points[i];
        tmp_Points[i++-1] = PVector.lerp(tmp_Current,tmp_Next,t);
        tmp_Current = tmp_Next;
      }
    }
    return tmp_Points[0];
  }
}
