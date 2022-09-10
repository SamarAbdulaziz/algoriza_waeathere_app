import 'package:weather/features/weather/domain/entities/current.dart';

class CurrentModel extends Current {
  CurrentModel({
    required final int lastUpdatedEpoch,
    required final String lastUpdated,
    required final int tempC,
    required final int windKph,
    required final int humidity,
    required final int feelslikeC,
    required final String icon,
  }) : super(
    lastUpdatedEpoch: lastUpdatedEpoch,
          lastUpdated: lastUpdated,
          tempC: tempC,
          windKph: windKph,
          feelslikeC: feelslikeC,
          humidity: humidity,
          icon: icon,
        );

  factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"].round(),
        windKph: json["wind_kph"].round(),
        humidity: json["humidity"],
        feelslikeC: json["feelslike_c"].round(),
        icon: json["condition"]["icon"],
      );

}
