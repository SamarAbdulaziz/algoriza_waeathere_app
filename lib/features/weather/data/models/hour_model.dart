import 'package:weather/core/utiles/convertTimeStamp.dart';
import 'package:weather/features/weather/domain/entities/hour.dart';

class HourModel extends Hour {
  HourModel({
    required String timeEpoch,
    required String time,
    required int tempC,
    required int chanceOfRain,
  }) : super(
            time: time,
            timeEpoch: timeEpoch,
            tempC: tempC,
            chanceOfRain: chanceOfRain);

  factory HourModel.fromJson(Map<String, dynamic> json) => HourModel(
        // timeEpoch: convertTimestampIntoDatetime(json["time_epoch"]),
        timeEpoch: convertTimestampIntoHour(json["time_epoch"]),
        time: json["time"],
        tempC: json["temp_c"].round(),
        chanceOfRain: json["chance_of_rain"],
      );
}
