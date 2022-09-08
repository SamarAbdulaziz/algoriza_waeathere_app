import 'package:equatable/equatable.dart';

class Day extends Equatable {
  final int maxtempC;
  final int mintempC;
  final int dailyChanceOfRain;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.dailyChanceOfRain,
  });

  @override
  List<Object> get props => [
        maxtempC,
        mintempC,
        dailyChanceOfRain,
      ];
}
