public class TimeDebug{
  private int start;
  public TimeDebug(){
    start = millis();
  }
  public void startTime(){
    start = millis();
  }
  public void stopTime(){
    System.out.println(millis() - start);
  }
}
