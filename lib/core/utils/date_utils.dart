
import 'package:intl/intl.dart';

// String toDateFormatted(DateTime date) {
//   DateFormat formatter=DateFormat("dd/MM/YYYY");
//   return formatter.format(date);
//
// }
extension  DateFormat on DateTime{
  String get toFormattedDate=>'$day $month $year';
}