
class WeatherModel{
  final double minTemp;
  final double maxTemp;
  final double temp;
  final String cityName;
  final DateTime date;
  final String? image;
  final String stateWeather;

  WeatherModel({
    required this.minTemp,
    required this.maxTemp,
    required this.temp,
    required this.cityName,
    required this.date,
     this.image,
    required this.stateWeather,
});

 factory WeatherModel.fromJson( json){
    return WeatherModel(
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        stateWeather: json['forecast']['forecastday'][0]['day']['condition']['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}