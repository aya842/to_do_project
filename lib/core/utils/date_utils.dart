
import 'package:intl/intl.dart';

// String toDateFormatted(DateTime date) {
//   DateFormat formatter=DateFormat("dd/MM/YYYY");
//   return formatter.format(date);
//
// }
extension  DateFormatEx on DateTime{
  String get toFormattedDate=>'$day $month $year';
  String get dayName{
    List<String>Days=['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
    return Days[weekday-1];// it return the index from one that bdgin form Sun
  }
  String get getDayName {
  DateFormat formatter=DateFormat('E');
  return formatter.format(this);

}
}