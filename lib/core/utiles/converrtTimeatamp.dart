//todo find suitable place for this fn
import 'package:intl/intl.dart';

String convertTimestampIntoDatetime(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String convertedTime = DateFormat('h:mm a').format(date);
  return convertedTime;
}