import 'package:flutter/widgets.dart';

class DateUtil {
  DateUtil._();

  static String formatDisplayTime(String time, String pattern) {
    String display = '';
    int tMin = 60 * 1000;
    int tHour = 60 * tMin;
    int tDay = 24 * tHour;

    if (time != null) {
      if (pattern == null) {
        pattern = 'yyyy-MM-dd HH:mm:ss';
      }

      try {
        DateTime dateTime = DateTime.parse(time);
        DateTime now = DateTime.now();
        print('dateTime: ${dateTime.toString()}');
        print('${now.toString()}');
      } catch (e) {}
    }
  }
}
