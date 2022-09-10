import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String name;
  final String country;
  final double lat;
  final double lon;
  final int localtimeEpoch;
  final String localtime;

  Location({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localtimeEpoch,
    required this.localtime,
  });

  @override
  List<Object> get props => [
        name,
        country,
        lat,
        lon,
        localtimeEpoch,
        localtime,
      ];
}
