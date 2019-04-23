class DateUtil {
  DateUtil._();

  static String formatDurationTime(int time) {
    try {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time);
      Duration duration = DateTime.now().difference(dateTime);
      print(
          'inDays: ${duration.inDays}, inHours: ${duration.inHours}, inMinutes: ${duration.inMinutes}');

      if (duration.inDays > 2) {
        return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
      }
      if (duration.inDays > 1) {
        return '2天前';
      }

      if (duration.inDays > 0) {
        return '1天前';
      }

      if (duration.inHours > 0) {
        return '${duration.inHours}小时前';
      }

      if (duration.inMinutes > 0) {
        return '${duration.inMinutes}分钟前';
      }
      return '刚刚';
    } catch (e) {
      print('error: $e');
      return '';
    }
  }
}
