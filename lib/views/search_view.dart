import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.blue,
        title: Text(
            'Search City',
          style: TextStyle(
           // color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            onFieldSubmitted: (value)  async{
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
           decoration: InputDecoration(
             contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(16),
               borderSide: BorderSide(
                 color: Colors.blue,
               ),
             ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              labelText: 'Search',
              labelStyle: TextStyle(color: Colors.blue,),
              hintText: 'Enter City Name',
             suffixIcon: Icon(Icons.search,color: Colors.blue,)
           ),
          ),
        ),
      ),
    );
  }
}