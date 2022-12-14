import 'package:weather/features/weather/domain/entities/day.dart';

class DayModel extends Day {
  DayModel({
    required final int maxtempC,
    required final int mintempC,
    required final int dailyChanceOfRain,
    required final String icon,
  }) : super(
    maxtempC: maxtempC,
          mintempC: mintempC,
          dailyChanceOfRain: dailyChanceOfRain,
          icon: icon,
        );

  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
        maxtempC: json["maxtemp_c"].round(),
        mintempC: json["mintemp_c"].round(),
        dailyChanceOfRain: json["daily_chance_of_rain"],
        icon: json["condition"]["icon"],
      );
}
