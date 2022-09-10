import 'package:intl/intl.dart';

String convertTimestampIntoHour(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String convertedTime = DateFormat('h a').format(date);
  return convertedTime;
}

String convertTimestampToDay(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String selectedDay = DateFormat('EEEE').format(date);
  return selectedDay;
}
