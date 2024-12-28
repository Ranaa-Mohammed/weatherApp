import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import '../components/noWeatherBody.dart';
import '../components/weather_info_body.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';


class homeView extends StatelessWidget {
  const homeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,
        title: Text(
            'Weather App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchView(),),);
          },
              icon: Icon(Icons.search,
                color: Colors.white,
              ),
          ),
        ],
      ),
      body: BlocBuilder <GetWeatherCubit , WeatherState> (
        builder: (context,state) {
          if(state is NoWeatherState){
            return NoWeatherBody();
          } else if(state is WeatherLoadedState){

            return WeatherInfoBody();
          } else {
            return Text('oops there was an error');
          }
        },
      ),
    );
  }
}
