class TimeUtil {
  TimeUtil.init();
  static TimeUtil instance = TimeUtil.init();


  String formatTime(int totalSecond) {
    int hours = totalSecond ~/ 3600;
    int minutes = (totalSecond % 3600) ~/ 60;
    int seconds = totalSecond % 60;
    return "${hours.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  }

}