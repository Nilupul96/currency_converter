import 'package:intl/intl.dart';

class Utils {
  static getFormattedDate(String date, {String dateFormat = "yyyy-MMM-dd"}) {
    try {
      return DateFormat(dateFormat).format(DateTime.parse(date));
    } catch (e) {
      return "";
    }
  }

  static getFormattedTime(String date) =>
      DateFormat("hh:mm a").format(DateTime.parse(date));
}
