import 'package:equatable/equatable.dart';

class Current extends Equatable {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final int tempC;
  final int windKph;
  final int humidity;
  final int feelslikeC;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.windKph,
    required this.humidity,
    required this.feelslikeC,
  });

  @override
  List<Object> get props => [
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        windKph,
        humidity,
        feelslikeC,
      ];
}
