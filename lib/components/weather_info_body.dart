import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';


class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {

   var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
         children: [
              Text(weatherModel.cityName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
                      Image(
                        image: NetworkImage(
                              'https:${weatherModel.image}',
                        ),
                      ),
              SizedBox(width: 50,),
              Text(
                    weatherModel.temp.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(width: 40,),
              Column(
                children: [
                  Text('Maxtemp: ${weatherModel.maxTemp.round()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text('Mintemp: ${weatherModel.minTemp.round()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(weatherModel.stateWeather,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
