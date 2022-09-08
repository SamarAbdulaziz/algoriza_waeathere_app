class AppConstants{
  static const String baseUrl='https://api.openweathermap.org/data/2.5';
  static const String apiKey='148ed91fbbb09faf739bdfb485d07279';
  static  String getWeatherByCityNamePath(String cityName)=>'$baseUrl/weather?q=$cityName&units=metric&appid=$apiKey';
  static  String getWeatherDetailsByCityNamePath(String cityName)=>'$baseUrl/forecast?q=$cityName&units=metric&appid=$apiKey';

   static const String baseUrlNew='https://api.weatherapi.com/v1';
  static const String apiKeyNew='fe8322e4b42e4259a85234610220709';
  static  String getWeatherByCityNamePathNew(String cityName)=>'$baseUrlNew/forecast.json?key=$apiKeyNew&q=$cityName&days=7&aqi=no&alerts=no';


}
//https://api.openweathermap.org/data/2.5/weather?q=alexandria&units=metric&appid=148ed91fbbb09faf739bdfb485d07279
//https://api.openweathermap.org/data/2.5/forecast?q=cairo&appid=148ed91fbbb09faf739bdfb485d07279
//https://api.weatherapi.com/v1/forecast.json?key=fe8322e4b42e4259a85234610220709&q=alexandria&days=7&aqi=no&alerts=no