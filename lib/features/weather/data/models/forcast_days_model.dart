import 'package:weather/core/utiles/convertTimeStamp.dart';
import 'package:weather/features/weather/data/models/astro_model.dart';
import 'package:weather/features/weather/data/models/day_model.dart';
import 'package:weather/features/weather/data/models/hour_model.dart';
import 'package:weather/features/weather/domain/entities/day.dart';
import 'package:weather/features/weather/domain/entities/forcast_days.dart';
import 'package:weather/features/weather/domain/entities/hour.dart';

import '../../domain/entities/astro.dart';

class ForecastdayModel extends Forecastday {
  ForecastdayModel({
    required DateTime date,
    required String dtHour,
    required String dtDay,
    required Day day,
    required Astro astro,
    required List<Hour> hour,
  }) : super(
          date: date,
          dtHour: dtHour,
          dtDay:dtDay ,
          day: day,
          astro: astro,
          hour: hour,
        );

  factory ForecastdayModel.fromJson(Map<String, dynamic> json) =>
      ForecastdayModel(
        date: DateTime.parse(json["date"]),
        dtHour: convertTimestampIntoHour(json["date_epoch"] ),
        dtDay:convertTimestampToDay(json["date_epoch"] ) ,
        day: DayModel.fromJson(json["day"]),
        astro: AstroModel.fromJson(json["astro"]),
        hour: List<Hour>.from(json["hour"].map((x) => HourModel.fromJson(x))),
      );
}
