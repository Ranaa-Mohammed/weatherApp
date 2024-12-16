import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';


class WeatherService{

 final Dio dio;


 WeatherService(this.dio);
final String baseUrl = 'http://api.weatherapi.com/v1';
 final String apikey = '664c6462a4d348d6b6a171738231311';

 Future<WeatherModel> getCurrentWeather ({required String cityName}) async {
  try {
   Response response = await dio.get(
       '$baseUrl/forecast.json?key=$apikey&q=$cityName');
   WeatherModel weatherModel = WeatherModel.fromJson(response.data);
   return weatherModel;
  }
  on DioException catch (e) {
   final String errorMessage = e.response?.data['error']['message'] ?? 'oops there was an error , try later';
   throw Exception(errorMessage);
  } catch(e){
   throw Exception('oops there was an error , try later' );
  }
 }
 }
