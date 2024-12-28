
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

import 'cubits/get_weather_cubit/get_weather_cubit.dart';
void main() {
 runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(NoWeatherState()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // useMaterial3: false,
          primarySwatch: Colors.teal,
        ),
        home: homeView(),
      ),
    );
  }
}
