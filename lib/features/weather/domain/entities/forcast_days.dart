import 'package:equatable/equatable.dart';
import 'package:weather/features/weather/domain/entities/astro.dart';
import 'package:weather/features/weather/domain/entities/day.dart';
import 'package:weather/features/weather/domain/entities/hour.dart';

class Forecastday extends Equatable {
  final DateTime date;
  final String dtHour; //timeStamp
  final String dtDay; //timeStamp
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  Forecastday({
    required this.date,
    required this.dtHour,
    required this.dtDay,
    required this.day,
    required this.astro,
    required this.hour,
  });

  @override
  List<Object> get props => [date, dtHour, dtDay, day, astro, hour];
}
