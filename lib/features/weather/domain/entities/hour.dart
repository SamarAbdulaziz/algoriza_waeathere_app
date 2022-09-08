import 'package:equatable/equatable.dart';

class Hour extends Equatable {
  final String timeEpoch;
  final String time;
  final int tempC;
  final int chanceOfRain;

  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.chanceOfRain,
  });

  @override
  List<Object> get props => [
        timeEpoch,
        time,
        tempC,
        chanceOfRain,
      ];
}
