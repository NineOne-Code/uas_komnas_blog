import 'package:intl/intl.dart';

class DateHelper {
  static DateTime toDateTime(String dateString) {
    DateFormat dateFormat = DateFormat("dd MM yyyy");
    return dateFormat.parse(dateString.trim());
  }

  /// Contoh : 25 Oktober 2009
  static String humans(DateTime date) =>
      DateFormat('dd MMMM yyyy').format(date);
}
