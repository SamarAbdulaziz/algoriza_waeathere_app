class AppConstants{
  static const String baseUrl='https://api.openweathermap.org/data/2.5';
  static  String getWeatherByCityNamePath(String cityName)=>'$baseUrl/weather?q=$cityName&units=metric&appid=$apiKey';
  static  String getWeatherDetailsByCityNamePath(String cityName)=>'$baseUrl/forecast?q=$cityName&units=metric&appid=$apiKey';
}
//https://api.openweathermap.org/data/2.5/weather?q=alexandria&units=metric&appid=148ed91fbbb09faf739bdfb485d07279
//https://api.openweathermap.org/data/2.5/forecast?q=cairo&appid=148ed91fbbb09faf739bdfb485d07279