import 'package:weather/features/weather/domain/entities/location.dart';

class LocationModel extends Location {
  LocationModel({
    required final String name,
    required final String country,
    required final double lat,
    required final double lon,
    required final int localtimeEpoch,
    required final String localtime,
  }) : super(
          name: name,
          country: country,
          lat: lat,
          lon: lon,
          localtimeEpoch: localtimeEpoch,
          localtime: localtime,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        name: json["name"],
        country: json["country"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );
}
