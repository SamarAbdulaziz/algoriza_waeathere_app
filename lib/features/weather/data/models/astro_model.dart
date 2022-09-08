import 'package:weather/features/weather/domain/entities/astro.dart';

class AstroModel extends Astro {
  AstroModel({
    required final String sunrise,
    required final String sunset,
  }) : super(
          sunrise: sunrise,
          sunset: sunset,
        );

  factory AstroModel.fromJson(Map<String, dynamic> json) => AstroModel(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

}
