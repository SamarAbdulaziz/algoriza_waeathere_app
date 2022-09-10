import 'package:equatable/equatable.dart';

class Day extends Equatable {
  final int maxtempC;
  final int mintempC;
  final int dailyChanceOfRain;
  final String icon;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.dailyChanceOfRain,
    required this.icon,
  });

  @override
  List<Object> get props => [
        maxtempC,
        mintempC,
        dailyChanceOfRain,
        icon,
      ];
}
